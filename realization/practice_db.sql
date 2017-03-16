-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Хост: 127.0.0.1
-- Время создания: Мар 16 2017 г., 21:57
-- Версия сервера: 10.1.19-MariaDB
-- Версия PHP: 7.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `practice_db`
--

-- --------------------------------------------------------

--
-- Структура таблицы `continent`
--

CREATE TABLE `continent` (
  `id` tinyint(4) NOT NULL,
  `name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `continent`
--

INSERT INTO `continent` (`id`, `name`) VALUES
(1, 'Asia'),
(2, 'Europe'),
(3, 'America');

-- --------------------------------------------------------

--
-- Структура таблицы `country`
--

CREATE TABLE `country` (
  `id` tinyint(4) NOT NULL,
  `name` varchar(30) NOT NULL,
  `short_name` varchar(5) DEFAULT NULL,
  `square` smallint(5) UNSIGNED DEFAULT NULL,
  `population` int(16) UNSIGNED DEFAULT NULL,
  `president` varchar(30) DEFAULT NULL,
  `continent_id` tinyint(4) DEFAULT NULL,
  `prime_minister` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `country`
--

INSERT INTO `country` (`id`, `name`, `short_name`, `square`, `population`, `president`, `continent_id`, `prime_minister`) VALUES
(1, 'Canada', 'ca', 65535, 35219000, 'Elizabeth II', 3, 'Justin Trudeau'),
(2, 'Austria', 'aut', 65535, 857975, 'Alexander Van der Bellen', 2, 'Christian Kern'),
(3, 'Bulgaria', 'bgr', 65535, 720220, 'Rumen Radev', 2, 'Ognian Gerdzhikov'),
(4, 'Ukraine', 'ua', 65535, 4241490, 'Peter Poroshenko', 2, 'Vladimir Groysman'),
(6, 'Poland', 'pl', 65535, 3843724, 'Andrzej Duda', 2, 'Beata Shidlo'),
(7, 'United Kingdom', 'uk', 65535, 6534118, 'Elizabeth II', 2, 'Teresa May'),
(8, 'Japan', 'jpn', 65535, 126960000, 'Akihito', 1, 'Shinzo Abe'),
(9, 'Germany', 'deu', 65535, 8216200, 'Joachim Gauck', 2, 'Angela Merkel'),
(10, 'Belarus', 'blr', 65535, 949840, 'Alexander Lukashenko', 2, 'Andrey Kobyakov');

-- --------------------------------------------------------

--
-- Структура таблицы `country_language`
--

CREATE TABLE `country_language` (
  `id` int(11) NOT NULL,
  `country_id` tinyint(4) NOT NULL,
  `language_id` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `country_language`
--

INSERT INTO `country_language` (`id`, `country_id`, `language_id`) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 3, 1),
(4, 8, 4),
(5, 8, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `language`
--

CREATE TABLE `language` (
  `id` tinyint(4) NOT NULL,
  `name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `language`
--

INSERT INTO `language` (`id`, `name`) VALUES
(1, 'English'),
(2, 'Ukrainian'),
(3, 'Russian'),
(4, 'Japanese'),
(5, 'Swedish'),
(6, 'Portuguese');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `continent`
--
ALTER TABLE `continent`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `country`
--
ALTER TABLE `country`
  ADD PRIMARY KEY (`id`),
  ADD KEY `continent_id` (`continent_id`);

--
-- Индексы таблицы `country_language`
--
ALTER TABLE `country_language`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK1_county_lang` (`country_id`),
  ADD KEY `FK2_county_lang` (`language_id`);

--
-- Индексы таблицы `language`
--
ALTER TABLE `language`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `continent`
--
ALTER TABLE `continent`
  MODIFY `id` tinyint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT для таблицы `country`
--
ALTER TABLE `country`
  MODIFY `id` tinyint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT для таблицы `country_language`
--
ALTER TABLE `country_language`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT для таблицы `language`
--
ALTER TABLE `language`
  MODIFY `id` tinyint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `country`
--
ALTER TABLE `country`
  ADD CONSTRAINT `FK_continent` FOREIGN KEY (`continent_id`) REFERENCES `continent` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `country_language`
--
ALTER TABLE `country_language`
  ADD CONSTRAINT `FK1_county_lang` FOREIGN KEY (`country_id`) REFERENCES `country` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK2_county_lang` FOREIGN KEY (`language_id`) REFERENCES `language` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
