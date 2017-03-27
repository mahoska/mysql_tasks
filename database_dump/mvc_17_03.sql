-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Хост: 127.0.0.1
-- Время создания: Мар 28 2017 г., 00:05
-- Версия сервера: 10.1.19-MariaDB
-- Версия PHP: 7.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `mvc_17_03`
--

-- --------------------------------------------------------

--
-- Структура таблицы `author`
--

CREATE TABLE `author` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `author`
--

INSERT INTO `author` (`id`, `name`) VALUES
(1, 'Роберт Говард'),
(2, 'Пол Андерсен'),
(3, 'Роберт Желязны'),
(4, 'Сергей Лукьяненко'),
(5, 'Владимир Васильев'),
(6, 'Эндрю Нортон'),
(7, 'Александр Сергеевич Пушкин'),
(8, 'Корней Чуковский'),
(9, 'Самуил Маршак'),
(10, 'Софья Прокофьева'),
(11, 'Эдуард Успенский'),
(12, 'Николай Носов');

-- --------------------------------------------------------

--
-- Структура таблицы `book`
--

CREATE TABLE `book` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(100) NOT NULL,
  `price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `style_id` tinyint(3) UNSIGNED DEFAULT NULL,
  `description` text,
  `status` tinyint(4) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `book`
--

INSERT INTO `book` (`id`, `title`, `price`, `style_id`, `description`, `status`) VALUES
(1, 'Дневной дозор', '170.50', 8, 'Ночные охотники с городских улиц. Вампиры и оборотни, колдуньи и ведьмаки. Те, что живут в часы когда спускается на землю мгла. Те, что веками противостоят силам белых магов. Потому, что понимают - равновесие должно быть соблюдено... ', 1),
(2, 'Галактический почтовой', '180.76', 7, 'В книгу известного американского фантаста Эндрю Нортон включены научно фантастические романы из серий произведений об экипаже межгалактического корабля ''Королева Солнца''\r\n', 0),
(3, 'Конан, варвар из Киммерии', '298.50', 8, 'В этот том включены повести и новеллы о Конане-варваре из Киммерии, сражавшемся с многочисленными врагами 150 веков тому назад. Конан - самый популярный герой самого знаметого родоначальника жанра фентези Роберта Говарда ', 1),
(4, 'Звездная стража. Крестоносцы неба', '102.50', 7, 'Существует древняя легенда о римском императоре, который, чтобы показать свою власть, вызвал командира верного легиона и велел ему с его людьми идти по Азии до края света. И вот тысяча человек исчезла на огромном континенте, была проглочена им навсегда. На каком–нибудь неизвестном поле битвы последняя горстка выживших выстроилась в каре, защищаясь от нападения варваров. А их орел, может быть, поколения спустя стоял, одинокий и полинявший, в палатке вождя кочевников. Но тот, кто знал этих гордых людей, их службу и традиции, мог предположить, что они продолжали идти на восток, пока хоть один оставался на ногах. В 8054 г. от рождества Христова история повторилась, как это всегда бывает. Первая Галактическая империя разваливалась. Диктаторы , императоры, объединители вырывали изпод власти Центрального Контроля свои собственные и соседние солнечные системы. Космические императоры поднимали флаги и истребляли флоты, чтобы поглощать добычу – остатки крушения империи. В это время процветали только безжалостные. Тут и там человек или группа людей тщетно пытались противостоять потоку разрушения и разобщения. И среди этих борцов, которые отказывались забыть веру в нерушимое правление Центрального Контроля, самыми заметными были остатки Звездного Патруля, вооруженного объединения, которое тысячи лет пользовалось непререкаемым авторитетом. Возможно, именно потому, что в своих рядах они больше не находили безопасности. Эти люди еще крепче держались друг друга, еще строже придерживались своего древнего кодекса этики и морали. И их упрямая верность исчезнувшим идеалам и раздражала новых правителей, и вызывала у них жалость. ', 1),
(5, 'Маша и Ойка', '100.20', 2, 'В книгу вошли замечательные сказки, стихи, истории, художественная ценность и занимательность которых не вызывает сомнения. Чем раньше взрослые начнут приучать ребенка к книге, тем гармоничнее будет развиваться малыш', 1),
(6, 'Доктор Айболит: Пента и морские пираты', '25.65', 2, 'Доктор Айболит любил гулять. Каждый вечер, после работы он брал зонтик и уходил  со своими зверями куда-нибудь в лес или поле. Рядом с ним шагал Тянитолкай, впереди бежала утка Кика, сзади собака Ава и свинка Хрю-Хрю... ', 1),
(7, 'Вот какой рассеянный...\r\n', '150.50', 2, 'Увлекательные стихи для малышей', 1),
(8, 'Доктор Айболит: Путешествие в Страну Обезьян', '225.50', 2, 'Жил был доктор. Он был добрый. Звали его Айболит. И была у него злая сестра, которую звали Варвара. Больше всего на свете он любил зверей. В комнате у него жили зайцы, в шкафу у него жила белка, в буфете- ворона, на диване жил колючий ёж. И со всеми ними произошли невероятные приключения...', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `book_author`
--

CREATE TABLE `book_author` (
  `author_id` int(10) UNSIGNED NOT NULL,
  `book_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `book_author`
--

INSERT INTO `book_author` (`author_id`, `book_id`) VALUES
(1, 3),
(4, 1),
(5, 1),
(6, 2),
(6, 4),
(8, 6),
(8, 8),
(9, 7),
(10, 5);

-- --------------------------------------------------------

--
-- Структура таблицы `messages`
--

CREATE TABLE `messages` (
  `id` int(10) UNSIGNED NOT NULL,
  `username` varchar(30) NOT NULL,
  `email` varchar(50) NOT NULL,
  `message` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `messages`
--

INSERT INTO `messages` (`id`, `username`, `email`, `message`) VALUES
(8, 'last', 'test@mail.ru', 'Last testing');

-- --------------------------------------------------------

--
-- Структура таблицы `style`
--

CREATE TABLE `style` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `title` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `style`
--

INSERT INTO `style` (`id`, `title`) VALUES
(1, 'ужасы'),
(2, 'детская литература'),
(3, 'детективы'),
(4, 'приключения'),
(5, 'романы'),
(6, 'учебная литература'),
(7, 'фантастика'),
(8, 'фэнтези');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `author`
--
ALTER TABLE `author`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `book`
--
ALTER TABLE `book`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_style` (`style_id`);

--
-- Индексы таблицы `book_author`
--
ALTER TABLE `book_author`
  ADD PRIMARY KEY (`author_id`,`book_id`),
  ADD KEY `fk_book` (`book_id`);

--
-- Индексы таблицы `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `style`
--
ALTER TABLE `style`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `author`
--
ALTER TABLE `author`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT для таблицы `book`
--
ALTER TABLE `book`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT для таблицы `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT для таблицы `style`
--
ALTER TABLE `style`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `book`
--
ALTER TABLE `book`
  ADD CONSTRAINT `FK_style` FOREIGN KEY (`style_id`) REFERENCES `style` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `book_author`
--
ALTER TABLE `book_author`
  ADD CONSTRAINT `fk_author` FOREIGN KEY (`author_id`) REFERENCES `author` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_book` FOREIGN KEY (`book_id`) REFERENCES `book` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
