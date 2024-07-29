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

