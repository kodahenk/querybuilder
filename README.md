## Response:
### QueryBuilderService Kullanım Kılavuzu

`QueryBuilderService`, Laravel projelerinde dinamik ve esnek SQL sorguları oluşturmanıza olanak tanıyan bir servis sunar. Bu kılavuz, servisin nasıl kullanılacağına, dikkat edilmesi gereken noktalara ve örnek kullanım senaryolarına dair detayları içerir.

---

## 1\. Servis Kurulumu

### 1.1. Servis Dosyasının Oluşturulması

Servisi, Laravel projenizde `app/Services` dizinine ekleyin. Aşağıda örnek bir `QueryBuilderService` sınıfı bulunmaktadır:

```php
<?php

namespace App\Services;

use Illuminate\Http\Request;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;

class QueryBuilderService
{
    protected $model;
    protected $query;

    public function buildQuery(Request $request)
    {
        // Get URL parameters
        $table = $request->input('table');
        $select = $request->input('select');
        $limit = $request->input('limit');
        $page = $request->input('page');

        // Get JSON body parameters
        $conditions = $request->input('conditions', []);
        $relations = $request->input('relations', []);
        $condition_logic = $request->input('condition_logic', null);
        $format = $request->input('format', 'json');
        $order_by = $request->input('order_by');
        $order_direction = $request->input('order_direction', 'asc');

        // Initialize model and query based on the table parameter
        $this->initializeModel($table);

        // Apply select clause
        $this->applySelect($select);

        // Apply conditions
        $this->applyConditions($conditions, $condition_logic);

        // Apply relations and their conditions
        $this->applyRelations($relations);

        // Apply ordering
        $this->applyOrder($order_by, $order_direction);

        // Apply limit and pagination
        $this->applyLimitAndPagination($limit, $page);

        // Execute query and get results
        $results = $this->query->get();
        
        // Return results in specified format
        return $this->formatResults($results, $format);
    }

    protected function initializeModel($table)
    {
        // Map table names to model classes
        $modelMapping = [
            'posts' => \App\Models\Post::class,
            'users' => \App\Models\User::class,
            "categories" => \App\Models\Category::class,
            "tags" => \App\Models\Tag::class,
            "comments" => \App\Models\Comment::class,
            "likes" => \App\Models\Like::class,
            // Add other table-model mappings here
        ];

        if (array_key_exists($table, $modelMapping)) {
            $this->model = new $modelMapping[$table];
            $this->query = $this->model->newQuery();
        } else {
            throw new \Exception("Model for table {$table} not found.");
        }
    }

    protected function applySelect($select)
    {
        if ($select) {
            $this->query->select(explode(',', $select));
        }
    }

    protected function applyConditions($conditions, $condition_logic)
    {
        if ($conditions) {
            $conditionGroups = [];
            $currentGroup = [];
            $operator = 'and';

            foreach ($conditions as $condition) {
                if (isset($condition['group']) && $condition['group']) {
                    if ($currentGroup) {
                        $conditionGroups[] = [$operator => $currentGroup];
                        $currentGroup = [];
                    }
                    $operator = $condition['group'];
                } else {
                    $currentGroup[] = [
                        'field' => $condition['field'],
                        'operator' => $condition['operator'],
                        'value' => $condition['value']
                    ];
                }
            }
            if ($currentGroup) {
                $conditionGroups[] = [$operator => $currentGroup];
            }

            $this->applyConditionGroups($conditionGroups, $condition_logic);
        }
    }

    protected function applyConditionGroups($conditionGroups, $condition_logic)
    {
        foreach ($conditionGroups as $group) {
            foreach ($group as $operator => $conditions) {
                $queryMethod = $operator === 'and' ? 'where' : 'orWhere';
                $this->query->$queryMethod(function ($query) use ($conditions) {
                    foreach ($conditions as $condition) {
                        $query->where($condition['field'], $condition['operator'], $condition['value']);
                    }
                });
            }
        }
    }

    protected function applyRelations($relations)
    {
        if (is_array($relations)) {
            foreach ($relations as $relation => $relationDetails) {
                $this->query->with([$relation => function ($query) use ($relationDetails) {
                    if (isset($relationDetails['conditions']) && is_array($relationDetails['conditions'])) {
                        foreach ($relationDetails['conditions'] as $condition) {
                            $query->where($condition['field'], $condition['operator'], $condition['value']);
                        }
                    }
                    if (isset($relationDetails['relations']) && is_array($relationDetails['relations'])) {
                        $this->applyRelationsToQuery($query, $relationDetails['relations']);
                    }
                }]);
            }
        }
    }

    protected function applyRelationsToQuery($query, $relations)
    {
        foreach ($relations as $relation => $relationDetails) {
            $query->with([$relation => function ($query) use ($relationDetails) {
                if (isset($relationDetails['conditions']) && is_array($relationDetails['conditions'])) {
                    foreach ($relationDetails['conditions'] as $condition) {
                        $query->where($condition['field'], $condition['operator'], $condition['value']);
                    }
                }
                if (isset($relationDetails['relations']) && is_array($relationDetails['relations'])) {
                    $this->applyRelationsToQuery($query, $relationDetails['relations']);
                }
            }]);
        }
    }

    protected function applyOrder($order_by, $order_direction)
    {
        if ($order_by) {
            $this->query->orderBy($order_by, $order_direction);
        }
    }

    protected function applyLimitAndPagination($limit, $page)
    {
        if ($limit) {
            $this->query->limit($limit);
        }

        if ($page) {
            $this->query->offset(($page - 1) * $limit);
        }
    }

    protected function formatResults($results, $format)
    {
        if ($format === 'json') {
            return response()->json($results);
        } elseif ($format === 'xml') {
            $xml = new \SimpleXMLElement('<root/>');
            array_walk_recursive($results->toArray(), array($xml, 'addChild'));
            return response($xml->asXML(), 200)->header('Content-Type', 'text/xml');
        }

        return $results;
    }
}
```

---

## 2\. Servisin Kullanımı

### 2.1. Controller Entegrasyonu

Servisi bir controller içinde kullanarak HTTP isteklerini işleyebilirsiniz. Örnek bir controller:

```php
<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Services\QueryBuilderService;

class QueryController extends Controller
{
    protected $queryBuilderService;

    public function __construct(QueryBuilderService $queryBuilderService)
    {
        $this->queryBuilderService = $queryBuilderService;
    }

    public function index(Request $request)
    {
        try {
            // QueryBuilderService'i kullanarak sorguyu oluştur ve sonuçları al
            return $this->queryBuilderService->buildQuery($request);
        } catch (\Exception $e) {
            // Hata durumunda JSON formatında hata mesajı döner
            Log::error('QueryBuilderService Error: '.$e->getMessage(), ['exception' => $e]);
            return response()->json(['error' => $e->getMessage()], 400);
        }
    }
}
```

---

## 3\. İstek Yapma

Servise HTTP POST isteği yaparak sorgu oluşturabilirsiniz. Aşağıda çeşitli senaryolarla istek örnekleri verilmiştir.

### 3.1. Basit Sorgu

```http
POST /data HTTP/1.1
Host: querybuilder.test
Content-Type: application/json

{
    "table": "posts"
}
```

### 3.2. Seçim Yaparak Sorgu

```http
POST /data HTTP/1.1
Host: querybuilder.test
Content-Type: application/json

{
    "table": "posts",
    "select": "id,title"
}
```

### 3.3. Limit ve Sayfalama ile Sorgu

```http
POST /data HTTP/1.1
Host: querybuilder.test
Content-Type: application/json

{
    "table": "posts",
    "limit": 10,
    "page": 2
}
```

### 3.4. Koşul Ekleyerek Sorgu

```http
POST /data HTTP/1.1
Host: querybuilder.test
Content-Type: application/json

{
    "table": "posts",
    "conditions": [
        {
            "field": "status",
            "operator": "=",
            "value": "published"
        }
    ]
}
```

### 3.5. İlişkiler ile Sorgu

```http
POST /data HTTP/1.1
Host: querybuilder.test
Content-Type: application/json

{
    "table": "posts",
    "relations": {
        "comments": {
            "select": "id, content, created_at",
            "order_by": "created_at",
            "order_direction": "desc"
        }
    }
}
```

### 3.6. Koşul ve Sıralama ile Sorgu

```http
POST /data HTTP/1.1
Host: querybuilder.test
Content-Type: application/json

{
    "table": "posts",
    "conditions": [
        {
            "field": "status",
            "operator": "=",
            "value": "published"
        }
    ],
    "order_by": "created_at",
    "order_direction": "desc"
}
```

### 3.7. İç İçe İlişkiler ile Sorgu

```http
POST /data HTTP/1.1
Host: querybuilder.test
Content-Type: application/json

{
    "table": "posts",
    "relations": {
        "comments": {
            "select": "id, content, created_at",
            "order_by": "created_at",
            "order_direction": "desc",
            "relations": {
                "replies": {
                    "select": "id, content, created_at",
                    "order_by": "created_at",
                    "order_direction": "desc"
                }
            }
        }
    }
}
```

### 3.8. Karmaşık Koşul ve Sıralama ile Sorgu

```http
POST /data HTTP/1.1
Host: querybuilder.test
Content-Type: application/json

{
    "table": "posts",
    "conditions": [
        {
            "field": "status",
            "operator": "=",
            "value": "published"
        }
    ],
    "order_by": "created_at",
    "order_direction": "desc",
    "relations": {
        "comments": {
            "select": "id, content, created_at",
            "order_by": "created_at",
            "order_direction": "desc"
        }
    }
}
```

### 3.9. Karmaşık İç İçe İlişkiler ile Sorgu

```http
POST /data HTTP/1.1
Host: querybuilder.test
Content-Type: application/json

{
    "table": "posts",
    "relations": {
        "comments": {
            "select": "id, content, created_at",
            "order_by": "created_at",
            "order_direction": "desc",
            "conditions": [
                {
                    "field": "status",
                    "operator": "=",
                    "value": "active"
                }
            ],
            "relations": {
                "replies": {
                    "select": "id, content, created_at",
                    "order_by": "created_at",
                    "order_direction": "desc"
                }
            }
        }
    }
}
```

---

## 4\. Dikkat Edilmesi Gerekenler

### 4.1. Güvenlik

* **Kullanıcı Girdisi Doğrulama:** Kullanıcıdan alınan verileri doğru şekilde doğrulamak ve sanitizasyon yapmak önemlidir. Bu, SQL enjeksiyonları gibi güvenlik açıklarını önlemeye yardımcı olur.

### 4.2. Performans

* **Sorgu Optimizasyonu:** Büyük veri setleri üzerinde sorgular çalıştırırken performansı göz önünde bulundurun. Limit ve pagination kullanarak sorguların verimli çalışmasını sağlayın.

### 4.3. İlişkiler

* **İlişki Tanımları:** Eloquent ilişkilerinin doğru tanımlandığından ve ilişkilerin yüklenme yöntemlerinin doğru kullanıldığından emin olun. Yanlış ilişki tanımları performans sorunlarına yol açabilir.

### 4.4. Hata Yönetimi

* **Hata Loglama:** Servis içinde oluşan hataları loglayarak izlenebilirliğini artırın. Bu, sorunları hızlıca tespit etmenize yardımcı olur.

### 4.5. Format Seçimi

* **JSON ve XML:** Verilerin formatını belirlerken ihtiyaçlarınıza göre JSON veya XML formatını seçin. XML için uygun MIME türünü belirlediğinizden emin olun.

---

Bu kılavuz, `QueryBuilderService`'in nasıl kullanılacağını ve dikkat edilmesi gereken önemli noktaları kapsar. Servisi projenize entegre ederken bu bilgiler doğrultusunda hareket etmek, daha sağlam ve verimli bir yapı oluşturmanıza yardımcı olacaktır.


## Response:
Tabii, çok daha karmaşık sorgular ve bu sorguların nasıl yapılandırılacağına dair detayları ekleyelim. Bu örneklerde, iç içe ilişkiler, karmaşık koşullar ve sıralama gibi özellikleri kullanarak dinamik sorgular oluşturacağız.

---

## 5\. Karmaşık Sorgu Örnekleri

### 5.1. İç İçe Koşullar ve İlişkiler

#### Örnek İstek:

```http
POST /data HTTP/1.1
Host: querybuilder.test
Content-Type: application/json

{
    "table": "posts",
    "conditions": [
        {
            "field": "status",
            "operator": "=",
            "value": "published"
        },
        {
            "group": "or",
            "conditions": [
                {
                    "field": "title",
                    "operator": "like",
                    "value": "%Laravel%"
                },
                {
                    "field": "content",
                    "operator": "like",
                    "value": "%framework%"
                }
            ]
        }
    ],
    "relations": {
        "comments": {
            "select": "id, content, created_at",
            "order_by": "created_at",
            "order_direction": "desc",
            "conditions": [
                {
                    "field": "status",
                    "operator": "=",
                    "value": "approved"
                }
            ],
            "relations": {
                "replies": {
                    "select": "id, content, created_at",
                    "order_by": "created_at",
                    "order_direction": "asc",
                    "conditions": [
                        {
                            "field": "status",
                            "operator": "=",
                            "value": "visible"
                        }
                    ]
                }
            }
        }
    },
    "order_by": "created_at",
    "order_direction": "desc"
}
```

#### Açıklama:

Bu sorgu, `posts` tablosunda `status` alanı "published" olan kayıtları getirir. Ayrıca, başlık veya içerikte "Laravel" veya "framework" kelimeleri geçen kayıtları filtreler. Her postun `comments` ilişkisi `created_at` alanına göre sıralanır ve `status` alanı "approved" olan yorumları getirir. Yorumların `replies` ilişkisi ise `created_at` alanına göre sıralanır ve `status` alanı "visible" olan yanıtları getirir.

### 5.2. Karmaşık Sıralama ve Sayfalama

#### Örnek İstek:

```http
POST /data HTTP/1.1
Host: querybuilder.test
Content-Type: application/json

{
    "table": "posts",
    "conditions": [
        {
            "field": "status",
            "operator": "=",
            "value": "published"
        }
    ],
    "order_by": [
        {
            "field": "created_at",
            "direction": "desc"
        },
        {
            "field": "title",
            "direction": "asc"
        }
    ],
    "limit": 15,
    "page": 2
}
```

#### Açıklama:

Bu sorgu, `posts` tablosunda `status` alanı "published" olan kayıtları getirir. Kayıtlar önce `created_at` alanına göre azalan, sonra `title` alanına göre artan şekilde sıralanır. Sorgu sonuçları 15 kayıt ile sınırlıdır ve 2. sayfa verilerini getirir.

### 5.3. Karmaşık İlişkiler ve Koşul Gruplama

#### Örnek İstek:

```http
POST /data HTTP/1.1
Host: querybuilder.test
Content-Type: application/json

{
    "table": "products",
    "conditions": [
        {
            "field": "availability",
            "operator": "=",
            "value": "in_stock"
        },
        {
            "group": "or",
            "conditions": [
                {
                    "field": "price",
                    "operator": ">",
                    "value": 50
                },
                {
                    "field": "discount",
                    "operator": ">",
                    "value": 10
                }
            ]
        }
    ],
    "relations": {
        "categories": {
            "select": "id, name",
            "conditions": [
                {
                    "field": "status",
                    "operator": "=",
                    "value": "active"
                }
            ]
        },
        "reviews": {
            "select": "rating, comment, created_at",
            "order_by": "rating",
            "order_direction": "desc",
            "conditions": [
                {
                    "field": "status",
                    "operator": "=",
                    "value": "verified"
                }
            ]
        }
    },
    "order_by": [
        {
            "field": "price",
            "direction": "asc"
        },
        {
            "field": "created_at",
            "direction": "desc"
        }
    ]
}
```

#### Açıklama:

Bu sorgu, `products` tablosunda `availability` alanı "in\_stock" olan ürünleri getirir. Ürünler, `price` alanı 50'den büyük veya `discount` alanı 10'dan büyük olan ürünleri içerir. Her ürünün `categories` ilişkisi `status` alanı "active" olan kategorileri getirir. Ayrıca, `reviews` ilişkisi `rating` alanına göre sıralanır ve `status` alanı "verified" olan yorumları getirir. Sonuçlar önce `price` alanına göre artan, sonra `created_at` alanına göre azalan şekilde sıralanır.

### 5.4. İç İçe Koşullar ve Karmaşık İlişkiler

#### Örnek İstek:

```http
POST /data HTTP/1.1
Host: querybuilder.test
Content-Type: application/json

{
    "table": "orders",
    "conditions": [
        {
            "field": "status",
            "operator": "=",
            "value": "completed"
        },
        {
            "group": "and",
            "conditions": [
                {
                    "field": "order_date",
                    "operator": ">=",
                    "value": "2024-01-01"
                },
                {
                    "field": "order_date",
                    "operator": "<=",
                    "value": "2024-12-31"
                }
            ]
        }
    ],
    "relations": {
        "customer": {
            "select": "id, name, email",
            "conditions": [
                {
                    "field": "status",
                    "operator": "=",
                    "value": "active"
                }
            ]
        },
        "order_items": {
            "select": "id, product_name, quantity, price",
            "order_by": "product_name",
            "order_direction": "asc",
            "conditions": [
                {
                    "field": "quantity",
                    "operator": ">",
                    "value": 1
                }
            ]
        }
    },
    "order_by": "order_date",
    "order_direction": "desc"
}
```

#### Açıklama:

Bu sorgu, `orders` tablosunda `status` alanı "completed" olan siparişleri getirir. Ayrıca, siparişlerin tarih aralığının 2024 yılı içinde olup olmadığını kontrol eder. Her siparişin `customer` ilişkisi `status` alanı "active" olan müşterileri getirir. `order_items` ilişkisi `product_name` alanına göre sıralanır ve `quantity` alanı 1'den büyük olan ürünleri getirir. Sonuçlar `order_date` alanına göre azalan şekilde sıralanır.

### 5.5. Karmaşık Koşullar ve İç İçe İlişkiler

#### Örnek İstek:

```http
POST /data HTTP/1.1
Host: querybuilder.test
Content-Type: application/json

{
    "table": "articles",
    "conditions": [
        {
            "field": "status",
            "operator": "=",
            "value": "published"
        },
        {
            "group": "or",
            "conditions": [
                {
                    "field": "title",
                    "operator": "like",
                    "value": "%2024%"
                },
                {
                    "field": "content",
                    "operator": "like",
                    "value": "%innovation%"
                }
            ]
        }
    ],
    "relations": {
        "author": {
            "select": "id, name",
            "conditions": [
                {
                    "field": "status",
                    "operator": "=",
                    "value": "active"
                }
            ]
        },
        "tags": {
            "select": "name",
            "conditions": [
                {
                    "field": "type",
                    "operator": "=",
                    "value": "featured"
                }
            ]
        }
    },
    "order_by": [
        {
            "field": "published_at",
            "direction": "desc"
        },
        {
            "field": "title",
            "direction": "asc"
        }
    ],
    "limit": 20,
    "page": 1
}
```

#### Açıklama:

Bu sorgu, `articles` tablosunda `status` alanı "published" olan makaleleri getirir. Makale başlığı veya içeriğinde "2024" veya "innovation" kelimeleri geçen makaleleri filtreler. Her makalenin `author` ilişkisi `status` alanı "active" olan yazarları getirir. `tags` ilişkisi `type` alanı "featured" olan etiketleri getirir. Sonuçlar önce `published_at` alanına göre azalan, sonra `title` alanına göre artan şekilde sıralanır. Sonuçlar 20 kayıt ile sınırlıdır ve 1. sayfa verilerini getirir.

---

## 6\. Kullanım ve Dikkat Edilmesi Gerekenler

### 6.1. Güvenlik

* **Parametre Doğrulama:** Kullanıcıdan alınan veriler üzerinde gerekli doğrulamaları yapın. Özellikle ilişkiler ve koşullar için sağlanan parametreleri dikkatlice kontrol edin.
* **SQL Enjeksiyonlarından Korunma:** Kullanıcı girdilerini uygun şekilde filtreleyerek SQL enjeksiyonlarına karşı koruma sağlayın.

### 6.2. Performans

* **Sorgu Performansı:** Karmaşık sorguların performansını izleyin ve gerekli optimizasyonları yapın. Gereksiz `joins` ve alt sorgulardan kaçının.
* **Sayfalama ve Limit Kullanımı:** Büyük veri setleri ile çalışırken sayfalama ve limit kullanarak veritabanı sorgularının daha verimli çalışmasını sağlayın.

### 6.3. İlişki Yönetimi

* **Eloquent İlişkileri:** Eloquent ilişkilerini doğru şekilde tanımlayın ve ilişkilerin yüklenme yöntemlerini dikkatli kullanın.
* **Eager Loading:** İlişkili verileri `eager loading` kullanarak veritabanı sorgularının sayısını azaltın ve performansı artırın.

### 6.4. Hata Yönetimi

* **Hata Yönetimi:** Servis içinde oluşabilecek hataları loglayın ve kullanıcılara anlamlı hata mesajları gösterin.
* **Veri Doğrulama:** Gelen isteklerdeki verilerin doğruluğunu ve geçerliliğini kontrol edin.

### 6.5. Format ve Çıktı

* **JSON ve XML:** İhtiyacınıza göre JSON veya XML formatlarını kullanın. İstemci tarafında verilerin uygun formatta işlendiğinden emin olun.

---

Bu kılavuz, karmaşık sorgularla `QueryBuilderService` kullanımını ve dikkat edilmesi gereken önemli noktaları kapsar. Bu bilgiler, servisinizin esnekliğini ve verimliliğini artırarak daha etkili veri yönetimi sağlar.

