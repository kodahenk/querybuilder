-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jul 26, 2024 at 01:46 PM
-- Server version: 8.0.30
-- PHP Version: 8.2.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `devorhan`
--

-- --------------------------------------------------------

--
-- Table structure for table `blocks`
--

CREATE TABLE `blocks` (
  `id` bigint UNSIGNED NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci,
  `post_id` bigint UNSIGNED NOT NULL,
  `order` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `blocks`
--

INSERT INTO `blocks` (`id`, `content`, `post_id`, `order`, `created_at`, `updated_at`) VALUES
(1, 'Maiores expedita dignissimos occaecati quam voluptatem explicabo explicabo ipsa. Fugiat veniam consequatur mollitia quisquam et doloribus. Culpa alias nisi sunt dolor est ipsa. Voluptatem ut quas tempora possimus eos.\n\nQuae consectetur sed aliquid accusantium. Vel ut ut veritatis delectus. Sed fugiat illo quo necessitatibus.', 1, 47, '2024-05-08 11:20:51', '2024-05-08 11:20:51'),
(2, 'Aspernatur omnis consequatur similique ipsa nemo voluptate dolores. Odit tempore vel ipsum et qui ut. Molestias commodi omnis debitis maiores.\n\nVeniam dignissimos inventore tenetur. Sequi beatae vel minima eveniet. Et recusandae vel delectus provident sed rerum reiciendis.', 2, 15, '2024-05-08 11:20:51', '2024-05-08 11:20:51'),
(3, 'Ipsam voluptas ipsa voluptas ipsum mollitia mollitia vel ut. Aspernatur sapiente et magnam accusamus sed. Itaque et nulla voluptatum laborum eum. Eos quidem reprehenderit quis praesentium.\n\nAmet a vel praesentium enim. Officia repellendus provident natus provident. Nam aperiam dolor in voluptas dignissimos nesciunt.', 2, 30, '2024-05-08 11:20:51', '2024-05-08 11:20:51'),
(4, 'Ut totam optio sed unde quasi quia error. Illum in similique voluptatibus et quis consequuntur molestiae. Voluptas deserunt exercitationem dolores voluptates. Ea veniam animi nihil. Cupiditate dignissimos expedita at suscipit rem.\n\nFacere tenetur earum placeat rem. Temporibus enim alias veritatis id mollitia officiis in sunt. Sunt eos numquam est cum.', 3, 50, '2024-05-08 11:20:51', '2024-05-08 11:20:51'),
(5, 'Amet accusamus in et quo. Nulla ducimus debitis magnam consequuntur.\n\nPlaceat adipisci quasi modi quas nisi. Similique dicta ullam dolor deleniti. Amet ipsa ut cum ipsa.', 4, 30, '2024-05-08 11:20:51', '2024-05-08 11:20:51'),
(6, 'Et non ea voluptas ullam molestiae est perferendis eius. Dolorem nobis non non aut. Sint minima dolorem enim rerum ad eligendi. Eaque optio dolorem dolores.\n\nSed adipisci expedita dignissimos temporibus voluptate et. Excepturi ratione dolorem molestiae repudiandae inventore vel. Velit dicta ut ex consequatur. Suscipit voluptates et et aliquam animi.', 4, 99, '2024-05-08 11:20:51', '2024-05-08 11:20:51'),
(7, 'Culpa hic accusantium sit reprehenderit. Illo voluptate repudiandae autem iusto doloremque minima. Eos repudiandae rem error. Consectetur vel expedita officia sunt molestiae quia quia.\n\nEt consequatur quisquam eos ut tenetur cum quidem in. Quibusdam asperiores quisquam aut minima. Repudiandae enim et et et.', 5, 1, '2024-05-08 11:20:51', '2024-05-08 11:20:51'),
(8, 'Voluptatem quisquam dolorem tempore quisquam animi. Rem dolorem dolores quidem eos aliquid debitis. Accusantium quo veniam qui. Quo eligendi officiis est voluptatem rerum consequatur velit.\n\nSed officia animi atque quidem qui exercitationem sit non. Itaque ex pariatur ut harum molestiae. Aliquid quis optio dolor. Voluptates qui aut qui quas. Qui et tenetur accusantium ut accusamus libero.', 5, 57, '2024-05-08 11:20:51', '2024-05-08 11:20:51'),
(9, 'Earum dolores et placeat sit est nemo. Delectus exercitationem quo et odit. Amet expedita numquam molestias.\n\nNon consequatur et laudantium aspernatur labore harum. Consequatur est omnis recusandae adipisci tenetur quia. Aperiam sunt accusantium non natus unde debitis.', 6, 82, '2024-05-08 11:20:51', '2024-05-08 11:20:51'),
(10, 'Eos veritatis at iusto et. Eaque in optio natus delectus ut cum. Aut ipsum delectus id impedit esse at est.\n\nAut molestiae perferendis ducimus omnis officia laboriosam in. Eligendi ullam suscipit in. Necessitatibus quis temporibus sapiente ratione. Consequatur mollitia in incidunt sequi praesentium voluptatem hic. Impedit aut qui exercitationem cupiditate.', 7, 29, '2024-05-08 11:20:51', '2024-05-08 11:20:51'),
(11, 'Id nihil repellat enim dolorum repellendus tempora velit. Cum repudiandae commodi sit itaque veritatis quia. Qui illo nam fugit eos autem est modi. Magni in omnis error non totam voluptatem est.\n\nTenetur sunt nulla nesciunt dolor maxime quaerat dolorum. Laboriosam sunt sint quis id. Sit officiis doloremque aut placeat omnis voluptas odit.', 7, 4, '2024-05-08 11:20:51', '2024-05-08 11:20:51'),
(12, 'Quaerat qui minima eveniet non aperiam doloribus dolorem. Molestiae ullam est deserunt. Magni eveniet ut similique non sit dolor provident.\n\nNeque fuga eius aperiam dolore cum et. At rerum commodi quis minima quae rerum. Voluptatem ut adipisci voluptates sunt officiis.', 8, 49, '2024-05-08 11:20:51', '2024-05-08 11:20:51'),
(13, 'Commodi officiis rerum laboriosam quidem sunt. Quam neque aspernatur consequatur repellat labore suscipit. Voluptas asperiores architecto earum est aperiam dolor fuga.\n\nEst ex hic non sit est qui. Amet aut voluptatum eligendi est. Deserunt velit sit aut esse corrupti. Explicabo inventore eos ut voluptates harum. Omnis qui repellendus hic odio.', 8, 52, '2024-05-08 11:20:51', '2024-05-08 11:20:51'),
(14, 'Omnis aliquid nulla illum aut quos voluptas id. Quia sint quo est ut amet sapiente. Laudantium molestiae eaque voluptatem quis. Occaecati velit repudiandae qui.\n\nRerum aperiam et debitis mollitia saepe quo. Possimus repudiandae vitae et iure ex. Minus eos aut voluptatem labore nam sunt. Quo eveniet incidunt qui omnis eum sed quisquam magni.', 8, 90, '2024-05-08 11:20:51', '2024-05-08 11:20:51'),
(15, 'Necessitatibus accusamus voluptatibus illum aut cupiditate. Commodi molestiae eius eum temporibus est placeat. Voluptatem quam ab et expedita. Non vel omnis ducimus doloribus.\n\nUt quidem itaque corporis qui non qui. Officia illum assumenda qui eos sit possimus. Voluptatem praesentium sed ea veritatis. In perspiciatis quo veritatis enim excepturi et.', 9, 22, '2024-05-08 11:20:51', '2024-05-08 11:20:51'),
(16, 'Sed totam voluptas suscipit quam consequatur nihil. Libero veritatis repellendus veniam voluptatem inventore dolores. Ex incidunt ipsa quisquam nihil unde.\n\nQuibusdam et voluptatibus voluptas molestiae voluptatem fugiat voluptate. Architecto veniam velit ea atque iste dolore omnis.', 9, 35, '2024-05-08 11:20:51', '2024-05-08 11:20:51'),
(17, 'Aliquid eius possimus aliquam delectus voluptatibus rerum. Quidem atque et ut repudiandae at doloribus ullam. Assumenda maiores neque ea qui. Est impedit maxime quasi at expedita.\n\nSaepe atque blanditiis ut. Sint non labore saepe ut. At ratione ea cupiditate est numquam eius et ea.', 9, 20, '2024-05-08 11:20:51', '2024-05-08 11:20:51'),
(18, 'Necessitatibus non recusandae doloremque eum itaque. Dolor saepe accusamus odit modi voluptas omnis et. Fugit est non sit incidunt consectetur excepturi quam.\n\nEt ducimus perspiciatis qui ducimus natus et. Omnis minima et voluptas necessitatibus nostrum illo. Ut voluptatibus corrupti voluptate est. Occaecati ex quis beatae eos corrupti aut possimus.', 10, 13, '2024-05-08 11:20:51', '2024-05-08 11:20:51'),
(19, 'Ratione explicabo est ipsum aut nesciunt omnis quod sequi. Eum nostrum tempora numquam et dolores. Doloribus et omnis esse quia enim et. Eos debitis assumenda repellendus enim qui dolorem.\n\nPossimus quae nulla temporibus explicabo rerum. Facere qui et quia nesciunt perferendis. Aut et tenetur vero. Maiores rerum eum ipsam vero consectetur expedita impedit.', 10, 34, '2024-05-08 11:20:51', '2024-05-08 11:20:51'),
(20, 'Repellendus voluptatem eaque distinctio illo sed. Vero quibusdam dolorem velit rerum quo atque. Dolor tenetur ad qui et. Aliquid pariatur ab velit.\n\nAut dolores error molestiae a et perferendis dolor corporis. Aut ut quos alias aspernatur dolores odit debitis. Deserunt veniam molestiae laborum. Est beatae enim odit quia.', 11, 86, '2024-05-08 11:20:51', '2024-05-08 11:20:51'),
(21, 'Aut velit eos sed qui sunt est fugiat. Omnis officiis recusandae voluptatem expedita et et quis pariatur. Sed odit adipisci et porro velit pariatur tenetur.\n\nEst atque est sapiente placeat et dolores dolores. Est est est aliquam cupiditate unde maiores omnis. Eos ut ab qui officia. Voluptatibus accusamus sint unde animi voluptatem.', 11, 97, '2024-05-08 11:20:51', '2024-05-08 11:20:51'),
(22, 'Perferendis consectetur illo illum eum pariatur aut. Veniam perferendis ut at et. Laborum et amet accusantium voluptatem non vel.\n\nIllum ducimus eveniet repellat quod et. Qui expedita alias occaecati esse neque. Rem minima earum quo delectus ut id. Enim aut temporibus quisquam qui optio est. Earum tempore modi ex.', 12, 46, '2024-05-08 11:20:51', '2024-05-08 11:20:51'),
(23, 'Dolorem quia est laboriosam laboriosam accusantium illo rem at. Animi et numquam incidunt ipsa unde aperiam deleniti. Nihil dicta sapiente dolor. Numquam iste rerum qui suscipit rerum.\n\nVelit incidunt quia maiores doloremque. Consequatur enim est illum porro quas voluptas aut rerum. Et eligendi aut labore ea consectetur voluptatem id. Aut qui aut beatae qui non ut velit alias.', 12, 39, '2024-05-08 11:20:51', '2024-05-08 11:20:51'),
(24, 'Similique qui quaerat eaque consequatur non sit. Minus quos enim dicta expedita corrupti quidem. Consequatur quia et possimus consequuntur dicta velit. Tenetur iure incidunt non nulla sint.\n\nLabore voluptatum autem iusto est ut odit iste. Voluptatibus quis expedita quo incidunt eos aut. Tenetur beatae esse quaerat expedita at sapiente aliquam molestiae.', 12, 16, '2024-05-08 11:20:51', '2024-05-08 11:20:51'),
(25, 'Quam tempora vero voluptas consequatur placeat. Asperiores pariatur ea ipsum. Ducimus adipisci vel sed qui saepe magnam et. Fugiat hic aut natus ducimus.\n\nTemporibus sed omnis consequatur at. Ut praesentium dolor in ut neque doloribus praesentium. Ratione minima eos quo quia aliquid maiores architecto.', 12, 27, '2024-05-08 11:20:51', '2024-05-08 11:20:51'),
(26, 'Repudiandae voluptas qui nobis qui rem omnis repellat. Officia perspiciatis maiores quae et rerum et minima.\n\nEveniet ut ipsa dignissimos rerum magni qui. Temporibus et nostrum voluptatem cumque dolorum dolorem. Perspiciatis ducimus sunt at exercitationem tempore nesciunt.', 13, 76, '2024-05-08 11:20:51', '2024-05-08 11:20:51'),
(27, 'Doloribus laudantium mollitia et magnam laboriosam. Ipsum qui quam nulla explicabo velit voluptatem.\n\nIllo vitae beatae deserunt impedit ab accusamus perspiciatis. Ducimus ea rem nemo dicta vel et nemo. Omnis pariatur cumque omnis quo consectetur et dignissimos. Rerum consequatur ut quasi magni dolorum.', 13, 54, '2024-05-08 11:20:51', '2024-05-08 11:20:51'),
(28, 'Itaque reiciendis et quia accusantium officia. Molestiae a nostrum velit qui ut nostrum.\n\nAut labore sit numquam. Modi consequatur repellendus voluptas velit quam. Provident voluptatum et corrupti sed quam quo.', 13, 63, '2024-05-08 11:20:51', '2024-05-08 11:20:51'),
(29, 'Voluptatem deleniti rerum sit ut illum inventore odio. Minus est quis dolor quam vero dolores molestias. Accusantium molestias recusandae ullam tempora aperiam ex maiores. Est hic nihil dignissimos voluptate qui.\n\nQuibusdam corporis assumenda voluptatum alias ex dolores omnis. Porro asperiores optio molestias. Vitae enim sint sed maiores iure vel. Aliquam atque qui omnis.', 13, 29, '2024-05-08 11:20:51', '2024-05-08 11:20:51'),
(30, 'Explicabo adipisci dicta est voluptate qui dolorem explicabo. Et culpa in vero. Iusto tempore aperiam sit et id in sed veniam. Ut incidunt vel a necessitatibus voluptatibus corporis dolor.\n\nConsequatur id ut facilis itaque voluptatem quam ea. Quasi vel aut tempore sunt sunt.', 13, 50, '2024-05-08 11:20:51', '2024-05-08 11:20:51'),
(31, 'Et beatae qui temporibus quisquam odit voluptas qui. Et ipsam repellendus repudiandae impedit vitae aperiam architecto. Est quo pariatur labore aliquid voluptas accusantium. Est voluptatibus officiis quo doloremque aut aut nobis sequi.\n\nNon illo quo voluptatum. Qui inventore aut corporis accusamus. Quibusdam atque molestias qui maxime qui et quibusdam eum. Inventore impedit aut error magni.', 14, 88, '2024-05-08 11:20:51', '2024-05-08 11:20:51'),
(32, 'Pariatur eligendi quidem voluptatibus qui. Voluptas praesentium mollitia harum ducimus officiis nesciunt. Autem possimus adipisci facere. Aliquam aliquam tempore debitis.\n\nPraesentium non qui id molestiae vitae occaecati magnam. Ut et reprehenderit eum laborum magni. Ut aut hic qui nihil voluptatem nihil.', 14, 6, '2024-05-08 11:20:51', '2024-05-08 11:20:51'),
(33, 'Eos dolores quia in adipisci. Doloremque ratione quia dolore. Praesentium voluptate possimus nihil dolorem. Expedita eligendi est in omnis voluptates.\n\nSimilique vel eaque minima qui sapiente. Ipsa quae dolor est eveniet est repellendus. Esse ratione voluptatibus dolor a. Qui alias est in.', 14, 25, '2024-05-08 11:20:51', '2024-05-08 11:20:51'),
(34, 'Iste illum ad odit rerum. Eum enim autem fugiat sit aut. Accusamus eveniet aut dolor ad. Illo debitis error sed labore ipsam harum.\n\nAt adipisci id quod qui doloribus cumque sed. Animi pariatur ex laborum commodi excepturi sequi. Voluptate non aspernatur non id totam magnam similique.', 14, 63, '2024-05-08 11:20:51', '2024-05-08 11:20:51'),
(35, 'Earum repudiandae cupiditate rerum harum. Eaque placeat ex omnis qui accusantium laboriosam reiciendis. Voluptatibus dolor harum perferendis voluptatibus. Quia qui animi rerum distinctio voluptatibus voluptatem.\n\nEius minima ipsum rerum pariatur esse ea fugiat vel. Necessitatibus doloremque voluptatibus eius excepturi qui et. Sit tempore repellat est fuga voluptatem.', 14, 57, '2024-05-08 11:20:51', '2024-05-08 11:20:51'),
(36, 'Voluptas iste quos omnis ut quas. Doloribus id reprehenderit tenetur excepturi totam amet reprehenderit saepe. Dolore blanditiis rerum dolorum tempora. Explicabo provident deleniti qui consectetur delectus deleniti illo. Nisi consequatur non eveniet non tempore aut.\n\nCulpa corporis corrupti et dicta et laborum. Ut vero nihil voluptas. Sed debitis perspiciatis non.', 15, 72, '2024-05-08 11:20:51', '2024-05-08 11:20:51'),
(37, 'Quia quibusdam praesentium aut enim est. Quas optio quisquam et eum dolores. Explicabo reiciendis doloremque et nisi optio voluptates est saepe.\n\nDistinctio alias itaque expedita esse. Magnam voluptatem a voluptatem est ut est. Aut est quos soluta. Adipisci reiciendis hic dolore autem.', 15, 86, '2024-05-08 11:20:51', '2024-05-08 11:20:51'),
(38, 'Dolor est qui doloribus ipsam corporis iusto. Quaerat rerum ea dolores ut. Distinctio optio dolorem doloremque sunt earum id.\n\nConsequatur voluptatibus ut quis molestiae nesciunt a. Totam quam et et eos ut explicabo repellat. Corporis dolorem vitae eum non aut cupiditate voluptatem voluptatem.', 15, 57, '2024-05-08 11:20:51', '2024-05-08 11:20:51'),
(39, 'Dolorem numquam dolor amet a harum. Vitae illo in similique voluptatem reprehenderit ipsam. Veniam nesciunt recusandae maxime nostrum doloribus sit. Sequi reprehenderit repellendus et ipsum ut asperiores.\n\nDelectus optio animi natus rem nobis iure aliquam rerum. Id deleniti sit provident totam voluptate nihil. Qui aliquam corrupti tempora eius aut et sint. Quo ut consequatur sunt iure.', 15, 93, '2024-05-08 11:20:51', '2024-05-08 11:20:51'),
(40, 'Libero et quia ipsam excepturi corrupti dolorem officia. Et id aut quis et. Ipsa atque voluptatem id omnis. Corrupti velit rerum est inventore voluptas.\n\nRatione ut qui sint sed. Iure laudantium enim quos et ut optio. Architecto tempora qui et totam. Ad recusandae voluptas reprehenderit consequuntur. Molestiae asperiores labore voluptas quo voluptatem eum eos.', 16, 23, '2024-05-08 11:20:51', '2024-05-08 11:20:51'),
(41, 'In ea consequatur mollitia reiciendis dolor rerum. Tempore ad laborum sed eaque ut quia. Accusamus ut aut dignissimos. Dignissimos consequatur at quas explicabo nam officiis. Ut nulla adipisci facilis laboriosam voluptas molestiae.\n\nQuaerat minus inventore commodi iusto numquam recusandae. Et tenetur qui est officia velit. Rerum fugit ipsa quos sunt a optio.', 16, 38, '2024-05-08 11:20:51', '2024-05-08 11:20:51'),
(42, 'Est et nihil quis odio ea doloremque veritatis sed. Dolorem placeat consequuntur at placeat illum animi. Quod assumenda rerum enim magnam exercitationem repellendus.\n\nAccusantium libero dolores itaque ab. Rerum nam possimus quos veritatis. Consequuntur fugit odit molestias est aut ut. Sunt corporis optio porro explicabo placeat eius nam. Error atque numquam unde ratione.', 16, 77, '2024-05-08 11:20:51', '2024-05-08 11:20:51'),
(43, 'Officia iste dicta et. Rerum aut itaque et temporibus harum dolorem. Laborum consequuntur omnis consequatur maxime quia suscipit. Ipsum illo enim et vitae. Perspiciatis aut pariatur libero itaque enim temporibus est voluptatem.\n\nVoluptatum placeat amet sed rem id debitis neque possimus. Quis corporis voluptates in totam molestiae vel. Omnis et ratione eum optio. Non facilis mollitia molestiae repellat. Sunt et ut vel ratione voluptatem.', 17, 48, '2024-05-08 11:20:51', '2024-05-08 11:20:51'),
(44, 'Et et culpa earum. Eius dolor quia facilis. Ratione et omnis vel totam cupiditate. Cum rem quisquam illo aut doloribus itaque dolores.\n\nIn dolor ad error eaque repellendus et. Suscipit voluptatem quas labore ullam laborum. Et quasi sequi in.', 17, 20, '2024-05-08 11:20:51', '2024-05-08 11:20:51'),
(45, 'Sunt consectetur esse sed voluptatem laboriosam perferendis. Est voluptatem ipsum eos minima sed. Molestias repellat sit quas placeat et nihil. Ullam sed iusto pariatur facilis.\n\nEt fuga voluptatibus velit facere sint earum placeat. Omnis qui et cum deleniti. At ipsum sint nostrum. Magnam quia eveniet voluptatum architecto.', 17, 58, '2024-05-08 11:20:51', '2024-05-08 11:20:51'),
(46, 'Rerum omnis voluptatem aut voluptas quasi nihil voluptate labore. In dolor ut perspiciatis at fugit qui et. Alias sit veniam perspiciatis molestiae.\n\nIn aliquid atque dicta quia. Debitis et eos cumque nam tempore. Sit voluptas et fugit eos consectetur.', 18, 43, '2024-05-08 11:20:51', '2024-05-08 11:20:51'),
(47, 'Sit similique ratione repudiandae voluptas ut nam. Aut tenetur incidunt placeat blanditiis. Tenetur sed qui eveniet recusandae.\n\nId et porro quod fugit ut. Repellendus dolores alias quisquam magnam qui facere.', 18, 1, '2024-05-08 11:20:51', '2024-05-08 11:20:51'),
(48, 'Voluptatem quia est incidunt. Veritatis necessitatibus in delectus porro. Molestias ut necessitatibus officiis cum vitae nihil et. Sed sit quisquam amet rerum corrupti dolor doloribus.\n\nOccaecati nostrum nostrum doloremque. Amet non voluptatem ratione suscipit laborum. Eum aut beatae quo neque et repellat ullam possimus.', 18, 88, '2024-05-08 11:20:51', '2024-05-08 11:20:51'),
(49, 'Assumenda ipsam sunt ea enim. Aut possimus rerum maiores tenetur. Quisquam adipisci voluptatem doloremque molestiae. Quis sint eaque dolor sit aut et adipisci. Totam aut consequatur dolores in maxime.\n\nOccaecati nostrum perferendis quas quo. Facere et hic ut reiciendis. In mollitia voluptatem odio exercitationem. Voluptatem consequatur non vel aut.', 18, 8, '2024-05-08 11:20:51', '2024-05-08 11:20:51'),
(50, 'Voluptatem veniam autem laborum repudiandae illo eos. Ex ut eum quo mollitia. Aliquam inventore accusantium sequi.\n\nUt ab ea reiciendis magni provident quis. Fuga natus a iusto aut beatae. Totam quis qui doloremque dolor quos ipsum unde. Non doloribus cumque consequatur enim quia.', 18, 32, '2024-05-08 11:20:51', '2024-05-08 11:20:51'),
(51, 'Tempore facilis consequatur vero incidunt consequatur quis veniam. Repudiandae dolore quia doloremque sapiente aliquam sint. Dolorum provident ea vitae veniam commodi eum aut reprehenderit. Voluptatem corporis molestias culpa aut dolores.\n\nEt incidunt quia consequatur voluptatem non expedita dolorem. Asperiores distinctio autem eum quia.', 19, 21, '2024-05-08 11:20:51', '2024-05-08 11:20:51'),
(52, 'Et culpa fugit ut. Vel aliquid cupiditate et esse sunt quaerat. Quaerat ipsum veritatis asperiores consectetur illo reprehenderit dolores. Dolorem recusandae vel aut odit vel facilis.\n\nOfficia in quaerat sit in ut consequatur. Delectus qui est aspernatur non libero aliquam aut. Voluptas velit tenetur libero error et aut debitis architecto.', 20, 51, '2024-05-08 11:20:51', '2024-05-08 11:20:51'),
(53, 'Cumque officia sunt consequuntur et quidem autem. Soluta eos autem autem. Non pariatur nam rem rerum maxime accusantium. Aut quis laudantium odio vel nam.\n\nEst ea quibusdam rem dolorum sint deleniti eum. Assumenda qui et voluptatibus quaerat aut vitae ab. Est id illo enim cumque enim. Natus minima et quia placeat sit ex et commodi.', 21, 45, '2024-05-08 11:20:51', '2024-05-08 11:20:51'),
(54, 'Qui praesentium autem sunt recusandae praesentium perferendis eius nulla. Ea nulla consequuntur consequatur optio. Et facilis debitis officia non enim. In temporibus quae illum voluptas sint tenetur quaerat. Doloribus ut amet temporibus accusamus omnis amet quis.\n\nVoluptatem perspiciatis omnis et nulla omnis dolores. Voluptate modi necessitatibus magnam sit. Distinctio dolorum commodi cupiditate vero porro.', 21, 33, '2024-05-08 11:20:51', '2024-05-08 11:20:51'),
(55, 'Molestias suscipit et quia velit enim maxime. Quisquam corporis et nesciunt accusantium aut nisi. Eum dolorum voluptatem maxime quisquam. Molestias velit doloremque itaque illum placeat.\n\nFugit consequatur in necessitatibus repellat provident. Qui dolorum alias quis minima in aut sunt. Facere temporibus sit vel enim voluptas id rerum.', 21, 26, '2024-05-08 11:20:51', '2024-05-08 11:20:51'),
(56, 'Placeat expedita maxime deleniti expedita. Aperiam maxime voluptatem dolore id. Tempora fugit sint omnis doloremque ratione sit. Repellat mollitia odio necessitatibus qui.\n\nUnde consequatur quia atque maxime dolor quisquam saepe. A voluptatem architecto hic voluptas eaque animi. Libero ea doloremque autem velit aut ea.', 21, 42, '2024-05-08 11:20:51', '2024-05-08 11:20:51'),
(57, 'Odio quo quo voluptates fuga sit nostrum. Magnam deleniti sint voluptatem repellat quisquam molestias officia. Nisi soluta odit recusandae sit quibusdam asperiores sequi.\n\nUnde alias et ex voluptatibus. Qui explicabo quae modi est est temporibus. Odio sunt aliquid dolores voluptas nostrum autem. Incidunt id vero quia nemo. Excepturi reiciendis voluptas nihil cumque accusamus provident id.', 22, 29, '2024-05-08 11:20:51', '2024-05-08 11:20:51'),
(58, 'Sapiente consequatur aut odio modi. Sint corrupti magni sapiente aut aut incidunt. Quo molestiae rerum possimus molestiae sint possimus.\n\nAccusantium ipsa omnis incidunt qui. Iusto ullam sed qui. Vitae quae magni dolorem tenetur sed in.', 23, 54, '2024-05-08 11:20:51', '2024-05-08 11:20:51'),
(59, 'Omnis explicabo fugiat numquam. Et qui et deleniti sequi. Qui sapiente reprehenderit id quam.\n\nEt iste pariatur quia autem iure nobis. Voluptas libero in fuga eligendi. Excepturi harum minima non. Distinctio assumenda incidunt quibusdam a.', 23, 35, '2024-05-08 11:20:51', '2024-05-08 11:20:51'),
(60, 'Quibusdam voluptatum optio consequatur accusantium quo nostrum. Eaque beatae qui a est. Voluptatem reiciendis ut animi et sint libero dolores.\n\nDucimus est eum dolores voluptatem. Reiciendis cupiditate quis qui placeat fugit sint dolorem. Voluptatem amet rerum alias doloribus tempora.', 24, 2, '2024-05-08 11:20:51', '2024-05-08 11:20:51'),
(61, 'Placeat tempora porro tempore. Et minus rerum facere dolorum ut itaque. Consequatur voluptatum et excepturi eveniet.\n\nDolore cumque accusamus sed quia voluptas temporibus. Quod voluptas cumque autem sed omnis cupiditate sint. Ab natus et corporis eum ipsum. Libero laudantium mollitia atque adipisci sapiente.', 24, 47, '2024-05-08 11:20:51', '2024-05-08 11:20:51'),
(62, 'Ea eligendi magni sed qui praesentium ut unde. Doloribus ut nisi neque pariatur sed est qui. Omnis animi consequuntur ut quo libero sed quisquam placeat. Cum ut ut facere accusantium eos asperiores eius.\n\nSit pariatur quibusdam et inventore ratione non quaerat sint. Ullam laboriosam recusandae vel et deserunt. Voluptatibus dolore iure rerum modi dolor libero.', 24, 89, '2024-05-08 11:20:51', '2024-05-08 11:20:51'),
(63, 'Eveniet rerum asperiores sed. Tenetur beatae accusantium dolores nobis et quas expedita. Voluptatum ipsa dicta aut incidunt recusandae. Hic modi odio perspiciatis unde eum debitis quaerat.\n\nAut enim aperiam sit et ad et libero doloremque. Officiis eos asperiores dicta repellat. Temporibus ab quis non dolores fuga doloremque sed.', 25, 34, '2024-05-08 11:20:51', '2024-05-08 11:20:51'),
(64, 'Culpa nihil aut quisquam vero esse. Necessitatibus rerum qui soluta laborum. Consectetur accusamus qui ipsum vel quam.\n\nQui reprehenderit inventore nobis sunt autem modi ut. Fugit dolor et ut excepturi eligendi. Est dolor quod velit rerum iure culpa quaerat voluptate. Veniam quisquam harum aut dolorem.', 25, 72, '2024-05-08 11:20:51', '2024-05-08 11:20:51'),
(65, 'Unde ut vel libero quidem. Temporibus odio velit nemo hic. Deserunt quia ut animi labore expedita. Est molestias facere totam ea tempore voluptatem.\n\nA cupiditate omnis nostrum vel. Sint nisi vel et molestiae voluptatem ut aperiam. Quo distinctio et magni accusamus dignissimos. Velit eligendi ducimus consequatur dicta nemo. Similique deserunt sequi omnis.', 25, 15, '2024-05-08 11:20:51', '2024-05-08 11:20:51'),
(66, 'Autem nostrum ut eius qui ipsam. Consequatur eos eum omnis laudantium aut at ut. Ut nostrum facere quidem veritatis eum eligendi. Molestias sed vel aut pariatur et.\n\nDolores error vel eum qui. Accusantium et repudiandae reprehenderit harum. Reprehenderit non quas commodi aut enim fuga consectetur. Distinctio non aperiam enim necessitatibus recusandae illum eum.', 25, 3, '2024-05-08 11:20:51', '2024-05-08 11:20:51'),
(67, 'Illum officiis illum eaque occaecati molestiae quia. Sunt dignissimos et hic. Et ratione nam enim rerum quisquam numquam. Deleniti laboriosam expedita et nemo consequatur cum.\n\nSunt magnam et reiciendis neque reiciendis corporis illum. Ut veritatis autem quam. Ab aperiam numquam et vitae.', 26, 9, '2024-05-08 11:20:51', '2024-05-08 11:20:51'),
(68, 'Quod sunt incidunt exercitationem facere suscipit. Temporibus natus accusamus est veritatis sapiente laborum et. Velit fugiat dolores vitae.\n\nVero voluptas porro ea magni fuga cumque magni placeat. Ab voluptates non qui alias eos. Quaerat fugiat ad eaque.', 26, 29, '2024-05-08 11:20:51', '2024-05-08 11:20:51'),
(69, 'Maiores vel qui et enim illo voluptate neque. Et enim quos ipsa sit. Omnis rem repudiandae autem dolore tempore sapiente.\n\nEst similique est culpa similique. Ut non autem autem consequatur sed et. Cumque et qui sequi. Voluptatum omnis et magnam ut accusantium impedit tenetur.', 26, 90, '2024-05-08 11:20:51', '2024-05-08 11:20:51'),
(70, 'Quasi fuga esse ex esse molestiae et. Molestiae et quo porro earum esse molestiae. Doloribus qui at assumenda illo autem nam.\n\nMolestiae soluta corporis dolorum officia cum. Magnam dolorum exercitationem molestias sint vel exercitationem nam harum. Eius inventore tempora quas eligendi exercitationem eveniet nihil. Ipsa fuga et adipisci quibusdam.', 27, 20, '2024-05-08 11:20:51', '2024-05-08 11:20:51'),
(71, 'Quia rerum voluptatem numquam et minus. Sunt magni cupiditate maxime. Aut aspernatur voluptatum natus et veniam et. Molestiae voluptatem nostrum non reprehenderit sed vitae repudiandae.\n\nRerum et rerum unde nostrum. Nesciunt et rem ut quam. Fugiat suscipit illum earum iste.', 28, 48, '2024-05-08 11:20:51', '2024-05-08 11:20:51'),
(72, 'Et quas maiores enim. Vero magni occaecati consequatur et velit. Minima occaecati aut ipsum non.\n\nAutem sapiente voluptatem quae. Provident incidunt eos quaerat sed. Commodi itaque officia laboriosam.', 28, 44, '2024-05-08 11:20:51', '2024-05-08 11:20:51'),
(73, 'Soluta sed in odio fugiat corrupti accusantium voluptatibus. Est asperiores quas provident. Nisi quo dolore sint occaecati voluptates dolor inventore.\n\nLaudantium sit nihil et corporis veritatis ut veritatis. Odit ex sapiente sequi maiores soluta. Perferendis provident molestiae libero ut dolorem odio.', 29, 6, '2024-05-08 11:20:51', '2024-05-08 11:20:51'),
(74, 'Consequatur veritatis ea ullam tenetur. Amet voluptas et ut. Autem libero porro vel quidem ipsam. Error mollitia ipsam et dolores optio vero.\n\nMollitia voluptatum dolorum dolores assumenda veniam. Occaecati omnis modi sit temporibus vel sit voluptates minus. Porro quia eos voluptas quidem voluptas.', 30, 2, '2024-05-08 11:20:51', '2024-05-08 11:20:51'),
(75, 'Fugiat occaecati blanditiis quas. Sunt molestiae id eaque quos ut consequatur qui consequatur. Voluptates at quia qui aliquam.\n\nDucimus accusamus eius accusantium aut. Inventore at incidunt mollitia dolores itaque quos omnis iusto. Explicabo perferendis voluptatem ut dolorem est. Aspernatur totam consequatur velit repellendus atque.', 30, 22, '2024-05-08 11:20:51', '2024-05-08 11:20:51'),
(76, 'Ut quae fuga sed. Nemo voluptas laborum libero repudiandae soluta. Veritatis eum aut esse voluptas.\n\nIn repellat fugiat ea esse. In quo provident natus unde provident voluptatum quia ducimus. Sit aut illo voluptate libero ea vel qui.', 30, 52, '2024-05-08 11:20:51', '2024-05-08 11:20:51'),
(77, 'Voluptas culpa corporis deleniti. Ut voluptatum debitis aperiam ex. Distinctio porro voluptas aut doloribus autem consequatur aut eveniet. Et beatae unde dolore qui consequatur.\n\nQuibusdam dolor qui vel maiores provident. Iusto ab delectus consectetur voluptas debitis. Necessitatibus ut reprehenderit asperiores cupiditate.', 30, 54, '2024-05-08 11:20:51', '2024-05-08 11:20:51'),
(78, 'Ut et consequatur facere placeat et excepturi rerum. Quo dignissimos nobis ipsam odio. Aperiam sed eos ea nihil odit qui et.\n\nEt autem ut maiores numquam voluptas. Assumenda eum voluptates voluptatem consequatur sed. Error consequuntur reprehenderit incidunt necessitatibus iure aliquam.', 31, 82, '2024-05-08 11:20:51', '2024-05-08 11:20:51'),
(79, 'Sequi fugiat quam velit. Cupiditate nam corporis eos sed odio aut. Praesentium aut consequuntur quibusdam est numquam inventore. Non illo enim sunt.\n\nEt voluptatem ut veritatis. Modi dolorem quas maxime nobis. Est excepturi voluptatem autem ut harum sed alias. Temporibus non eligendi occaecati nihil quaerat architecto.', 31, 7, '2024-05-08 11:20:51', '2024-05-08 11:20:51'),
(80, 'Sed officia dolores eos aperiam dolor. Fugiat quos ut tenetur dolores a ut et. Ipsa aliquid expedita necessitatibus molestiae sit. Porro quidem mollitia at inventore qui.\n\nSit fuga rem rerum rem laudantium fuga. Quo molestiae beatae minus a. Aut soluta at accusantium ea expedita voluptatem hic ut.', 32, 33, '2024-05-08 11:20:51', '2024-05-08 11:20:51'),
(81, 'Maxime dolore quo nostrum velit quia qui molestiae. Est repudiandae qui odio. Non pariatur facilis architecto nam.\n\nAut earum iste quae dicta. Numquam voluptatem qui aliquam quae quia. Illo nihil atque cum sapiente nihil aut ipsum.', 33, 67, '2024-05-08 11:20:51', '2024-05-08 11:20:51'),
(82, 'Doloribus reiciendis maxime rerum nemo. Eaque omnis omnis cum adipisci. Eum quo et et asperiores quam commodi sint. Et error nulla et.\n\nIure aliquam enim qui quae sapiente sit. Expedita dolores quia soluta dolores est iste. Consequatur voluptatibus ad sunt. Iusto porro qui asperiores officia est maiores sed.', 34, 14, '2024-05-08 11:20:51', '2024-05-08 11:20:51'),
(83, 'Est ab quibusdam id repudiandae qui voluptatem molestias. Aut beatae dolore quia qui. Saepe sit blanditiis sit deleniti voluptatem.\n\nVoluptate repellendus id recusandae. Quia et rerum id blanditiis ab quis. In et repudiandae quo eum quia soluta a.', 34, 18, '2024-05-08 11:20:51', '2024-05-08 11:20:51'),
(84, 'Ad porro culpa nesciunt exercitationem omnis quam provident maxime. Aliquid repellat ut sunt. Doloremque rerum unde ad esse. Quia odio hic perspiciatis quibusdam ullam rerum consequatur. Sint possimus sit sapiente error sint deserunt.\n\nNumquam culpa non odit dolor vel inventore. Rerum vel error voluptatem repellendus nam et repellat dolorem. Saepe voluptate praesentium quam id officia optio.', 34, 20, '2024-05-08 11:20:51', '2024-05-08 11:20:51'),
(85, 'Cumque tenetur est quos ullam veritatis. Necessitatibus cumque quam dicta possimus quia ipsam tenetur. Cum vitae deserunt necessitatibus id libero. Eius beatae vitae aliquid magni eligendi aut architecto.\n\nLaboriosam vero recusandae sit dolore sint enim. Dolore et velit nesciunt debitis. Deleniti qui tenetur iure rem accusamus.', 35, 46, '2024-05-08 11:20:51', '2024-05-08 11:20:51'),
(86, 'Debitis facere non et quas quo. Similique maiores voluptatum voluptates omnis nulla qui. Quibusdam suscipit molestiae debitis at consequatur voluptatum. Qui in eum libero natus et explicabo voluptates.\n\nVero corrupti maxime occaecati rerum voluptatem. Est eaque illo in et.', 35, 96, '2024-05-08 11:20:51', '2024-05-08 11:20:51'),
(87, 'Quo nisi et quibusdam necessitatibus voluptate quam. In et ea impedit vero. Voluptatem eum excepturi ipsam repudiandae voluptatem et. Deleniti eos dolore qui ut magnam nobis amet aut.\n\nQuidem qui ut ut ut pariatur. Voluptatibus cumque esse enim quam blanditiis ut. Reprehenderit at nostrum voluptatem veritatis autem consequuntur. Omnis possimus voluptatum quod nisi velit ut non. Voluptatem sunt et enim autem veritatis libero reiciendis.', 35, 49, '2024-05-08 11:20:51', '2024-05-08 11:20:51'),
(88, 'Vero consequatur sunt commodi unde iste odio repellendus. Sed qui facilis molestias consequatur autem nobis non. Quaerat et maxime voluptas temporibus quibusdam commodi.\n\nConsectetur est aliquid eos amet. Fuga possimus ut expedita et culpa. Ullam fuga illum saepe ut voluptas a.', 35, 46, '2024-05-08 11:20:51', '2024-05-08 11:20:51'),
(89, 'Quis veritatis dolore quam nulla non. Voluptatem qui earum sed. Molestias alias nihil libero numquam neque doloribus non. Atque ut totam corporis nemo aut atque sit.\n\nTemporibus architecto cumque explicabo rerum ea est blanditiis dolores. Sint omnis provident alias perspiciatis sit. Iusto rem sed animi architecto.', 35, 50, '2024-05-08 11:20:51', '2024-05-08 11:20:51'),
(90, 'Quia omnis totam et quam quos. Sequi hic aliquid omnis earum. Est veritatis sequi est est et. Et et iusto nemo adipisci exercitationem asperiores perspiciatis.\n\nQuae facilis nostrum sapiente quia culpa rerum exercitationem. Veniam quo placeat quis omnis sint voluptate fugit. Et labore dolorem sint excepturi ab quia.', 36, 66, '2024-05-08 11:20:51', '2024-05-08 11:20:51'),
(91, 'Et officia neque esse laboriosam. Porro at aut possimus deleniti sunt maxime. Beatae aut maiores facilis tenetur maxime officiis autem. Et voluptatem voluptates minima.\n\nFacere sunt laborum blanditiis veniam sint libero sint. Vel mollitia et vel dolorem laudantium perferendis. Qui laboriosam occaecati deserunt dolor molestias at.', 36, 4, '2024-05-08 11:20:51', '2024-05-08 11:20:51'),
(92, 'Quia similique debitis voluptatem nesciunt consequatur. Beatae ipsum suscipit esse et. Possimus aperiam minus occaecati aliquid voluptatum voluptates.\n\nQui minus est neque possimus quasi ut. Sequi facere enim autem nostrum. Vero aut explicabo quasi perferendis eveniet quisquam sit.', 36, 19, '2024-05-08 11:20:51', '2024-05-08 11:20:51'),
(93, 'Cupiditate minus qui qui quis optio aut aliquid explicabo. Adipisci dicta provident architecto id. Veniam quia ullam sequi accusamus. Aut nihil quaerat inventore quisquam animi.\n\nMolestiae aut porro sapiente iure. Ut similique harum quaerat et excepturi exercitationem. Deserunt in consequatur vel quia sit officiis saepe.', 36, 44, '2024-05-08 11:20:51', '2024-05-08 11:20:51'),
(94, 'Temporibus in aliquam labore et et. Unde quo doloremque animi et et. Veniam accusamus et vel optio assumenda. Ipsam accusamus sint nisi aliquam officia suscipit unde.\n\nMagnam optio quis aut eum excepturi ab ea. Et dolor quae ab impedit est modi fugiat. Velit perferendis sint autem dolorem blanditiis. Officia qui sed facilis numquam corporis et. Voluptatem natus pariatur dolor aliquam sed quia dolorem distinctio.', 36, 20, '2024-05-08 11:20:51', '2024-05-08 11:20:51'),
(95, 'Quisquam qui mollitia voluptas ratione. Consequatur veniam repellendus dolor culpa nemo molestiae repellendus repudiandae. Qui laboriosam fugit doloremque non voluptatem id.\n\nVel in in omnis reiciendis velit. Nihil qui saepe facilis autem officia iste quod qui. Dicta molestiae voluptatem quasi id.', 37, 74, '2024-05-08 11:20:51', '2024-05-08 11:20:51'),
(96, 'Repellat dolorum odio mollitia unde. Dolorem quod aut nisi. Qui rerum impedit corrupti animi illum hic assumenda. Perspiciatis dolores praesentium harum nobis aut alias.\n\nSimilique voluptatem ut in cum repellendus doloremque. Rerum reprehenderit corporis at voluptas et. Quod consequuntur vero assumenda ut suscipit temporibus debitis. Dolor fugit non voluptatem non aliquid iste totam.', 37, 25, '2024-05-08 11:20:51', '2024-05-08 11:20:51'),
(97, 'Odit qui ullam aut doloribus perferendis fuga. Neque voluptates alias est odit rerum. Eum magnam perspiciatis sint fugit magnam aut debitis.\n\nEst consequuntur impedit omnis totam sed aut totam porro. Debitis minus corporis vero et praesentium tempore. Sint dolores et perspiciatis dicta consequuntur facilis sit. Suscipit voluptatem quibusdam in dolor voluptatem.', 38, 95, '2024-05-08 11:20:51', '2024-05-08 11:20:51'),
(98, 'Facilis saepe dolor autem placeat expedita dolore. Tempora maxime nesciunt cum odit est perferendis. Doloremque praesentium sit libero eos magni in ut.\n\nQuis laudantium harum laudantium maiores explicabo velit. Reprehenderit doloribus provident esse illum placeat. Sit aut sed sed.', 38, 84, '2024-05-08 11:20:51', '2024-05-08 11:20:51'),
(99, 'Et quia sint quasi libero. Nulla ad non accusantium distinctio ut perferendis vitae. Earum et et molestias aut. Excepturi facilis quos laudantium sequi aut consequatur quo. Necessitatibus est molestiae aut voluptates.\n\nVeniam recusandae dolorem beatae dolore asperiores. Molestiae deserunt consequatur praesentium aperiam vel. Fugiat modi est consequuntur qui. Nihil occaecati et sed qui non.', 38, 83, '2024-05-08 11:20:51', '2024-05-08 11:20:51'),
(100, 'Nulla autem nemo rem et est. Reiciendis est et assumenda repellat. Officiis est id numquam est.\n\nAd qui quas illum sed quia. Est et pariatur nisi tempore quas omnis sapiente. Dolore ratione esse tenetur nesciunt. Voluptatibus ex repellendus fugiat asperiores veniam eius molestiae.', 38, 5, '2024-05-08 11:20:51', '2024-05-08 11:20:51'),
(101, 'Et enim ut repellat cupiditate fugit veniam. Id quia molestiae possimus cupiditate nemo iusto amet atque. Tempora est fugiat reprehenderit dolores est.\n\nQuisquam ut sed iure odio id voluptatem est. Qui eveniet veniam vel. Ducimus est nobis quod sit voluptas iure vel.', 38, 73, '2024-05-08 11:20:51', '2024-05-08 11:20:51'),
(102, 'Officiis incidunt libero dolorem magnam. Facere officia corporis et quo eveniet quia consequatur. Eligendi ut dolores ipsa laborum quisquam.\n\nFacilis vel neque vel totam excepturi molestiae. Cupiditate est incidunt totam. Quia delectus id et rem deserunt. Illo delectus error nesciunt voluptas corrupti voluptatibus.', 39, 32, '2024-05-08 11:20:51', '2024-05-08 11:20:51'),
(103, 'Ex dolor provident quis fuga dicta iure. Excepturi cumque enim incidunt veniam hic quia aut laudantium.\n\nAsperiores id rerum illo quia deleniti consequatur illum. Qui dolores esse at dolor reprehenderit facilis illum. Qui porro dicta aperiam voluptatum sed est quod dolorem. Sapiente quia error ea veniam.', 39, 32, '2024-05-08 11:20:51', '2024-05-08 11:20:51'),
(104, 'Ut quia deleniti veniam aut voluptatibus quis cupiditate. Vero dolorum consequatur nam id voluptatem et. Quia quis inventore in rem cupiditate minima sunt vel.\n\nQuis eos quod in ipsam rerum. Eum tenetur minima pariatur rerum est. Est dolor commodi vel corporis.', 40, 77, '2024-05-08 11:20:51', '2024-05-08 11:20:51'),
(105, 'Sequi nemo quibusdam ut ex doloremque porro. Quia sit praesentium vel est quia laudantium. Fuga voluptates soluta sunt voluptas blanditiis consequatur corrupti. Omnis tempora quae ea voluptatem.\n\nAut earum ut deleniti dolorem error rerum laborum. Itaque qui autem nihil hic et. Reiciendis vel qui id aut dicta. Quibusdam dolor omnis quia dolorum et quia.', 40, 23, '2024-05-08 11:20:51', '2024-05-08 11:20:51'),
(106, 'Error quaerat ut aspernatur laborum iure. Dignissimos omnis est harum unde quia illo fuga.\n\nIpsa et illum doloremque ipsam expedita facere ex. Perferendis quidem nobis incidunt pariatur et esse sit. Placeat cupiditate eos maxime nulla impedit ratione. Voluptas amet dolor doloribus et rem aut.', 40, 11, '2024-05-08 11:20:51', '2024-05-08 11:20:51'),
(107, 'Tenetur laboriosam est eveniet deserunt et. Autem id nulla quisquam delectus. Similique placeat veritatis voluptate perferendis perferendis eveniet vel.\n\nAperiam aut tenetur ea necessitatibus vel dolor sed consequatur. Illo sint et in minima rerum sit hic. Sit sapiente atque ut corporis. Eum non quibusdam praesentium et.', 40, 89, '2024-05-08 11:20:51', '2024-05-08 11:20:51'),
(108, 'Similique cum in optio eligendi nulla vero eveniet. Quaerat ut numquam vel aspernatur. Voluptate reiciendis sint ut. Distinctio assumenda omnis officiis nam et neque.\n\nPlaceat neque eius placeat autem. Reiciendis maiores iure dolores aspernatur est dolor sequi. Non voluptatem et qui. Cupiditate enim nobis et debitis et.', 40, 30, '2024-05-08 11:20:51', '2024-05-08 11:20:51'),
(109, 'Id non sint aut architecto nihil. Atque distinctio non quam et hic voluptas. Fuga voluptate animi vero rerum tenetur ducimus.\n\nOfficiis velit omnis quasi ut vitae. Aut minima expedita modi. Aspernatur necessitatibus distinctio odio enim blanditiis dolor dolorem inventore.', 41, 20, '2024-05-08 11:20:51', '2024-05-08 11:20:51'),
(110, 'Voluptate accusantium est perferendis autem a veritatis. Amet nihil iste sequi quo est quod quas. Doloribus nostrum sit distinctio et dolorem qui. Culpa voluptate perspiciatis ipsam aliquid tempore magni earum.\n\nSint provident natus non mollitia qui doloremque laboriosam. Fugit perspiciatis laudantium consequatur sapiente quae ut quaerat. Et dolor libero saepe quidem.', 41, 19, '2024-05-08 11:20:51', '2024-05-08 11:20:51'),
(111, 'Expedita reiciendis architecto ut. Dicta doloribus molestias aut aut.\n\nQui minus debitis nemo nisi. Qui velit alias maiores earum. Eius qui eos voluptatem nulla.', 41, 32, '2024-05-08 11:20:51', '2024-05-08 11:20:51'),
(112, 'Eum vero mollitia qui doloremque voluptas aliquam et. Aut laborum mollitia pariatur facere. Iusto maxime sunt tempore facere.\n\nBeatae nostrum non unde corrupti ducimus corporis. Dolor laboriosam itaque perspiciatis aut veritatis nisi. Ut assumenda quis inventore quasi dolore. Distinctio consequuntur facilis eos ullam esse blanditiis. Enim doloribus eveniet quos perferendis soluta repudiandae.', 42, 54, '2024-05-08 11:20:51', '2024-05-08 11:20:51'),
(113, 'Tempora nisi nam ut impedit ut. Porro quia hic inventore placeat quod et aspernatur. Cum voluptate consequatur consectetur ut est. Voluptatum accusamus aut optio id vel nemo.\n\nId itaque consequatur eos perspiciatis voluptas. Reiciendis quia aut optio voluptatem non. Rerum qui corporis laudantium fuga fugit quis hic. Accusantium facilis ut eos. Voluptas odio at quis voluptatibus qui.', 42, 67, '2024-05-08 11:20:51', '2024-05-08 11:20:51'),
(114, 'Voluptas et et placeat velit. Voluptatum debitis incidunt saepe tempore quisquam unde. Quae magni voluptate voluptas dolores quia aut.\n\nEst iusto sunt quia aut numquam delectus. Ad deleniti veniam voluptas accusamus minus expedita. Nulla praesentium optio veritatis nostrum explicabo rem porro. Dolores quia maiores id ut.', 43, 22, '2024-05-08 11:20:51', '2024-05-08 11:20:51'),
(115, 'Id dolore magni dolorum. Rem facere deserunt est omnis natus eveniet. Velit repudiandae illum ipsum quas architecto. Aut saepe dolores esse velit quibusdam dolore.\n\nVoluptas qui nihil id provident aliquid ea. Repudiandae provident qui ut. Soluta provident consequatur placeat maxime quia aperiam ullam.', 44, 15, '2024-05-08 11:20:51', '2024-05-08 11:20:51'),
(116, 'Rerum impedit tempora et voluptatem debitis repellat. Qui architecto esse sed accusantium accusamus ut unde. Dolorem eos iusto quisquam est.\n\nQuo dolorem dolores dignissimos nemo laudantium. Quae cumque et qui recusandae ut. Eveniet eum ab occaecati qui mollitia laborum. Qui dolorem et est. Nobis animi ut in ea aut iste omnis.', 44, 35, '2024-05-08 11:20:51', '2024-05-08 11:20:51'),
(117, 'Corrupti nihil consequatur in voluptatum. Nostrum suscipit laborum voluptatem asperiores nihil. Doloremque distinctio et sint quidem. Qui ab quia et consequuntur aliquid molestiae rerum.\n\nRepellendus officiis aliquid eos quasi tempora. Et illo et pariatur magni dolorem harum est qui. Et voluptates nisi saepe rerum veritatis dolore.', 44, 31, '2024-05-08 11:20:51', '2024-05-08 11:20:51'),
(118, 'Perspiciatis porro deleniti voluptatem rerum dolorem eum. Laudantium libero consequatur sapiente amet ut natus aut. Illum sed odit nulla. Aut quia quia eum voluptas qui.\n\nConsectetur facere quo officiis voluptatibus. Nesciunt dolor quam nemo facilis. Beatae quis est quae. Autem nulla est perferendis praesentium nihil quia provident ut.', 44, 36, '2024-05-08 11:20:51', '2024-05-08 11:20:51'),
(119, 'Aut et cum non quam. Ut qui minima doloribus eius quasi tempore dolores. Fugit vel voluptas quo fugit ducimus. Unde magnam sed qui qui nisi.\n\nUt est consequuntur necessitatibus facere. Mollitia error natus et. Aliquam temporibus quas accusantium est.', 44, 56, '2024-05-08 11:20:51', '2024-05-08 11:20:51'),
(120, 'Aut et voluptas accusamus. Inventore rerum aut quasi nihil. Qui ut corrupti quia ut. Qui et et harum itaque sint ad voluptatibus.\n\nLaborum optio neque excepturi nihil esse officiis dolores voluptas. Facere ea est omnis et explicabo. Sed quam incidunt eius blanditiis debitis dolor minus qui. Praesentium laboriosam et rerum aperiam.', 45, 79, '2024-05-08 11:20:51', '2024-05-08 11:20:51'),
(121, 'Corrupti neque sit dolor est et. Ipsam a molestias laborum minus tempora assumenda laudantium ex.\n\nUt ipsum non eum impedit. Repellendus magni tenetur et ut repellendus quis qui.', 46, 19, '2024-05-08 11:20:51', '2024-05-08 11:20:51'),
(122, 'Eos mollitia minima sunt. Enim officiis non ut dolore magnam qui. Quia corrupti accusantium molestiae repellendus vitae recusandae molestias.\n\nUt ab praesentium et. Beatae quasi nulla veritatis nobis quibusdam. Nemo quis possimus tempore est.', 47, 58, '2024-05-08 11:20:51', '2024-05-08 11:20:51'),
(123, 'Ad ipsa dolores velit quia sed libero assumenda. Eum dolores numquam enim non. Deleniti consequatur ex consequatur nam. Sapiente nam temporibus fugit molestiae velit magni quis. Nam omnis rerum non esse explicabo et vero qui.\n\nEst reprehenderit eius eos vitae. Earum temporibus iste eum modi distinctio natus. Ut et in sapiente ea dolorum.', 48, 63, '2024-05-08 11:20:51', '2024-05-08 11:20:51'),
(124, 'Nam recusandae expedita neque illo quo tempora commodi. Voluptates ullam inventore commodi minus cumque mollitia quisquam natus. Eligendi iusto culpa itaque id non.\n\nHarum molestiae explicabo ut aut dolor enim voluptatem. Recusandae ad laudantium eius ut repellat dicta reprehenderit. Minus ducimus quidem porro illo velit minima aut.', 48, 1, '2024-05-08 11:20:51', '2024-05-08 11:20:51'),
(125, 'Ratione eum accusamus pariatur eaque qui. Consequatur quidem vel ut dolor sed. Voluptatibus qui quod voluptatem molestiae.\n\nNon facilis neque in ea. Labore odit quia sunt quas impedit. Consectetur est praesentium repellendus eum voluptas.', 48, 95, '2024-05-08 11:20:51', '2024-05-08 11:20:51'),
(126, 'Et aut asperiores voluptatibus aliquid illum. Rem earum omnis asperiores vel illum enim et. Omnis cumque adipisci laudantium.\n\nOccaecati totam quae inventore sed. Vero reprehenderit optio cumque aut impedit dolores. Dignissimos eos eos in quisquam omnis. At voluptatibus sequi aliquam sed.', 48, 96, '2024-05-08 11:20:51', '2024-05-08 11:20:51'),
(127, 'Sint nostrum quis veritatis nesciunt quae id veniam. Incidunt dolorum facilis dignissimos voluptatibus. Eius dignissimos quae id laudantium.\n\nVero est numquam est cum sunt. Labore iusto cumque reiciendis unde nemo illum. Reiciendis ratione officiis harum id. Velit itaque velit ut deleniti sit.', 48, 58, '2024-05-08 11:20:51', '2024-05-08 11:20:51'),
(128, 'Suscipit occaecati voluptas sit inventore commodi et et velit. Maiores libero at cupiditate minima.\n\nOccaecati commodi reiciendis et unde earum labore earum. Omnis suscipit mollitia rem laboriosam adipisci rem.', 49, 30, '2024-05-08 11:20:51', '2024-05-08 11:20:51'),
(129, 'Mollitia eos et qui ut voluptatum. Corporis adipisci quis qui libero dolores. Ipsam quia nemo exercitationem officiis porro enim. Vitae eum deleniti incidunt earum sit doloremque laboriosam. Eos totam labore consequatur cumque itaque.\n\nUt voluptas debitis ut porro. Non recusandae fugiat fugit voluptatem placeat quae. Quo sed autem sapiente non aut soluta eum.', 49, 57, '2024-05-08 11:20:51', '2024-05-08 11:20:51'),
(130, 'Et saepe molestias alias ab adipisci possimus quis. Sit libero harum hic necessitatibus qui consequatur. Nihil commodi praesentium veniam et vero sint.\n\nQui exercitationem veniam suscipit quidem quam. Aperiam labore possimus dolorum et animi dolorem et laborum. Esse hic quo dolores quisquam voluptatum. Quia praesentium praesentium et laboriosam optio ut.', 49, 16, '2024-05-08 11:20:51', '2024-05-08 11:20:51'),
(131, 'Id modi itaque omnis reiciendis quidem minima laboriosam. Aut at dolor ex tempore ipsum at. Pariatur vel harum asperiores. Harum autem repellat quia laborum et doloribus. Quia eaque enim quo hic officia quam libero.\n\nReprehenderit qui officia voluptatem fuga. Ut delectus quam sint necessitatibus. Dolorem nostrum aperiam eos placeat officia. Sed ducimus debitis nemo eveniet. Rem ut dolore qui non.', 49, 9, '2024-05-08 11:20:51', '2024-05-08 11:20:51');
INSERT INTO `blocks` (`id`, `content`, `post_id`, `order`, `created_at`, `updated_at`) VALUES
(132, 'Fugit omnis dignissimos voluptatem quia. Officiis vitae nemo qui odit quas. Eius enim sit commodi molestiae rem mollitia numquam.\n\nSit ut doloribus rerum dignissimos quia vel. Nesciunt odit sed libero molestias. Quos quam est cumque in aut sed doloribus omnis.', 50, 80, '2024-05-08 11:20:51', '2024-05-08 11:20:51'),
(133, 'Delectus voluptate qui quaerat placeat similique. Rerum quae voluptatem totam a corporis nesciunt. Adipisci maiores eveniet pariatur sunt.\n\nLaborum earum vitae in aut omnis. Ea recusandae vero consequuntur cupiditate et eligendi repellat. Omnis error dolorem illo. Facere alias quis rerum.', 50, 58, '2024-05-08 11:20:51', '2024-05-08 11:20:51'),
(134, 'Omnis aut pariatur perferendis quasi tenetur. Laborum exercitationem unde rerum veniam enim sunt non et.\n\nEx odio quia doloribus hic vel. Magni aut soluta perferendis recusandae nisi.', 50, 76, '2024-05-08 11:20:51', '2024-05-08 11:20:51'),
(135, 'Autem nihil similique qui fugiat. Velit sint aut temporibus sed reiciendis. Fugiat dolorum ab sunt officia quod iste voluptatibus. Maxime ex minima doloribus esse iste odit.\n\nAutem porro aut quos rem sit et dolor. Aperiam temporibus ea nobis et. Qui est autem ex totam qui dolore sunt. Dolores quis reiciendis molestiae accusantium.', 50, 8, '2024-05-08 11:20:51', '2024-05-08 11:20:51'),
(136, 'Nobis assumenda consectetur consequuntur et possimus. Beatae vel porro id. Sit non modi maiores exercitationem.\n\nNesciunt recusandae fugit et est consequuntur ipsum aut dolorem. Qui quam omnis consequatur eum placeat dolores repellendus totam. Error ea porro dolorum temporibus quo. Beatae minima asperiores et natus pariatur.', 50, 13, '2024-05-08 11:20:51', '2024-05-08 11:20:51');

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `title`, `created_at`, `updated_at`) VALUES
(1, 'ut', '2024-05-08 11:20:51', '2024-05-08 11:20:51'),
(2, 'alias', '2024-05-08 11:20:51', '2024-05-08 11:20:51'),
(3, 'quo', '2024-05-08 11:20:51', '2024-05-08 11:20:51'),
(4, 'rerum', '2024-05-08 11:20:51', '2024-05-08 11:20:51'),
(5, 'totam', '2024-05-08 11:20:51', '2024-05-08 11:20:51'),
(6, 'dolorum', '2024-05-08 11:20:51', '2024-05-08 11:20:51'),
(7, 'soluta', '2024-05-08 11:20:51', '2024-05-08 11:20:51'),
(8, 'aut', '2024-05-08 11:20:51', '2024-05-08 11:20:51'),
(9, 'amet', '2024-05-08 11:20:51', '2024-05-08 11:20:51'),
(10, 'qui', '2024-05-08 11:20:51', '2024-05-08 11:20:51'),
(11, 'adipisci', '2024-05-08 11:20:51', '2024-05-08 11:20:51'),
(12, 'ex', '2024-05-08 11:20:51', '2024-05-08 11:20:51'),
(13, 'iste', '2024-05-08 11:20:51', '2024-05-08 11:20:51'),
(14, 'placeat', '2024-05-08 11:20:51', '2024-05-08 11:20:51'),
(15, 'consequatur', '2024-05-08 11:20:51', '2024-05-08 11:20:51'),
(16, 'optio', '2024-05-08 11:20:51', '2024-05-08 11:20:51'),
(17, 'et', '2024-05-08 11:20:51', '2024-05-08 11:20:51'),
(18, 'quibusdam', '2024-05-08 11:20:51', '2024-05-08 11:20:51'),
(19, 'officia', '2024-05-08 11:20:51', '2024-05-08 11:20:51'),
(20, 'in', '2024-05-08 11:20:51', '2024-05-08 11:20:51');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint UNSIGNED NOT NULL,
  `reserved_at` int UNSIGNED DEFAULT NULL,
  `available_at` int UNSIGNED NOT NULL,
  `created_at` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2024_05_08_133714_create_posts_table', 1),
(5, '2024_05_08_133723_create_blocks_table', 1),
(6, '2024_05_08_133729_create_tags_table', 1),
(7, '2024_05_08_133741_create_categories_table', 1),
(8, '2024_05_08_133748_create_post_categories_table', 1),
(9, '2024_05_08_133754_create_post_tags_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `title`, `created_at`, `updated_at`) VALUES
(1, 'Est quisquam ullam odit delectus.', '2024-05-08 11:20:51', '2024-05-08 11:20:51'),
(2, 'Impedit tempora quibusdam quo.', '2024-05-08 11:20:51', '2024-05-08 11:20:51'),
(3, 'Laborum rem dolorum cumque laudantium doloribus repellendus voluptate.', '2024-05-08 11:20:51', '2024-05-08 11:20:51'),
(4, 'Eveniet ducimus qui repellat.', '2024-05-08 11:20:51', '2024-05-08 11:20:51'),
(5, 'Corrupti odio harum sed.', '2024-05-08 11:20:51', '2024-05-08 11:20:51'),
(6, 'Sunt ut iusto eaque delectus corrupti placeat aut.', '2024-05-08 11:20:51', '2024-05-08 11:20:51'),
(7, 'Esse culpa ad recusandae aperiam iusto maxime dolore.', '2024-05-08 11:20:51', '2024-05-08 11:20:51'),
(8, 'Cupiditate amet modi eos id odio non.', '2024-05-08 11:20:51', '2024-05-08 11:20:51'),
(9, 'Sed tempora sunt enim est.', '2024-05-08 11:20:51', '2024-05-08 11:20:51'),
(10, 'Iste qui doloremque tempore similique saepe eos quis.', '2024-05-08 11:20:51', '2024-05-08 11:20:51'),
(11, 'Et nesciunt voluptatem inventore quia fugiat laborum.', '2024-05-08 11:20:51', '2024-05-08 11:20:51'),
(12, 'Commodi quos molestiae fuga quis odio corrupti.', '2024-05-08 11:20:51', '2024-05-08 11:20:51'),
(13, 'Quasi accusantium delectus incidunt totam aspernatur tempore.', '2024-05-08 11:20:51', '2024-05-08 11:20:51'),
(14, 'Debitis et eos ad et.', '2024-05-08 11:20:51', '2024-05-08 11:20:51'),
(15, 'Consequatur incidunt libero autem.', '2024-05-08 11:20:51', '2024-05-08 11:20:51'),
(16, 'Eum amet eos rerum.', '2024-05-08 11:20:51', '2024-05-08 11:20:51'),
(17, 'Voluptatem assumenda qui deserunt corporis.', '2024-05-08 11:20:51', '2024-05-08 11:20:51'),
(18, 'In officia quisquam rerum quia.', '2024-05-08 11:20:51', '2024-05-08 11:20:51'),
(19, 'Vero dolorem deserunt sed omnis autem.', '2024-05-08 11:20:51', '2024-05-08 11:20:51'),
(20, 'Mollitia et nam eum aut enim molestias.', '2024-05-08 11:20:51', '2024-05-08 11:20:51'),
(21, 'Expedita earum sit saepe magni repellendus et.', '2024-05-08 11:20:51', '2024-05-08 11:20:51'),
(22, 'Saepe nihil beatae rem veritatis adipisci at aut iure.', '2024-05-08 11:20:51', '2024-05-08 11:20:51'),
(23, 'Quo vel ea temporibus pariatur dolore et reiciendis.', '2024-05-08 11:20:51', '2024-05-08 11:20:51'),
(24, 'Cumque quam aspernatur eveniet ab nemo quam nihil consequatur.', '2024-05-08 11:20:51', '2024-05-08 11:20:51'),
(25, 'Quis voluptatibus officiis vel incidunt veniam quo.', '2024-05-08 11:20:51', '2024-05-08 11:20:51'),
(26, 'Ut ullam molestias sed doloribus vel eum beatae.', '2024-05-08 11:20:51', '2024-05-08 11:20:51'),
(27, 'Dolor totam aliquam et mollitia harum nisi.', '2024-05-08 11:20:51', '2024-05-08 11:20:51'),
(28, 'Ipsa qui laudantium neque non tempore.', '2024-05-08 11:20:51', '2024-05-08 11:20:51'),
(29, 'Temporibus dolorem molestiae quam id esse quia.', '2024-05-08 11:20:51', '2024-05-08 11:20:51'),
(30, 'Eum nobis dolorem officiis ex aspernatur et facilis.', '2024-05-08 11:20:51', '2024-05-08 11:20:51'),
(31, 'Fuga itaque debitis neque a dolores molestias.', '2024-05-08 11:20:51', '2024-05-08 11:20:51'),
(32, 'Corporis saepe autem voluptatibus dolorem.', '2024-05-08 11:20:51', '2024-05-08 11:20:51'),
(33, 'Rerum sint eum consequuntur sint molestiae numquam consequuntur.', '2024-05-08 11:20:51', '2024-05-08 11:20:51'),
(34, 'Sit nisi corporis cumque alias.', '2024-05-08 11:20:51', '2024-05-08 11:20:51'),
(35, 'Voluptatem id et deserunt itaque est laudantium.', '2024-05-08 11:20:51', '2024-05-08 11:20:51'),
(36, 'Dolore itaque qui molestiae sapiente autem ea.', '2024-05-08 11:20:51', '2024-05-08 11:20:51'),
(37, 'Fuga est ut optio explicabo id atque sit est.', '2024-05-08 11:20:51', '2024-05-08 11:20:51'),
(38, 'Inventore rerum officia voluptatibus expedita ut.', '2024-05-08 11:20:51', '2024-05-08 11:20:51'),
(39, 'Reiciendis et quasi eveniet.', '2024-05-08 11:20:51', '2024-05-08 11:20:51'),
(40, 'Labore aut accusamus ut inventore odit autem natus.', '2024-05-08 11:20:51', '2024-05-08 11:20:51'),
(41, 'Facere velit rerum tenetur quos voluptatum vero rem accusamus.', '2024-05-08 11:20:51', '2024-05-08 11:20:51'),
(42, 'Molestiae repudiandae laboriosam ut totam laborum repellat.', '2024-05-08 11:20:51', '2024-05-08 11:20:51'),
(43, 'Dolorum deserunt et autem repellendus sequi explicabo.', '2024-05-08 11:20:51', '2024-05-08 11:20:51'),
(44, 'Voluptatem exercitationem pariatur in similique optio perspiciatis incidunt eum.', '2024-05-08 11:20:51', '2024-05-08 11:20:51'),
(45, 'Vel enim voluptatem doloribus minima numquam harum consectetur.', '2024-05-08 11:20:51', '2024-05-08 11:20:51'),
(46, 'A quidem ipsam officia ex.', '2024-05-08 11:20:51', '2024-05-08 11:20:51'),
(47, 'Doloribus laudantium doloremque laudantium odit ut.', '2024-05-08 11:20:51', '2024-05-08 11:20:51'),
(48, 'Odio aliquam voluptatem explicabo odio tenetur voluptatum quis ex.', '2024-05-08 11:20:51', '2024-05-08 11:20:51'),
(49, 'Ad rerum ea architecto.', '2024-05-08 11:20:51', '2024-05-08 11:20:51'),
(50, 'Voluptate eum ut repellendus quo iste.', '2024-05-08 11:20:51', '2024-05-08 11:20:51');

-- --------------------------------------------------------

--
-- Table structure for table `post_categories`
--

CREATE TABLE `post_categories` (
  `id` bigint UNSIGNED NOT NULL,
  `post_id` bigint UNSIGNED NOT NULL,
  `category_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `post_categories`
--

INSERT INTO `post_categories` (`id`, `post_id`, `category_id`, `created_at`, `updated_at`) VALUES
(1, 1, 3, NULL, NULL),
(2, 1, 9, NULL, NULL),
(3, 2, 7, NULL, NULL),
(4, 3, 7, NULL, NULL),
(5, 3, 15, NULL, NULL),
(6, 4, 13, NULL, NULL),
(7, 4, 12, NULL, NULL),
(8, 4, 1, NULL, NULL),
(9, 5, 4, NULL, NULL),
(10, 5, 5, NULL, NULL),
(11, 5, 8, NULL, NULL),
(12, 6, 7, NULL, NULL),
(13, 7, 6, NULL, NULL),
(14, 7, 2, NULL, NULL),
(15, 8, 2, NULL, NULL),
(16, 9, 12, NULL, NULL),
(17, 10, 2, NULL, NULL),
(18, 10, 18, NULL, NULL),
(19, 11, 16, NULL, NULL),
(20, 11, 12, NULL, NULL),
(21, 11, 10, NULL, NULL),
(22, 12, 19, NULL, NULL),
(23, 12, 6, NULL, NULL),
(24, 13, 4, NULL, NULL),
(25, 13, 5, NULL, NULL),
(26, 14, 13, NULL, NULL),
(27, 15, 8, NULL, NULL),
(28, 15, 7, NULL, NULL),
(29, 15, 14, NULL, NULL),
(30, 16, 1, NULL, NULL),
(31, 16, 16, NULL, NULL),
(32, 17, 13, NULL, NULL),
(33, 17, 5, NULL, NULL),
(34, 17, 14, NULL, NULL),
(35, 18, 7, NULL, NULL),
(36, 18, 14, NULL, NULL),
(37, 19, 15, NULL, NULL),
(38, 19, 6, NULL, NULL),
(39, 20, 13, NULL, NULL),
(40, 20, 2, NULL, NULL),
(41, 21, 20, NULL, NULL),
(42, 22, 19, NULL, NULL),
(43, 23, 2, NULL, NULL),
(44, 24, 14, NULL, NULL),
(45, 25, 6, NULL, NULL),
(46, 25, 7, NULL, NULL),
(47, 25, 16, NULL, NULL),
(48, 26, 3, NULL, NULL),
(49, 27, 1, NULL, NULL),
(50, 27, 15, NULL, NULL),
(51, 28, 19, NULL, NULL),
(52, 29, 17, NULL, NULL),
(53, 29, 19, NULL, NULL),
(54, 29, 14, NULL, NULL),
(55, 30, 9, NULL, NULL),
(56, 30, 16, NULL, NULL),
(57, 31, 12, NULL, NULL),
(58, 31, 15, NULL, NULL),
(59, 31, 4, NULL, NULL),
(60, 32, 19, NULL, NULL),
(61, 32, 5, NULL, NULL),
(62, 33, 17, NULL, NULL),
(63, 33, 4, NULL, NULL),
(64, 34, 11, NULL, NULL),
(65, 35, 16, NULL, NULL),
(66, 36, 1, NULL, NULL),
(67, 37, 5, NULL, NULL),
(68, 38, 20, NULL, NULL),
(69, 38, 8, NULL, NULL),
(70, 38, 11, NULL, NULL),
(71, 39, 1, NULL, NULL),
(72, 40, 8, NULL, NULL),
(73, 40, 2, NULL, NULL),
(74, 41, 8, NULL, NULL),
(75, 41, 7, NULL, NULL),
(76, 42, 13, NULL, NULL),
(77, 42, 9, NULL, NULL),
(78, 43, 17, NULL, NULL),
(79, 44, 15, NULL, NULL),
(80, 44, 16, NULL, NULL),
(81, 45, 10, NULL, NULL),
(82, 45, 1, NULL, NULL),
(83, 45, 20, NULL, NULL),
(84, 46, 20, NULL, NULL),
(85, 47, 2, NULL, NULL),
(86, 48, 9, NULL, NULL),
(87, 49, 12, NULL, NULL),
(88, 49, 7, NULL, NULL),
(89, 50, 15, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `post_tags`
--

CREATE TABLE `post_tags` (
  `id` bigint UNSIGNED NOT NULL,
  `post_id` bigint UNSIGNED NOT NULL,
  `tag_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `post_tags`
--

INSERT INTO `post_tags` (`id`, `post_id`, `tag_id`, `created_at`, `updated_at`) VALUES
(1, 1, 4, NULL, NULL),
(2, 2, 5, NULL, NULL),
(3, 3, 1, NULL, NULL),
(4, 4, 5, NULL, NULL),
(5, 4, 4, NULL, NULL),
(6, 4, 19, NULL, NULL),
(7, 5, 2, NULL, NULL),
(8, 5, 10, NULL, NULL),
(9, 5, 16, NULL, NULL),
(10, 6, 20, NULL, NULL),
(11, 7, 5, NULL, NULL),
(12, 7, 4, NULL, NULL),
(13, 7, 8, NULL, NULL),
(14, 8, 8, NULL, NULL),
(15, 9, 4, NULL, NULL),
(16, 10, 10, NULL, NULL),
(17, 11, 5, NULL, NULL),
(18, 12, 4, NULL, NULL),
(19, 13, 6, NULL, NULL),
(20, 13, 13, NULL, NULL),
(21, 13, 2, NULL, NULL),
(22, 14, 20, NULL, NULL),
(23, 15, 19, NULL, NULL),
(24, 15, 12, NULL, NULL),
(25, 16, 16, NULL, NULL),
(26, 17, 5, NULL, NULL),
(27, 17, 18, NULL, NULL),
(28, 17, 15, NULL, NULL),
(29, 18, 11, NULL, NULL),
(30, 19, 19, NULL, NULL),
(31, 19, 16, NULL, NULL),
(32, 20, 13, NULL, NULL),
(33, 21, 4, NULL, NULL),
(34, 22, 4, NULL, NULL),
(35, 23, 20, NULL, NULL),
(36, 23, 10, NULL, NULL),
(37, 23, 12, NULL, NULL),
(38, 24, 17, NULL, NULL),
(39, 24, 2, NULL, NULL),
(40, 25, 19, NULL, NULL),
(41, 25, 14, NULL, NULL),
(42, 25, 12, NULL, NULL),
(43, 26, 13, NULL, NULL),
(44, 26, 1, NULL, NULL),
(45, 26, 5, NULL, NULL),
(46, 27, 6, NULL, NULL),
(47, 27, 4, NULL, NULL),
(48, 27, 11, NULL, NULL),
(49, 28, 5, NULL, NULL),
(50, 28, 3, NULL, NULL),
(51, 28, 8, NULL, NULL),
(52, 29, 16, NULL, NULL),
(53, 29, 1, NULL, NULL),
(54, 29, 15, NULL, NULL),
(55, 30, 14, NULL, NULL),
(56, 30, 17, NULL, NULL),
(57, 31, 15, NULL, NULL),
(58, 31, 9, NULL, NULL),
(59, 31, 16, NULL, NULL),
(60, 32, 19, NULL, NULL),
(61, 33, 20, NULL, NULL),
(62, 33, 19, NULL, NULL),
(63, 34, 5, NULL, NULL),
(64, 34, 19, NULL, NULL),
(65, 35, 16, NULL, NULL),
(66, 35, 1, NULL, NULL),
(67, 35, 13, NULL, NULL),
(68, 36, 17, NULL, NULL),
(69, 36, 7, NULL, NULL),
(70, 36, 9, NULL, NULL),
(71, 37, 19, NULL, NULL),
(72, 38, 10, NULL, NULL),
(73, 38, 3, NULL, NULL),
(74, 38, 1, NULL, NULL),
(75, 39, 15, NULL, NULL),
(76, 39, 1, NULL, NULL),
(77, 39, 18, NULL, NULL),
(78, 40, 11, NULL, NULL),
(79, 41, 19, NULL, NULL),
(80, 41, 13, NULL, NULL),
(81, 42, 14, NULL, NULL),
(82, 42, 12, NULL, NULL),
(83, 43, 20, NULL, NULL),
(84, 43, 3, NULL, NULL),
(85, 44, 14, NULL, NULL),
(86, 44, 8, NULL, NULL),
(87, 45, 9, NULL, NULL),
(88, 45, 7, NULL, NULL),
(89, 45, 11, NULL, NULL),
(90, 46, 17, NULL, NULL),
(91, 46, 8, NULL, NULL),
(92, 47, 16, NULL, NULL),
(93, 48, 6, NULL, NULL),
(94, 48, 18, NULL, NULL),
(95, 49, 13, NULL, NULL),
(96, 49, 2, NULL, NULL),
(97, 50, 8, NULL, NULL),
(98, 50, 1, NULL, NULL),
(99, 50, 10, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('u373va3XVqsjXbMx04Z1xLuwgv7YGqwgsDp3UiVx', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:128.0) Gecko/20100101 Firefox/128.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTnhyeUVJZGV2T3IzTWZHTm9pRG5oUkJabnp3YURLUlRCbnBSUDBReCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjQxOiJodHRwOi8vcXVlcnlidWlsZGVyLnRlc3QvZGF0YT9mb3JtYXQ9anNvbiZsaW1pdD0xMCZwYWdlPTEmcmVsYXRpb25zPSU3QiUyMnBvc3RfdGFncyUyMiUzQSU3QiUyMmNvbmRpdGlvbnMlMjIlM0ElNUIlN0IlMjJmaWVsZCUyMiUzQSUyMnRhZ19pZCUyMiUyQyUyMm9wZXJhdG9yJTIyJTNBJTIyJTNEJTNEJTIyJTJDJTIydmFsdWUlMjIlM0ElMjI0JTIyJTdEJTVEJTdEJTdEJnNlbGVjdD1pZCUyQ3RpdGxlJnRhYmxlPXBvc3RzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1722001504),
('WVtRu8lGlhCmRsale0fp8IlatbeZxYIheXSqN03t', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibmZOYURwbnRUalhPNzlYUFl0YUh3OUtFMXlEN1dvTHhUaTJuTFpVMyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDE6Imh0dHA6Ly9xdWVyeWJ1aWxkZXIudGVzdC9kYXRhP3RhYmxlPXVzZXJzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1721995554);

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE `tags` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tags`
--

INSERT INTO `tags` (`id`, `title`, `created_at`, `updated_at`) VALUES
(1, 'tempore', '2024-05-08 11:20:51', '2024-05-08 11:20:51'),
(2, 'occaecati', '2024-05-08 11:20:51', '2024-05-08 11:20:51'),
(3, 'ut similique', '2024-05-08 11:20:51', '2024-05-08 11:20:51'),
(4, 'autem possimus dolores', '2024-05-08 11:20:51', '2024-05-08 11:20:51'),
(5, 'error', '2024-05-08 11:20:51', '2024-05-08 11:20:51'),
(6, 'earum', '2024-05-08 11:20:51', '2024-05-08 11:20:51'),
(7, 'ducimus suscipit', '2024-05-08 11:20:51', '2024-05-08 11:20:51'),
(8, 'voluptatum ut necessitatibus', '2024-05-08 11:20:51', '2024-05-08 11:20:51'),
(9, 'ut ut', '2024-05-08 11:20:51', '2024-05-08 11:20:51'),
(10, 'quia voluptatem rerum', '2024-05-08 11:20:51', '2024-05-08 11:20:51'),
(11, 'sed', '2024-05-08 11:20:51', '2024-05-08 11:20:51'),
(12, 'fugiat et', '2024-05-08 11:20:51', '2024-05-08 11:20:51'),
(13, 'sit qui', '2024-05-08 11:20:51', '2024-05-08 11:20:51'),
(14, 'error occaecati', '2024-05-08 11:20:51', '2024-05-08 11:20:51'),
(15, 'beatae perspiciatis eligendi', '2024-05-08 11:20:51', '2024-05-08 11:20:51'),
(16, 'quia ab', '2024-05-08 11:20:51', '2024-05-08 11:20:51'),
(17, 'sint blanditiis vel', '2024-05-08 11:20:51', '2024-05-08 11:20:51'),
(18, 'assumenda', '2024-05-08 11:20:51', '2024-05-08 11:20:51'),
(19, 'quas error', '2024-05-08 11:20:51', '2024-05-08 11:20:51'),
(20, 'voluptatem quod', '2024-05-08 11:20:51', '2024-05-08 11:20:51');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Test User', 'test@example.com', '2024-05-08 11:20:50', '$2y$12$9Ihv0Jq06FASXYs21sAIA.Zua9ERUWREUc9avR22Qrp3jyEgZTEDK', 'UlutvcaxZE', '2024-05-08 11:20:51', '2024-05-08 11:20:51');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `blocks`
--
ALTER TABLE `blocks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `blocks_post_id_foreign` (`post_id`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `post_categories`
--
ALTER TABLE `post_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `post_categories_post_id_foreign` (`post_id`),
  ADD KEY `post_categories_category_id_foreign` (`category_id`);

--
-- Indexes for table `post_tags`
--
ALTER TABLE `post_tags`
  ADD PRIMARY KEY (`id`),
  ADD KEY `post_tags_post_id_foreign` (`post_id`),
  ADD KEY `post_tags_tag_id_foreign` (`tag_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `blocks`
--
ALTER TABLE `blocks`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=137;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `post_categories`
--
ALTER TABLE `post_categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=90;

--
-- AUTO_INCREMENT for table `post_tags`
--
ALTER TABLE `post_tags`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100;

--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `blocks`
--
ALTER TABLE `blocks`
  ADD CONSTRAINT `blocks_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `post_categories`
--
ALTER TABLE `post_categories`
  ADD CONSTRAINT `post_categories_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `post_categories_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `post_tags`
--
ALTER TABLE `post_tags`
  ADD CONSTRAINT `post_tags_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `post_tags_tag_id_foreign` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
