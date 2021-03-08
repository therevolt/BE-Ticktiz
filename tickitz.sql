-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 08 Mar 2021 pada 14.26
-- Versi server: 10.4.10-MariaDB
-- Versi PHP: 7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tickitz`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `movies`
--

CREATE TABLE `movies` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `rating` float DEFAULT NULL,
  `duration` varchar(255) DEFAULT NULL,
  `release_date` varchar(255) DEFAULT NULL,
  `director` varchar(255) DEFAULT NULL,
  `genre` varchar(255) DEFAULT NULL,
  `casts` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`casts`)),
  `category` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `movies`
--

INSERT INTO `movies` (`id`, `name`, `image`, `description`, `rating`, `duration`, `release_date`, `director`, `genre`, `casts`, `category`, `created_at`, `updated_at`) VALUES
(1, 'The White Tiger (2021)', 'https://m.media-amazon.com/images/M/MV5BMDVkMDRkMzItN2EyYS00ZTI5LTljYzgtNzRmZDQ0OTQ3M2VjXkEyXkFqcGdeQXVyODk4OTc3MTY@._V1_UX182_CR0,0,182,268_AL_.jpg', 'Balram Halwai (Adarsh Gourav) narrates his epic and darkly humorous rise from poor villager to successful entrepreneur in modern India. Cunning and ambitious, our young hero jockeys his way into becoming a driver for Ashok (Rajkumar Rao) and Pinky (Priyanka Chopra-Jonas), who have just returned from America. Society has trained Balram to be one thing - a servant - so he makes himself indispensable to his rich masters. But after a night of betrayal, he realizes the corrupt lengths they will go to trap him and save themselves. On the verge of losing everything, Balram rebels against a rigged and unequal system to rise up and become a new kind of master.', 7.2, '2 hours 5 minutes', '22 January 2021', 'Ramin Bahrani', 'Crime, Drama', '[\"Adarsh Gourav\",\"Priyanka Chopra\",\"Kamlesh Gill\",\"Tilak Raj\",\"Harshit Mahawar\",\"Rajinder Singh Pancharia\",\"Vijay Maurya\",\"Balvinder Singh Baryah\"]', 'TH-61', '2021-03-07 13:30:13', '2021-03-07 13:30:13'),
(2, 'On the Rocks (2020)', 'https://m.media-amazon.com/images/M/MV5BZTEwY2M0NzAtYjBiMi00Yzg3LWE0ZGYtYTYwODEzMWU0MDFhXkEyXkFqcGdeQXVyMDM2NDM2MQ@@._V1_UX182_CR0,0,182,268_AL_.jpg', 'A young mother reconnects with her larger-than-life playboy father on an adventure through New York.', 7, '1 hours 36 minutes', '23 October 2020', 'Sofia Coppola', 'Comedy, Drama, Romance', '[\"Bill Murray\",\"Marlon Wayans\",\"Jenny Slate\",\"Alexandra Mary Reimer\",\"Barbara Bain\",\"Alva Chinn\",\"Musto Pelinkovicci\",\"Melissa Errico\"]', 'ON-98', '2021-03-07 13:30:58', '2021-03-07 13:30:58'),
(3, 'Wonder Woman 1984 (2020)', 'https://m.media-amazon.com/images/M/MV5BYTlhNzJjYzYtNGU3My00ZDI5LTgzZDUtYzllYjU1ZmU0YTgwXkEyXkFqcGdeQXVyMjQwMDg0Ng@@._V1_UX182_CR0,0,182,268_AL_.jpg', 'In 1984, after saving the world in Wonder Woman (2017), the immortal Amazon warrior, Princess Diana of Themyscira, finds herself trying to stay under the radar, working as an archaeologist at the Smithsonian Museum. With the memory of the brave U.S. pilot, Captain Steve Trevor, etched on her mind, Diana Prince becomes embroiled in a sinister conspiracy of global proportions when a transparent, golden-yellow citrine gemstone catches the eye of the power-hungry entrepreneur, Maxwell Lord. Now, as a dear old friend from the past miraculously enters the picture, and Barbara Minerva, Diana\'s insecure gemologist colleague gives in to desire, suddenly, deceit, greed, and false promises catapult Maxwell into the limelight. More and more, cataclysmic events push the world to the brink, and emotionally vulnerable Diana must address a cruel dilemma. Can mighty Wonder Woman save humankind once again?', 5.4, '2 hours 31 minutes', '25 December 2020', 'Patty Jenkins', 'Action, Adventure, Fantasy', '[\"Gal Gadot\",\"Kristen Wiig\",\"Robin Wright\",\"Lilly Aspell\",\"Kristoffer Polaha\",\"Ravi Patel\",\"Lucian Perez\",\"Kelvin Yu\"]', 'WO-56', '2021-03-07 13:44:23', '2021-03-07 13:44:23'),
(4, 'The Perfect Match (2016)', 'https://m.media-amazon.com/images/M/MV5BMTY2NDY5NDUzMV5BMl5BanBnXkFtZTgwMTEyNDQ3NzE@._V1_UY268_CR1,0,182,268_AL_.jpg', 'Terrence J. stars as Charlie, a playboy who\'s convinced that relationships are dead. His two best friends, Donald Faison and Robert C. Riley, bet him that if he sticks to one woman for one month, he\'s bound to get attached. Charlie denies this until he crosses paths with the beautiful and mysterious Eva, played by singer/actress Cassie. They may agree to a casual affair, but eventually Charlie is questioning whether he may actually want more.', 4.9, '1 hours 36 minutes', '11 March 2016', 'Bille Woodruff', 'Comedy, Romance', '[\"Terrence Jenkins\",\"Donald Faison\",\"Robert Christopher Riley\",\"Paula Patton\",\"Casper Smart\",\"French Montana\",\"Timothy DeLaGhetto\",\"Kali Hawk\"]', 'TH-96', '2021-03-07 13:45:52', '2021-03-07 13:45:52'),
(5, 'Eyes Wide Shut (1999)', 'https://m.media-amazon.com/images/M/MV5BMjA5NTUwNjI1N15BMl5BanBnXkFtZTYwOTE1ODc5._V1_UX182_CR0,0,182,268_AL_.jpg', 'After his wife, Alice, tells him about her sexual fantasies, William Harford sets out for a night of sexual adventure. After several less than successful encounters, he meets an old friend, Nick Nightingale--now a musician--who tells him of strange sex parties where he is required to play the piano blindfolded. All the men at the party are costumed and wear masks while the women are all young and beautiful. Harford manages to find an appropriate costume and heads out to the party. Once there, however, he is warned by someone who recognizes him, despite the mask, that he is in great danger. He manages to extricate himself, but the threats prove to be quite real and sinister.', 7.4, '2 hours 39 minutes', '16 July 1999', 'Stanley Kubrick', 'Drama, Mystery, Thriller', '[\"Tom Cruise\",\"Madison Eginton\",\"Sydney Pollack\",\"Peter Benson\",\"Michael Doven\",\"Louise J. Taylor\",\"Randall Paul\",\"Lisa Leone\"]', 'EY-35', '2021-03-07 14:01:17', '2021-03-07 14:01:17'),
(6, 'The Last of the Mohicans (1992)', 'https://m.media-amazon.com/images/M/MV5BZDNiYmRkNDYtOWU1NC00NmMxLWFkNmUtMGI5NTJjOTJmYTM5XkEyXkFqcGdeQXVyNzQ1ODk3MTQ@._V1_UX182_CR0,0,182,268_AL_.jpg', 'The last members of a dying Native American tribe, the Mohicans -- Uncas, his father Chingachgook, and his adopted half-white brother Hawkeye -- live in peace alongside British colonists. But when the daughters of a British colonel are kidnapped by a traitorous scout, Hawkeye and Uncas must rescue them in the crossfire of a gruesome military conflict of which they wanted no part: the French and Indian War.', 7.7, '1 hours 52 minutes', '25 September 1992', 'Michael Mann', 'Action, Adventure, Drama', '[\"Daniel Day-Lewis\",\"Russell Means\",\"Jodhi May\",\"Wes Studi\",\"Patrice Chéreau\",\"Terry Kinney\",\"Justin M. Rice\",\"Pete Postlethwaite\"]', 'TH-52', '2021-03-07 14:02:10', '2021-03-07 14:02:10'),
(7, 'Wedding Unplanned (2017)', 'https://m.media-amazon.com/images/M/MV5BNjI2NTFjOGMtYTRjZS00ZTg5LWI0NjAtNzVlYjRmM2Y2M2ZkXkEyXkFqcGdeQXVyNjEwNTM2Mzc@._V1_UY268_CR7,0,182,268_AL_.jpg', 'When Alexia finds a business card for a wedding planner in her boyfriend Mathias\'s pocket, she assumes that he is planning a proposal and instantly says yes. However, the business card was actually for Mathias\'s mistress, who is now hired to plan his unwanted wedding...', 6.2, '1 hours 34 minutes', '26 April 2017', 'Reem Kherici', 'Comedy, Drama', '[\"Reem Kherici\",\"Julia Piaton\",\"François-Xavier Demaison\",\"Lionnel Astier\",\"Victoria Monfort\",\"Paloma Coquant\",\"Félix Bossuet\",\"Natalia Martini\"]', 'WE-69', '2021-03-07 14:02:37', '2021-03-07 14:02:37'),
(8, 'Uncorked (2020)', 'https://m.media-amazon.com/images/M/MV5BZTg3NWFkN2ItOTdjMi00NDk4LTllMDktNGZiNTUxYmZmMjlmXkEyXkFqcGdeQXVyMjM4NTM5NDY@._V1_UX182_CR0,0,182,268_AL_.jpg', 'Elijah must balance his dream of becoming a master sommelier with his father\'s expectations that he carry on the family\'s Memphis BBQ joint.', 6.2, '1 hours 44 minutes', '27 March 2020', 'Prentice Penny', 'Drama', '[\"Courtney B. Vance\",\"Michael Mobley\",\"Mamoudou Athie\",\"Alicia Ester\",\"Kelly Jenrette\",\"Bernard David Jones\",\"Matthew Glave\",\"Phyllis Johnson\"]', 'UN-97', '2021-03-07 14:03:03', '2021-03-07 14:03:03'),
(9, 'Tiny Pretty Things', 'https://m.media-amazon.com/images/M/MV5BZmY0OGIxODUtMzc2NS00OTlmLWEwZTctYzVmNmQzYjE3Njc5XkEyXkFqcGdeQXVyODc0OTEyNDU@._V1_UY268_CR5,0,182,268_AL_.jpg', 'Follows the world of an elite ballet academy, and charts the rise and fall of young adults who live far from their homes, each standing on the verge of greatness or ruin.', 5.8, '1 hours ', 'TVSeries(2020–) TVSeries(–) undefined', 'Kylie Jefferson', 'Drama, Mystery, Thriller', '[\"Brennan Clost\",\"Damon J. Gillespie\",\"Casimere Jollette\",\"Daniela Norman\",\"Clare Butler\",\"Mia Bowman\",\"Lucas De Marinis\",\"Evgeni Dokoukine\",\"Josh St. John\",\"Ty Forhan\",\"Tory Trowbridge\",\"Lauren Holly\",\"Nicole Huff\",\"Paula Boudreau\",\"Alexander Eling\",\"Alexandra Bokyun Chun\",\"Araya Mengesha\"]', 'TI-89', '2021-03-07 14:03:40', '2021-03-07 14:03:40'),
(10, 'Hillbilly Elegy (2020)', 'https://m.media-amazon.com/images/M/MV5BZGI4NzRkNDgtYzQyOS00YWVjLTllYzctNmQ5NzkzOGIxMDBhXkEyXkFqcGdeQXVyODE5NzE3OTE@._V1_UX182_CR0,0,182,268_AL_.jpg', 'Based on the bestselling memoir by J.D. Vance, HILLBILLY ELEGY is a modern exploration of the American Dream and three generations of an Appalachian family as told by its youngest member, a Yale Law student forced to return to his hometown.', 6.8, '1 hours 56 minutes', '24 November 2020', 'Ron Howard', 'Drama', '[\"Amy Adams\",\"Gabriel Basso\",\"Freida Pinto\",\"Owen Asztalos\",\"Stephen Kunken\",\"Morgan Gao\",\"Jono Mitchell\",\"David Dwyer\"]', 'HI-16', '2021-03-07 14:04:27', '2021-03-07 14:04:27'),
(11, 'I Care a Lot (2020)', 'https://m.media-amazon.com/images/M/MV5BYWU2ZTRhNDMtMWYxMC00ZTVkLThjZmItZGY4MGU0YmZlMjJlXkEyXkFqcGdeQXVyMTkxNjUyNQ@@._V1_UX182_CR0,0,182,268_AL_.jpg', 'Poised with sharklike self-assurance, Marla Grayson is a professional, court-appointed guardian for dozens of elderly wards whose assets she seizes and cunningly bilks through dubious but legal means. It\'s a well-oiled racket that Marla and her business-partner and lover, Fran, use with brutal efficiency on their latest \"cherry,\" Jennifer Peterson - a wealthy retiree with no living heirs or family. But when their mark turns out to have an equally shady secret of her own and connections to a volatile gangster, Marla is forced to level up in a game only predators can play - one that\'s neither fair, nor square.', 6.2, '1 hours 58 minutes', '19 February 2021', 'J Blakeson', 'Comedy, Crime, Thriller', '[\"Rosamund Pike\",\"Eiza González\",\"Chris Messina\",\"Macon Blair\",\"Damian Young\",\"Liz Eng\",\"Georgia Lyman\",\"Gary Tanguay\"]', 'IC-84', '2021-03-07 14:04:47', '2021-03-07 14:04:47'),
(12, 'Malcolm & Marie (2021)', 'https://m.media-amazon.com/images/M/MV5BYjVkMmU1NGItZjM4MC00ODM1LWEyOTEtY2Y1NTg0YjRhYjEwXkEyXkFqcGdeQXVyMDM2NDM2MQ@@._V1_UX182_CR0,0,182,268_AL_.jpg', 'A filmmaker returns home with his girlfriend following a celebratory movie premiere as he awaits what\'s sure to be imminent critical and financial success. The evening suddenly takes a turn as revelations about their relationships begin to surface, testing the strength of their love.', 6.7, '1 hours 46 minutes', '5 February 2021', 'Sam Levinson', 'Drama, Romance', '[\"John David Washington\"]', 'MA-35', '2021-03-07 14:05:25', '2021-03-07 14:05:25'),
(13, 'Squared Love (2021)', 'https://m.media-amazon.com/images/M/MV5BOWNiMjBjM2MtODRlNy00MmY4LWFiOGUtYWRkYTA0MDgwMGJjXkEyXkFqcGdeQXVyODc0OTEyNDU@._V1_UY268_CR6,0,182,268_AL_.jpg', 'A celebrity journalist and renowned womanizer starts to rethink his life choices after he falls for a mysterious model who leads a double life.', 4.9, '1 hours 42 minutes', '11 February 2021', 'Filip Zylber', 'Comedy, Romance', '[\"Adrianna Chlebicka\",\"Agnieszka Zulewska\",\"Miroslaw Baka\",\"Bartlomiej Kotschedoff\",\"Anna Smolowik\",\"Sebastian Stankiewicz\",\"Ewa Kolasinska\",\"Wojciech Kalarus\",\"Mateusz Banasiuk\",\"Krzysztof Czeczot\",\"Tomasz Karolak\",\"Jacek Knap\",\"Helena Mazur\",\"Jaroslaw Boberek\",\"Izabela Dabrowska\"]', 'SQ-46', '2021-03-07 14:06:49', '2021-03-07 14:06:49'),
(14, 'Crazy About Her (2021)', 'https://m.media-amazon.com/images/M/MV5BZGNiN2MxZTUtYmUyMi00NDBiLTgzM2YtODUzNzQyODJlOWMwXkEyXkFqcGdeQXVyNjEwNTM2Mzc@._V1_UX182_CR0,0,182,268_AL_.jpg', 'After a magical night together, Adri voluntarily turns himself into the psychiatric institution where Carla lives.', 6.6, '1 hours 42 minutes', '26 February 2021', 'Dani de la Orden', 'Comedy, Romance', '[\"Álvaro Cervantes\",\"Luis Zahera\",\"Txell Aixendri\",\"Eduardo Antuña\",\"Clara Segura\",\"Francesc Ferrer\",\"Mireia Portas\",\"Iris Vallés Torres\",\"Susana Abaitua\",\"Aixa Villagrán\",\"Nil Cardoner\",\"Paula Malia\",\"Maria Ribera\",\"Aaron Porras\",\"Eduard Gibert\"]', 'CR-62', '2021-03-07 14:22:39', '2021-03-07 14:22:39'),
(15, 'The Two Popes (2019)', 'https://m.media-amazon.com/images/M/MV5BY2RiOTc1YmYtMDk0Yy00ZWI4LTgzN2YtYTg2ZDZmOGIwNTA1XkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_UX182_CR0,0,182,268_AL_.jpg', 'An intimate story of one of the most dramatic transitions of power in the last 2,000 years. Frustrated with the direction of the church, Cardinal Bergoglio (Jonathan Pryce) requests permission to retire in 2012 from Pope Benedict (Anthony Hopkins). Instead, facing scandal and self-doubt, the introspective Pope Benedict summons his harshest critic and future successor to Rome to reveal a secret that would shake the foundations of the Catholic Church. Behind Vatican walls, a struggle commences between both tradition and progress, guilt and forgiveness, as these two very different men confront their pasts in order to find common ground and forge a future for a billion followers around the world. Inspired by true events.', 7.6, '2 hours 5 minutes', '20 December 2019', 'Fernando Meirelles', 'Biography, Comedy, Drama', '[\"Anthony Hopkins\",\"Juan Minujín\",\"Cristina Banegas\",\"Renato Scarpa\",\"Achille Brugnini\",\"Germán de Silva\",\"Libero De Rienzo\",\"Sofia Cessak\",\"Jonathan Pryce\",\"Luis Gnecco\",\"María Ucedo\",\"Sidney Cole\",\"Federico Torre\",\"Lisandro Fiks\",\"Willie Jonah\"]', 'TH-29', '2021-03-07 14:23:07', '2021-03-07 14:23:07'),
(16, 'Master and Commander: The Far Side of the World (2003)', 'https://m.media-amazon.com/images/M/MV5BMjA5NjYyMDM5NV5BMl5BanBnXkFtZTYwOTU5MDY2._V1_UX182_CR0,0,182,268_AL_.jpg', 'In April 1805 during the Napoleonic Wars, H.M.S. Surprise, a British frigate, is under the command of Captain Jack Aubrey. Aubrey and the Surprise\'s current orders are to track and capture or destroy a French privateer named Acheron. The Acheron is currently in the Atlantic off South America headed toward the Pacific in order to extend Napoleon\'s reach of the wars. This task will be a difficult one as Aubrey quickly learns in an initial battle with the Acheron that it is a bigger and faster ship than the Surprise, which puts the Surprise at a disadvantage. Aubrey\'s single-mindedness in this seemingly impossible pursuit puts him at odds with the Surprise\'s doctor and naturalist, Stephen Maturin, who is also Aubrey\'s most trusted advisor on board and closest friend. Facing other internal obstacles which have resulted in what they consider a string of bad luck, Aubrey ultimately uses Maturin\'s scientific exploits to figure out a way to achieve his and the ship\'s seemingly impossible goal.', 7.4, '2 hours 18 minutes', '14 November 2003', 'Peter Weir', 'Action, Adventure, Drama', '[\"Russell Crowe\",\"James D\'Arcy\",\"Chris Larkin\",\"Jack Randall\",\"Lee Ingleby\",\"Robert Pugh\",\"Ian Mercer\",\"David Threlfall\",\"Paul Bettany\",\"Edward Woodall\",\"Max Pirkis\",\"Max Benitz\",\"Richard Pates\",\"Richard McCabe\",\"Tony Dolan\"]', 'MA-81', '2021-03-07 14:23:55', '2021-03-07 14:23:55'),
(17, 'Como Caído Del Cielo (2019)', 'https://m.media-amazon.com/images/M/MV5BYTQxMmYzZjktOTc4OS00NWIzLWE2N2QtZmVmOWVmNzJiOWMxXkEyXkFqcGdeQXVyNzU2MDA1MA@@._V1_UX182_CR0,0,182,268_AL_.jpg', 'Mexican legend Pedro Infante receives another opportunity on earth to redeem himself for his forays with women and earn heaven in the body of an imitator.', 6.4, '1 hours 52 minutes', '24 December 2019', 'José Pepe Bojórquez', 'Comedy, Drama, Musical', '[\"Omar Chaparro\",\"Stephanie Cayo\",\"Angélica María\",\"Laura de Ita\",\"Alan Gutiérrez\",\"Roger Montes\",\"Lupita Sandoval\",\"Carmen Ramos\",\"Ana Claudia Talancón\",\"Yare Santana\",\"Manuel \'Flaco\' Ibáñez\",\"Elaine Haro\",\"Axel Ricco\",\"Itza Sodi\",\"Daniela Zavala\"]', 'CO-29', '2021-03-07 14:24:47', '2021-03-07 14:24:47'),
(18, 'Peppermint (2018)', 'https://m.media-amazon.com/images/M/MV5BNWVlMjQ3MjItOWE3YS00YTYwLWE0ZDMtZWMyZWY1NzkxNWIwXkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_UX182_CR0,0,182,268_AL_.jpg', 'An unidentified woman is engaged in a brutal fight with a man in a car and finally dispatches him with a shot to the head. Five years earlier, the same woman, Riley North, is working as a bank teller in Los Angeles struggling to make ends meet. Her husband Chris owns a failing mechanic shop. They have a ten-year-old daughter, Carly. Chris\' friend tries to talk him into robbing Diego Garcia, a powerful drug lord. Chris turns him down, but not before Garcia has already discovered his involvement and ordered his men to make an example of him. Riley and Chris take Carly out for pizza and to a carnival for her birthday since no one showed up to her party. At the carnival, Carly orders peppermint ice cream. As the family walks to the car, Diego\'s men gun down her husband and daughter in a drive-by shooting. She is wounded, but survives.', 6.5, '1 hours 41 minutes', '7 September 2018', 'Pierre Morel', 'Action, Drama, Thriller', '[\"Jennifer Garner\",\"John Ortiz\",\"Annie Ilonzeh\",\"Cailey Fleming\",\"Method Man\",\"Ian Casselberry\",\"Johnny Ortiz\",\"Kyla-Drew\",\"John Gallagher Jr.\",\"Juan Pablo Raba\",\"Jeff Hephner\",\"Eddie Shin\",\"Tyson Ritter\",\"Richard Cabral\",\"Michael Reventar\"]', 'PE-65', '2021-03-07 14:25:08', '2021-03-07 14:25:08'),
(19, 'Ready to Mingle (2019)', 'https://m.media-amazon.com/images/M/MV5BZjU3YzUzZjItNDAwYy00NTAyLWJmMGUtZjExNDNmYzE0MzhjXkEyXkFqcGdeQXVyMjM0MDgwMA@@._V1_UY268_CR3,0,182,268_AL_.jpg', 'A wannabe bride seeks professional help to find a husband and, in the process, finds herself.', 5.9, '1 hours 35 minutes', '7 June 2019', 'Luis Javier Henaine', 'Comedy', '[\"Cassandra Ciangherotti\",\"Irán Castillo\",\"Edwarda Gurrola\",\"Juan Pablo Medina\",\"Diana Bovio\",\"Mar Carrera\",\"Lucía Uribe\",\"Francisco de la Reguera\",\"Gabriela de la Garza\",\"Sophie Alexander-Katz\",\"Mariana Cabrera\",\"Pablo Cruz\",\"Andrés Almeida\",\"Leonardo Daniel\",\"Tatiana del Real\"]', 'RE-36', '2021-03-07 14:25:27', '2021-03-07 14:25:27'),
(20, 'Bad Times at the El Royale (2018)', 'https://m.media-amazon.com/images/M/MV5BOTk1Nzk1MDc1MF5BMl5BanBnXkFtZTgwNjU2NDExNjM@._V1_UX182_CR0,0,182,268_AL_.jpg', 'Six strangers, (Jeff Bridges, Cynthia Erivo, Dakota Johnson, Jon Hamm, Cailee Spaeny and Lewis Pullman) each with their own secrets, meet at the El Royale hotel of Lake Tahoe. Taking place over one night, alliances are made and secrets are revealed.', 7.1, '2 hours 21 minutes', '12 October 2018', 'Drew Goddard', 'Crime, Drama, Mystery', '[\"Jeff Bridges\",\"Dakota Johnson\",\"Chris Hemsworth\",\"Lewis Pullman\",\"Xavier Dolan\",\"Mark O\'Brien\",\"Jim O\'Heir\",\"Alvina August\",\"Cynthia Erivo\",\"Jon Hamm\",\"Cailee Spaeny\",\"Nick Offerman\",\"Shea Whigham\",\"Charles Halford\",\"Gerry Nairn\"]', 'BA-68', '2021-03-07 14:26:10', '2021-03-07 14:26:10'),
(21, 'Tom Clancy\'s Without Remorse (2021)', 'https://m.media-amazon.com/images/M/MV5BNjAyOTg1ODAtNDhiNS00OTczLWI1OGYtNTI1ZDg3ZDEwNDg1XkEyXkFqcGdeQXVyMjkwOTAyMDU@._V1_UX182_CR0,0,182,268_AL_.jpg', 'An elite Navy SEAL uncovers an international conspiracy while seeking justice for the murder of his pregnant wife in Tom Clancy\'s Without Remorse, the explosive origin story of action hero John Clark - one of the most popular characters in author Tom Clancy\'s Jack Ryan universe. When a squad of Russian soldiers kills his family in retaliation for his role in a top-secret op, Sr. Chief John Kelly (Michael B. Jordan) pursues the assassins at all costs. Joining forces with a fellow SEAL (Jodie Turner-Smith) and a shadowy CIA agent (Jamie Bell), Kelly\'s mission unwittingly exposes a covert plot that threatens to engulf the U.S. and Russia in an all-out war. Torn between personal honor and loyalty to his country, Kelly must fight his enemies without remorse if he hopes to avert disaster and reveal the powerful figures behind the conspiracy.', 8.8, '1 hours 43 minutes', '30 April 2021', 'Chris Columbus', 'Action, Adventure, Thriller', '[\"Michael B. Jordan\", \"Jamie Bell\", \"Lauren London\", \"Todd Lasance\", \"Lucy Russell\", \"Luke Mitchell\", \"Brett Gelman\", \"Alexander Mercury\"]', 'TC-21', '2021-03-07 14:27:12', '2021-03-07 14:27:12');

-- --------------------------------------------------------

--
-- Struktur dari tabel `ticket`
--

CREATE TABLE `ticket` (
  `id` int(11) NOT NULL,
  `playing_time` datetime DEFAULT NULL,
  `movie_id` int(11) NOT NULL,
  `seat_count` int(11) DEFAULT NULL,
  `seat_description` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `ticket`
--

INSERT INTO `ticket` (`id`, `playing_time`, `movie_id`, `seat_count`, `seat_description`, `user_id`, `created_at`, `updated_at`) VALUES
(10, '2021-03-17 09:00:00', 1, 5, 'D', 2, '2021-03-06 03:06:52', '2021-03-06 03:06:52'),
(22, '2021-03-17 09:00:00', 1, 5, 'E', 2, '2021-03-06 04:46:42', '2021-03-06 04:46:42'),
(23, '2021-03-17 09:00:00', 1, 5, 'E', 2, '2021-03-06 04:46:58', '2021-03-06 04:46:58'),
(24, '2021-03-17 09:00:00', 1, 5, 'E', 2, '2021-03-06 04:48:00', '2021-03-06 04:48:00'),
(25, '2021-03-17 09:00:00', 1, 5, 'F', 2, '2021-03-06 04:51:23', '2021-03-06 04:51:23'),
(28, '2021-03-17 09:00:00', 15, 5, 'F', 2, '2021-03-07 20:08:30', '2021-03-07 20:08:30');

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaction`
--

CREATE TABLE `transaction` (
  `id` int(11) NOT NULL,
  `total_price` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL,
  `ticket_id` int(11) DEFAULT NULL,
  `transaction_status` enum('failed','canceled','pending','success') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `transaction`
--

INSERT INTO `transaction` (`id`, `total_price`, `user_id`, `created_at`, `updated_at`, `ticket_id`, `transaction_status`) VALUES
(6, 150000, 2, '2021-03-06 04:57:51', '2021-03-06 04:57:51', 10, 'pending'),
(12, 30000, 2, '2021-03-06 13:14:15', '2021-03-06 13:14:15', 10, 'success');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id`, `first_name`, `last_name`, `email`, `password`, `created_at`, `updated_at`) VALUES
(2, 'Rama', 'Seftiansyah', 'dev2@sgbteam.id', 'ArkademY2021', '2021-03-06 02:11:29', '2021-03-06 02:11:29'),
(3, 'Rama', 'Seftiansyah', 'dev@sgbteam.id', 'ArkademY2021', '2021-03-07 00:55:51', '2021-03-07 00:55:51'),
(4, 'Herza', 'P', 'sample@gmail.com', 'ArkademY2021', '2021-03-08 19:59:00', '2021-03-08 19:59:00');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `movies`
--
ALTER TABLE `movies`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `ticket`
--
ALTER TABLE `ticket`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indeks untuk tabel `transaction`
--
ALTER TABLE `transaction`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `ticket_id` (`ticket_id`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `movies`
--
ALTER TABLE `movies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT untuk tabel `ticket`
--
ALTER TABLE `ticket`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT untuk tabel `transaction`
--
ALTER TABLE `transaction`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `ticket`
--
ALTER TABLE `ticket`
  ADD CONSTRAINT `ticket_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Ketidakleluasaan untuk tabel `transaction`
--
ALTER TABLE `transaction`
  ADD CONSTRAINT `transaction_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `transaction_ibfk_2` FOREIGN KEY (`ticket_id`) REFERENCES `ticket` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
