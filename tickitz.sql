-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 24 Mar 2021 pada 10.41
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
-- Struktur dari tabel `cinemas`
--

CREATE TABLE `cinemas` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `address` longtext DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `cinemas`
--

INSERT INTO `cinemas` (`id`, `name`, `logo`, `address`, `created_at`, `updated_at`) VALUES
(1, 'ebv.id', 'https://i.ibb.co/1JFP05m/ebv-id.png', '1 fX Sudirman, Jl. Jend. Sudirman No.25, RT.1/RW.3, Gelora, Kecamatan Tanah Abang, Kota Jakarta Pusat, Daerah Khusus Ibukota Jakarta 10270', '2021-03-19 18:21:33', '2021-03-19 18:21:33'),
(2, 'XXI Cinema', 'https://i.ibb.co/NxVb3yh/XXI.png', 'MAL BAYWALK PLUIT Lantai.6\r\nJln. Pluit Karang Ayu Blok B1 Utara\r\nJakarta Utara', '2021-03-21 12:31:05', '2021-03-21 12:31:05'),
(3, 'CGV', 'https://www.centralparkjakarta.com/wp-content/uploads/2017/11/cgv.jpg', 'Jl. Jend. Sudirman No.52-53, RT.5/RW.3, Senayan, Kec. Kby. Baru, Kota Jakarta Selatan, Daerah Khusus Ibukota Jakarta 12190', '2021-03-21 14:32:40', '2021-03-21 14:32:40'),
(4, 'sadsadsa', 'dsadsad', 'sadsadsad', '2021-03-21 14:47:03', '2021-03-21 14:47:03');

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
  `duration_hours` int(11) DEFAULT NULL,
  `duration_minutes` int(11) DEFAULT NULL,
  `release_date` datetime DEFAULT NULL,
  `director` varchar(50) DEFAULT NULL,
  `genre` varchar(255) DEFAULT NULL,
  `casts` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`casts`)),
  `category` varchar(10) DEFAULT NULL,
  `showing` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `movies`
--

INSERT INTO `movies` (`id`, `name`, `image`, `description`, `rating`, `duration_hours`, `duration_minutes`, `release_date`, `director`, `genre`, `casts`, `category`, `showing`, `created_at`, `updated_at`) VALUES
(1, 'Action', 'http://localhost:6000/avatar/1616543034983_beground-tembok-35.jpg', 'An agent, sent by the Indian army to observe a terrorist, finds his mission complicated when he discovers undercover agents in his own country.', 4.5, 2, 38, '0000-00-00 00:00:00', 'Sundar C.', 'Action, Adventure, Thriller', '[\"Vishal\",\"Aishwarya Lekshmi\",\"Yogi Babu\",\"Chaya Singh\",\"Sha Ra\",\"Bharath Reddy\",\"Pala Karuppaiah\",\"Yuri Suri\",\"Tamannaah Bhatia\",\"Ramki\",\"Akanksha Puri\",\"Kabir Duhan Singh\",\"Arav Chowdharry\",\"Vincent Ashokan\",\"Sayaji Shinde\"]', 'AC-79', 0, NULL, '2021-03-19 13:48:48'),
(2, 'Action (1980)', 'https://m.media-amazon.com/images/M/MV5BNzA1ODkwNzQ4NV5BMl5BanBnXkFtZTcwNTUzNDQzMQ@@._V1_UY268_CR2,0,182,268_AL_.jpg', 'Bruno is an idealistic hero who questions the meaning of life in this confusing and sometimes hallucinatory erotic drama. After a night in jail, he is gang-raped by punk rockers in a garbage dump. He later saves an old man who believes he is Garibaldi and a woman he believes is Ophelia. Bruno watches helplessly as she later jumps from a window.', 4.8, 2, 1, '1980-01-04 00:00:00', 'Tinto Brass', 'Drama', '[\"Luc Merenda\",\"Susanna Javicoli\",\"Alberto Sorrentino\",\"Giancarlo Badessi\",\"Edoardo Florio\",\"Alberto Lupo\",\"Alina De Simone\",\"Beatrice Brass\",\"Adriana Asti\",\"Paola Senatore\",\"Gianfranco Bullo\",\"John Steiner\",\"Luciano Crovato\",\"Paola Montenero\",\"Franco Fabrizi\"]', 'AC-98', 0, NULL, '2021-03-19 13:55:00'),
(3, 'Agnichakra (1997)', 'https://m.media-amazon.com/images/M/MV5BMzViZTJhMzItMGEyNy00OTNhLTkwZGQtOWU2ZWIwODIwNGQwXkEyXkFqcGdeQXVyMjU4NDY1ODA@._V1_UY268_CR1,0,182,268_AL_.jpg', 'Amar lives a middle-class life with his Police Inspector brother, Suryaveer, and sister-in-law, Beena. Suryaveer is assigned to handle the task of apprehending a group of terrorists, headed by Jumbo, who have made their hideout in a dense forest in Central India. Suryaveer\'s partner is Inspector Satpal, who is an alcoholic. Suryaveer is also told that six other police inspectors have lost their lives in this assignment. Nevertheless, Suryaveer and Satpal get ready to tackle this task and do penetrate deep into the forests. Then Beena gets the devastating news that Satpal has been injured and her husband has been killed. The police assign this matter to another Police Inspector by the name of Vikas, and Amar and Satpal lend a hand to support him. The question remains will the trio succeed where so many have already failed and been killed?', 3.6, NULL, NULL, '1997-02-26 00:00:00', 'Ketan AnandAmit Suryavanshi', 'Action', '[\"Naseeruddin Shah\",\"Dimple Kapadia\",\"Somy Ali\",\"Pramod Moutho\",\"Brando Bakshi\",\"Birbal\",\"Bob Christo\",\"Geeta Khanna\",\"Govinda\",\"Raj Kiran\",\"Anupam Kher\",\"Beena Banerjee\",\"Kamal Chopra\",\"Bindiya Gill\",\"Vishal Khanna\"]', 'AG-99', 0, NULL, '2021-03-19 14:10:17'),
(4, 'Anchorman: The Legend of Ron Burgundy (2004)', 'https://m.media-amazon.com/images/M/MV5BMTQ2MzYwMzk5Ml5BMl5BanBnXkFtZTcwOTI4NzUyMw@@._V1_UX182_CR0,0,182,268_AL_.jpg', 'In 1970s San Diego, journalism was a well respected profession and people actually cared about what they saw on TV. And the top rated anchor man in the city is Ron Burgundy. He enjoys his run at the top, and has for the last five years. And his news team is equally as good as he is. Professional jock and former professional baseball player Champ Kind handles the sports, the curiously dim witted Brick Tamland - who\'s a few channels short of a cable subscription - handles the weather, and ladies\' man Brian Fantana - whose collection of fine scents would be in the Guinness Book Of Records - handles the on-field reporting. But now all that is about to change forever. The TV station Burgundy works for, Channel 4, has embraced diversity and has hired a beautiful new female anchor named Veronica Corningstone. While Ron Burgundy and the rest of the Channel 4 news team enjoys fighting with competitors, drinking, and flirting with the ladies, Veronica quietly climbs her way to the top. And ...', 7.2, NULL, NULL, NULL, 'Adam McKay', 'Comedy', '[\"Will Ferrell\",\"Paul Rudd\",\"David Koechner\",\"Chris Parnell\",\"Fred Armisen\",\"Paul F. Tompkins\",\"Scot Robinson\",\"Darcy Donavan\",\"Christina Applegate\",\"Steve Carell\",\"Fred Willard\",\"Kathryn Hahn\",\"Seth Rogen\",\"Danny Trejo\",\"Ian Roberts\"]', 'AN-10', 0, NULL, '2021-03-19 14:10:17'),
(5, 'Truth or Dare (2018)', 'https://m.media-amazon.com/images/M/MV5BOGU2YTZmMjYtZDUwYi00NTc1LTlkMjAtM2ViZDkzOTlhNGNhXkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_UX182_CR0,0,182,268_AL_.jpg', 'Olivia Barron, her best friend Markie Cameron, Markie\'s boyfriend Lucas Moreno, along with Penelope Amari and her boyfriend Tyson Curran, and Brad Chang go on a trip to Rosarito, Mexico. In Mexico, Olivia runs into fellow student Ronnie who proceeds to harass her until a man intervenes on her behalf. The man introduces himself as Carter and eventually convinces her and her friends to join him for drinks at the ruins of a mission. There, Carter initiates a game of Truth or Dare with Olivia and her friends, plus Ronnie, who followed the group. Eventually, the game ends when Carter reveals that he deceived Olivia as a means of tricking her and her friends to the mission to offer them in his place in the supernatural game of Truth or Dare. As Carter leaves, he explains to Olivia that the game will follow them and they must not refuse it..', 5.2, NULL, NULL, NULL, 'Jeff Wadlow', 'Horror, Thriller', '[\"Lucy Hale\",\"Violett Beane\",\"Sophia Ali\",\"Landon Liboiron\",\"Tom Choi\",\"Gregg Daniel\",\"Vera Taylor\",\"Andrew Howard\",\"Tyler Posey\",\"Hayden Szeto\",\"Nolan Gerard Funk\",\"Sam Lerner\",\"Aurora Perrineau\",\"Brady Smith\",\"Ezmie Garcia\"]', 'TR-71', 0, NULL, '2021-03-19 14:10:17'),
(6, 'Action Point (2018)', 'https://m.media-amazon.com/images/M/MV5BMjEyMTU5MTk1N15BMl5BanBnXkFtZTgwMzIzMzczNTM@._V1_UX182_CR0,0,182,268_AL_.jpg', 'D.C. (Johnny Knoxville) is the crackpot owner of Action Point, a low-rent, out-of-control amusement park with dangerous rides. Just as D.C.\'s estranged teenage daughter Boogie (Eleanor Worthington Cox) comes to visit, a corporate mega-park opens nearby and jeopardizes the future of Action Point. To save his beloved theme park and his relationship with his daughter, D.C. and the Action Point staff risk everything to pull out all the stops..', 5.1, NULL, NULL, NULL, 'Tim Kirkby', 'Comedy', '[\"Johnny Knoxville\",\"Chris Pontius\",\"Johnny Pemberton\",\"Eric Manaka\",\"Conner McVicker\",\"Aidan Whytock\",\"Aidan Scott\",\"Matt Schulze\",\"Eleanor Worthington-Cox\",\"Dan Bakkedahl\",\"Brigette Lundy-Paine\",\"Joshua Hoover\",\"Michael Everson\",\"Matthew Peterson\",\"Ashley Dickerson\"]', 'AC-34', 0, NULL, '2021-03-19 14:10:17'),
(7, 'Class Action Park (2020)', 'https://m.media-amazon.com/images/M/MV5BM2ZhOWM0ZjQtNjI2OC00YjEzLThiMjUtNGI0NjU1OWNlNWEzXkEyXkFqcGdeQXVyNjEwNTM2Mzc@._V1_UX182_CR0,0,182,268_AL_.jpg', 'A documentary that focuses on a dangerously legendary water park and its slew of injuries and crimes along with child safety concerns.', 7, NULL, NULL, '2020-08-27 00:00:00', 'Seth PorgesChris Charles Scott III', 'Documentary', '[\"Mary Pilon\",\"Jessi Paladini\",\"Matthew Callan\",\"Chris Gethard\",\"Seth Porges\",\"Ed Youmans\",\"Bill Benneyan\",\"Joe Hession\",\"Jim DeSaye\",\"Andrew Mulvihill\",\"Alison Becker\",\"Mark Johnson\",\"Daron Fitch\",\"Bob Krahulik\",\"Faith Anderson\"]', 'CL-73', 0, NULL, '2021-03-19 14:10:17'),
(8, 'Action Jackson (1988)', 'https://m.media-amazon.com/images/M/MV5BZWFhNmI3OWQtOTU5Zi00ODA3LWExNjctMTllZWE2ZGE3ZTA1XkEyXkFqcGdeQXVyNzc5MjA3OA@@._V1_UX182_CR0,0,182,268_AL_.jpg', 'Jericho \"Action\" Jackson is a Detroit police sergeant who was demoted from lieutenant for almost tearing the arm off of sexually violent sociopath Sean Dellaplane, whose father is Peter Dellaplane, a major car manufacturer. But Dellaplane himself is violent as well. Dellaplane kills his wife Patrice by shooting her. And then he plants her body in Jackson\'s apartment, framing Jackson. Dellaplane won\'t miss Patrice very much, because he has a drug-addicted mistress named Sydney Ash. He keeps Sydney hooked with a free supply of heroin. Jackson suspects Dellaplane of masterminding a murder spree against local officials from the auto workers\' union. Dellaplane\'s mission is to gain a political power base and choose the next president of the United States. Because of what happened to Dellaplane\'s son Sean, Dellaplane has taken a particular dislike to Jackson. Jackson gets Sydney\'s help in going after Dellaplane.', 5.5, NULL, NULL, '1988-02-12 00:00:00', 'Craig R. Baxley', 'Action, Comedy, Crime', '[\"Carl Weathers\",\"Vanity\",\"Thomas F. Wilson\",\"Robert Davi\",\"Roger Aaron Brown\",\"Mary Ellen Trainor\",\"Bob Minor\",\"Dennis Hayden\",\"Craig T. Nelson\",\"Sharon Stone\",\"Bill Duke\",\"Jack Thibeau\",\"Stan Foster\",\"Ed O\'Ross\",\"David Glen Eisley\"]', 'AC-16', 0, NULL, '2021-03-19 14:10:17'),
(9, 'Extraction (2020)', 'https://m.media-amazon.com/images/M/MV5BMDJiNzUwYzEtNmQ2Yy00NWE4LWEwNzctM2M0MjE0OGUxZTA3XkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_UX182_CR0,0,182,268_AL_.jpg', 'In an underworld of weapons dealers and traffickers, a young boy becomes the pawn in a war between notorious drug lords. Trapped by kidnappers inside one of the world\'s most impenetrable cities, his rescue beckons the unparalleled skill of a mercenary named Tyler Rake, but Rake is a broken man with nothing to lose, harboring a death wish that makes an already deadly mission near impossible.', 6.7, NULL, NULL, NULL, 'Sam Hargrave', 'Action, Thriller', '[\"Chris Hemsworth\",\"Ryder Lerum\",\"Shivam Vichare\",\"Sara Rumao\",\"Aarti Kulkarni\",\"Praveen Indu\",\"Pankaj Tripathi\",\"Pallas Prajapati\",\"Bryon Lerum\",\"Rudhraksh Jaiswal\",\"Piyush Khati\",\"Randeep Hooda\",\"Umakant Patil\",\"Swapnil Kokam\",\"Neha Mahajan\"]', 'EX-80', 0, NULL, '2021-03-19 14:10:17'),
(10, 'Pulp Fiction (1994)', 'https://m.media-amazon.com/images/M/MV5BNGNhMDIzZTUtNTBlZi00MTRlLWFjM2ItYzViMjE3YzI5MjljXkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_UY268_CR1,0,182,268_AL_.jpg', 'Jules Winnfield (Samuel L. Jackson) and Vincent Vega (John Travolta) are two hit men who are out to retrieve a suitcase stolen from their employer, mob boss Marsellus Wallace (Ving Rhames). Wallace has also asked Vincent to take his wife Mia (Uma Thurman) out a few days later when Wallace himself will be out of town. Butch Coolidge (Bruce Willis) is an aging boxer who is paid by Wallace to lose his fight. The lives of these seemingly unrelated people are woven together comprising of a series of funny, bizarre and uncalled-for incidents.', 8.9, NULL, NULL, NULL, 'Quentin Tarantino', 'Crime, Drama', '[\"Tim Roth\",\"Laura Lovelace\",\"Samuel L. Jackson\",\"Frank Whaley\",\"Bruce Willis\",\"Paul Calderon\",\"Rosanna Arquette\",\"Uma Thurman\",\"Amanda Plummer\",\"John Travolta\",\"Phil LaMarr\",\"Burr Steers\",\"Ving Rhames\",\"Bronagh Gallagher\",\"Eric Stoltz\"]', 'PU-52', 0, NULL, '2021-03-19 14:10:17'),
(11, 'Fatal Attraction (1987)', 'https://m.media-amazon.com/images/M/MV5BYjBjNzNiNWYtYWU0NC00OTdjLTk3NmYtM2NjZjc2ZGIwOTQ1XkEyXkFqcGdeQXVyMTQxNzMzNDI@._V1_UX182_CR0,0,182,268_AL_.jpg', 'Happily married New York lawyer Dan Gallagher has an affair with his colleague Alex, and the two enjoy a love weekend while Dan\'s wife and kid are away. But Alex will not let go of him, and she will stop at nothing to have him for herself. Just how far will she go to get what she wants?', 6.9, NULL, NULL, '1987-09-18 00:00:00', 'Adrian Lyne', 'Drama, Thriller', '[\"Michael Douglas\",\"Anne Archer\",\"Stuart Pankin\",\"Fred Gwynne\",\"Tom Brennan\",\"Mike Nussbaum\",\"Michael Arkin\",\"Eunice Prewitt\",\"Glenn Close\",\"Ellen Latzen\",\"Ellen Foley\",\"Meg Mundy\",\"Lois Smith\",\"J.J. Johnston\",\"Sam Coppola\"]', 'FA-44', 0, NULL, '2021-03-19 14:10:17'),
(12, 'Thriller - en grym film (1973)', 'https://m.media-amazon.com/images/M/MV5BNTEwZjY3MjQtMGQ2Yi00NThhLThlZTItYjM4MmIwODVjNzY5XkEyXkFqcGdeQXVyMjUyNDk2ODc@._V1_UY268_CR0,0,182,268_AL_.jpg', 'Rendered mute after a horrific assault in the park by a sadistic old paedophile, young Madeleine tries to escape the traumatic experience living in silence in her parents\' farmhouse. However, things will take a turn for the worse, when an innocent offer for a lift by a handsome stranger in a flashy sports-car leads to a nightmarish life of prostitution, abuse, and drug addiction. But when Madeleine finds out her evil pimp\'s cruel scheme, an irrevocable course of sweet retribution and a deadly sawed-off double-barrelled shotgun will inevitably set the stage for a bloody roaring rampage of revenge. And then, no one will ever dare to harm her again. Never again.', 6.4, 1, 44, '2001-01-09 00:00:00', 'Bo Arne Vibenius', 'Crime, Drama, Thriller', '[\"Christina Lindberg\",\"Despina Tomazani\",\"Solveig Andersson\",\"Marie-Louise Mannervall\",\"Stig Lokrantz\",\"Marshall McDough\",\"Pamela Pethö-Galantai\",\"Hans-Eric Stenborg\",\"Heinz Hopf\",\"Per-Axel Arosenius\",\"Björn Kristiansson\",\"Hildur Lindberg\",\"Olle Nordlander\",\"Gunnar Palm\",\"Lennart Robertsson\"]', 'TH-18', 0, NULL, '2021-03-19 14:15:54'),
(13, 'Thriller (2018)', 'https://m.media-amazon.com/images/M/MV5BNWU1ZTEzYTMtZmQ1Ny00Y2ZjLWJmMTUtNGE0NzNhZjBhMzU1XkEyXkFqcGdeQXVyMTExMDczNTI@._V1_UX182_CR0,0,182,268_AL_.jpg', 'A childhood prank comes back to haunt a clique of South Central Los Angeles teens when their victim returns home during their high-school Homecoming weekend.', 3.6, 1, 27, '2019-04-14 00:00:00', 'Dallas Jackson', 'Crime, Drama, Horror', '[\"Jessica Allain\",\"Mitchell Edwards\",\"Chelsea Rendon\",\"Pepi Sonuga\",\"Maestro Harrell\",\"Michael Ocampo\",\"Chauncey Jenkins\",\"Zachariah Waller\",\"Luke Tennie\",\"Paige Hurd\",\"Tequan Richmond\",\"Jason Woods\",\"Mykelti Williamson\",\"RZA\",\"Valery M. Ortiz\"]', 'TH-31', 0, NULL, '2021-03-19 14:15:54'),
(14, 'Giallo a Venezia (1979)', 'https://m.media-amazon.com/images/M/MV5BMDA0M2JlNDEtNzE4Yi00MDM2LWFkZTUtNGY0MTMwODE1YWE1XkEyXkFqcGdeQXVyMjA0MzYwMDY@._V1_UY268_CR4,0,182,268_AL_.jpg', 'Inspector Angelo De Pol (Jeff Blynn) is assigned to the case of a double murder in Venice, the victims were a married couple. He suspects that a psycho killer in on the loose, however during the investigation the inspector discovers that the husband was a sex maniac and a drug addict. Soon afterwards bloody killings begin to occur.', 5.2, 1, 31, '1979-12-31 00:00:00', 'Mario Landi', 'Crime, Horror, Mystery', '[\"Leonora Fani\",\"Gianni Dei\",\"Eolo Capritti\",\"Giancarlo Del Duca\",\"Jeff Blynn\",\"Michele Renzullo\",\"Vassili Karis\",\"Mariangela Giordano\"]', 'GI-45', 0, NULL, '2021-03-19 14:15:54'),
(15, 'Amsterdam Affair (1968)', 'https://m.media-amazon.com/images/M/MV5BNzc0OTM0ZjAtMzM2NC00ZDk0LTk5NDUtYjk3NWY2NzgwMDQ0XkEyXkFqcGdeQXVyMDYxMTUwNg@@._V1_UX182_CR0,0,182,268_AL_.jpg', 'An Englishman in Holland gets involved in a murder case. It looks bad for him, but the wily Inspector Van Der Valk isn\'t convinced of his guilt.', 5.2, 1, 30, '1968-06-09 00:00:00', 'Gerry O\'Hara', 'Mystery', '[\"Wolfgang Kieling\",\"Catherine Schell\",\"J.A.B. Dubin-Behrmann\",\"Lo van Hensbergen\",\"Liesbeth Struppert\",\"Onno Molenkamp\",\"Trudy de Jong\",\"Peter Burton\",\"William Marlowe\",\"Pamela Ann Davy\",\"Guy Deghy\",\"Guido de Moor\",\"Piet Römer\",\"Erik Plooyer\",\"Will Van Selst\"]', 'AM-58', 0, NULL, '2021-03-19 14:15:54'),
(16, 'Scorched Heat (1987)', 'https://m.media-amazon.com/images/M/MV5BNDg3OTRjZmEtZWYyZi00MmIxLWIwZTktZGNjNjc0NmY4ZjVjXkEyXkFqcGdeQXVyNzMzMjU5NDY@._V1_UX182_CR0,0,182,268_AL_.jpg', 'Steve is a successful businessman in Dallas. One day he receives a letter from his old friend Eric in Sweden. Eric is overstrained and threatens to reveal a crime that they committed as children. Steve realizes that he has to go to Sweden and help Eric. Steve\'s wife Linda insists on coming too. Something she will deeply regret. When they arrive in Sweden they find Eric on the verge of insanity. He raves about their old teacher, who was burned to death in a mysterious fire many years ago. Steve and Linda become involved in Eric\'s world of illusions. Soon it gets impossible to distinguish between dream and reality. They are more and more affected by an evil force from the other side. The trip that should have been a vacation to Sweden becomes a one way ticket to hell.', 3.8, 1, 30, '2010-10-30 00:00:00', 'Peter Borg', 'Horror', '[\"Peter Borg\",\"Babs Brinklund\",\"Demba Conta\",\"Tony Ellis\",\"Michael Flanigan\",\"Max Fredriksson\",\"Anders Jönsson\",\"Martin J. Larsson\",\"Martin Brandqvist\",\"Dennis Castillo\",\"Johan Dernelius\",\"Eric Elmerson\",\"Anna Fransson\",\"Johnny Harborg\",\"Kjell Larsson\"]', 'SC-10', 0, NULL, '2021-03-19 14:15:54'),
(17, 'Gekijô-ban: Kaidan resutoran (2010)', 'https://m.media-amazon.com/images/M/MV5BOGU3NmY5YmQtOTBhNy00OTJkLWExZGMtNjA0ZmJlNmRmODQ1XkEyXkFqcGdeQXVyMjgzNDQyMjE@._V1_UY268_CR4,0,182,268_AL_.jpg', 'At the spooky western styled mansion turned restaurant \"Thriller Restaurant,\" Kuroka and Ryu disappear. After their disappearance others start to disappear at the restaurant. Rumors soon start that the devil himself is responsible for the missing persons.', 5.6, 1, 40, '2010-08-21 00:00:00', 'Masayuki Ochiai', 'Animation, Horror', '[\"Masumi Asano\",\"Hiroaki Hirata\",\"Ayano Kudô\",\"Toshifumi Muramatsu\",\"Masahiko Nishimura\",\"Ryôko Shiraishi\",\"Keisuke Tomita\",\"Hiro Yûki\",\"Ayame Gôriki\",\"Hairi Katagiri\",\"Win Morisaki\",\"Mitsuhiro Nagatomo\",\"Maya Sakura\",\"Takushi Tanaka\",\"Yoshiaki Yamane\"]', 'GE-96', 0, NULL, '2021-03-19 14:15:54'),
(18, 'The Thriller (2010)', 'https://m.media-amazon.com/images/M/MV5BOTQ1ZDA4YTgtMDRhMi00MGFiLThhZTctY2ZiZjcwNGMxOTA2XkEyXkFqcGdeQXVyMjkxNzQ1NDI@._V1_UX182_CR0,0,182,268_AL_.jpg', 'Simon is the son of Joseph Palathinkal, a business multi millionaire. One night during the night patrol, Niranjan finds Simon stabbed and murdered on a highway. Who killed him? and why?', 4.6, 2, 20, '2010-11-17 00:00:00', 'B. Unnikrishnan', 'Crime, Drama, Thriller', '[\"Lalu Alex\",\"Vincent Ashoka\",\"Shivaji Guruvayoor\",\"Mallika Kapoor\",\"Mamta Mohandas\",\"Uma Pathmanabhan\",\"Sampath Raj\",\"Kishore Satya\",\"Anand\",\"M.R. Gopakumar\",\"Sasi Kalinga\",\"Riyaz Khan\",\"Dinesh Panicker\",\"Prajiinn\",\"Sambathu\"]', 'TH-80', 0, NULL, '2021-03-19 14:15:54'),
(19, 'Cheap Thrills (2013)', 'https://m.media-amazon.com/images/M/MV5BMTY2Mzg0NDE4OV5BMl5BanBnXkFtZTgwMzYyMDI4MDE@._V1_UX182_CR0,0,182,268_AL_.jpg', 'Craig (Pat Healy) is a struggling family man who loses his low-wage job and is threatened with eviction. In an effort to delay facing the music at home, he heads to a local bar and runs into an old friend (Ethan Embry). The 2 are roped into a round of drinks by a charismatic and obscenely wealthy stranger (David Koechner) along with his mysterious wife (Sara Paxton). The couple engages the pair friends in a series of innocent dares in exchange for money over the course of the evening, with each challenge upping the ante in both reward and boundaries. It seems like easy and much needed money, but the couple\'s twisted sense of humor pushes just how far Craig and his friend are willing to go for money and cheap thrills.', 6.7, 1, 28, '2014-03-21 00:00:00', 'E.L. Katz', 'Comedy, Crime, Drama', '[\"Pat Healy\",\"Ethan Embry\",\"Amanda Fuller\",\"Todd Farmer\",\"Eric Neil Gutierrez\",\"Claudia Salinas\",\"Eli McLaughlin\",\"Sara Paxton\",\"David Koechner\",\"Laura Covelli\",\"Elissa Dowling\",\"Ruben Pla\",\"Brighton Sharbino\",\"Butch\"]', 'CH-41', 0, NULL, '2021-03-19 14:15:54'),
(20, 'Pornography (2009)', 'https://m.media-amazon.com/images/M/MV5BMTM3MDkwNDM1OV5BMl5BanBnXkFtZTcwNTI1NDk2Mw@@._V1_UY268_CR3,0,182,268_AL_.jpg', 'A gay porn star\'s mysterious disappearance becomes an obsession for both a writer and another adult film star, leading them into dark supernatural corners that were never meant to be explored.', 4.7, 1, 53, '2010-07-08 00:00:00', 'David Kittredge', 'Mystery', '[\"Matthew Montgomery\",\"Jared Grey\",\"Dylan Vox\",\"Wyatt Fenner\",\"Akie Kotabe\",\"Rasool J\'Han\",\"Bret Wolfe\",\"David Pevsner\",\"Pete Scherer\",\"Walter Delmar\",\"Nick Salamone\",\"Larry Weissman\",\"Steve Callahan\",\"Jon Gale\",\"Joe Langer\"]', 'PO-89', 0, NULL, '2021-03-19 14:15:54'),
(21, 'The Driller Killer (1979)', 'https://m.media-amazon.com/images/M/MV5BYmE3Yzc1ZTktMDAwNC00OTg0LWI1ZmYtMzg2NDNiOWRlZjkwXkEyXkFqcGdeQXVyMjI4MjA5MzA@._V1_UX182_CR0,0,182,268_AL_.jpg', 'Reno is an artist struggling to survive in NYC. He draws inspiration from scenes of daily street life and occasional random violence. Under pressure to finish his oft-delayed grand masterpiece, his psychotic alter-ego takes over and he begins killing random vagrants to boost his creativity, not quite realizing that it is happening in reality. When an art dealer grimly rejects Reno\'s finished masterpiece, Reno\'s mental condition quickly deteriorates.', 5.2, 1, 36, '1979-06-15 00:00:00', 'Abel Ferrara', 'Drama, Horror, Thriller', '[\"Abel Ferrara\",\"Baybi Day\",\"Alan Wynroth\",\"James O\'Hara\",\"Louis Mascolo\",\"Rita Gooding\",\"Gary Cohen\",\"Joyce Finney\",\"Carolyn Marz\",\"Harry Schultz\",\"Maria Helhoski\",\"Richard Howorth\",\"Tommy Santora\",\"Chuck Saaf\",\"Janet Dailey\"]', 'TH-84', 0, NULL, '2021-03-19 14:15:54'),
(22, 'The Thrill Killers (1964)', 'https://m.media-amazon.com/images/M/MV5BZmU0YmE0NTAtMzNmZi00NmM0LTg2NWEtMjdlNTUwODM3MjViL2ltYWdlL2ltYWdlXkEyXkFqcGdeQXVyMjI4MjA5MzA@._V1_UX182_CR0,0,182,268_AL_.jpg', 'Three psychotic murderers escape from a mental institution and stalk women in Los Angeles.', 5.5, 1, 10, '1964-08-07 00:00:00', 'Ray Dennis Steckler', 'Action, Crime, Horror', '[\"Ray Dennis Steckler\",\"Joseph Bardo\",\"Gary Kent\",\"Keith O\'Brien\",\"Ron Burr\",\"Erina Enyo\",\"Nancy Crawford\",\"George Caldwell\",\"Liz Renay\",\"Carolyn Brandt\",\"Herb Robins\",\"Laura Benedict\",\"Titus Moede\",\"Atlas King\",\"Gene Pollock\"]', 'TH-25', 0, NULL, '2021-03-19 14:15:54'),
(23, 'The Thrill of It All (1963)', 'https://m.media-amazon.com/images/M/MV5BZTNkYTlkNmMtZGEwNy00ZjI1LWEzODctNTExOWQ0NTNjN2QzXkEyXkFqcGdeQXVyMTMxMTY0OTQ@._V1_UX182_CR0,0,182,268_AL_.jpg', 'The Happy Soap Company is owned and managed by the Fraleigh family. Although he is more of a company figurehead than an active participant in the company\'s day-to-day business, anything that family patriarch Tom Fraleigh wants for the company he usually gets. What he wants is Beverly Boyer - the wife of his daughter-in-law\'s obstetrician, Dr. Gerald Boyer - to appear as the company spokesperson when Beverly, whom he meets at a small dinner party, mentions a personal and true story about how Happy Soap \"saved her life\". She is to appear in a live commercial spot during a Happy Soap sponsored television show telling her story just as she told Tom. Despite Beverly\'s performance going poorly in her own mind, Tom loved how refreshing and honest Beverly came across to the viewer. So Tom signs her to a one year, $80,000 contract to continue doing the same. This move is questioned by Happy Soap\'s own managers and its advertising company, but it is questioned even more by Gerald, who believes ...', 7, 1, 48, '1963-07-17 00:00:00', 'Norman Jewison', 'Comedy, Romance', '[\"Doris Day\",\"Arlene Francis\",\"Reginald Owen\",\"Elliott Reid\",\"Kym Karath\",\"Lucy Landau\",\"Hayden Rorke\",\"Robert Gallagher\",\"James Garner\",\"Edward Andrews\",\"Zasu Pitts\",\"Alice Pearce\",\"Brian Nash\",\"Paul Hartman\",\"Alex Gerry\"]', 'TH-98', 0, NULL, '2021-03-19 14:15:54'),
(24, 'The Only Thrill (1997)', 'https://m.media-amazon.com/images/M/MV5BMjA2Mzk0NTg2OV5BMl5BanBnXkFtZTYwNzI3ODg5._V1_UX182_CR0,0,182,268_AL_.jpg', 'Reece McHenry is a used-clothing store owner and Carol Fitzsimmons is a seamstress working in that store. The film follows the story of their relationships from 1960s till present time (as well as the story of relationships between Reece\'s son Tom and Carol\'s daughter Katherine).', 6.1, 1, 43, NULL, 'Peter Masterson', 'Drama, Romance', '[\"Diane Keaton\",\"Diane Lane\",\"Tate Donovan\",\"Stacey Travis\",\"Brandon Smith\",\"Fred Ellis\",\"B.A. Woods\",\"Jessica Looney\",\"Sam Shepard\",\"Robert Patrick\",\"Sharon Lawrence\",\"Brad Leland\",\"Richard Nance\",\"Robert Lott\",\"Mona Lee Fultz\"]', 'TH-98', 0, NULL, '2021-03-19 14:15:54'),
(25, 'Killers Three (1968)', 'https://m.media-amazon.com/images/M/MV5BZWFjZGM0YmUtZDc5ZC00ZDU5LTk2MDUtMDMyMGVkNTZkZjk1XkEyXkFqcGdeQXVyNDkzNTM2ODg@._V1_UX182_CR0,0,182,268_AL_.jpg', 'Two backwoods North Carolinians (Robert Walker, Jr., and Dick Clark, who also produced) rob a bootlegger\'s safe, kill several people in the process, and head for California with Walker\'s wife (Diane Varsi). Merle Haggard appears as a sheriff and sings the title song and \"Mama Tried.\"', 5.1, 1, 28, '1968-11-01 00:00:00', 'Bruce Kessler', 'Crime, Drama', '[\"Robert Walker Jr.\",\"Dick Clark\",\"Maureen Arthur\",\"Merle Haggard\",\"John \'Bud\' Cardos\",\"Douglas Barger\",\"Lorene Klepacki\",\"Jerry Petty\",\"Diane Varsi\",\"Norman Alden\",\"Tony York\",\"Bonnie Owens\",\"William Alspaugh\",\"Beach Dickerson\",\"Barbara Page\"]', 'KI-42', 0, NULL, '2021-03-19 14:15:54'),
(26, 'Thrillkill (1984)', 'https://m.media-amazon.com/images/M/MV5BZDYyNDFkN2UtYWY4NS00NTIxLTk4YzktYTI2MGE3ZDdhYWRmXkEyXkFqcGdeQXVyMzU0NzkwMDg@._V1_UX182_CR0,0,182,268_AL_.jpg', 'Karlie Kendall\'s job is to write computer games - but in her spare time she hacks bank accounts. With 5 million dollars gathered, she wants to retire to Brazil - unaware that her secret partner Adrienne intends to keep all the money. Moreover, Karlie\'s boss Julien has got to know of her doing and has hired villains to get hold of the treasure. Only after Karlie\'s death they realize that she has hidden the money well inside the computer game \"Thrillkill\" - leaving the single clue to her sister, stewardess Bobbie.', 4.1, 1, 36, '1984-12-14 00:00:00', 'Anthony D\'AndreaAnthony Kramreither', 'Crime, Thriller', '[\"Robin Ward\",\"Laura Robinson\",\"Colleen Embree\",\"Eugene Clark\",\"Joy Boushel\",\"Gina Massey\",\"Diana Reis\",\"Kurt Reis\",\"Frank Moore\",\"Grant Cowan\"]', 'TH-51', 0, NULL, '2021-03-19 14:15:54'),
(27, 'Thriller Town (2022)', 'https://m.media-amazon.com/images/M/MV5BZmZiY2RhMzctNTU3Ny00M2ZjLThiMDctZDg5MzAzZDIzNzI3XkEyXkFqcGdeQXVyMTc1NzIyMDM@._V1_UX182_CR0,0,182,268_AL_.jpg', 'Ultimately, Vera realized that a fugitive she\'s hunting down is actually a person she must rescue in order to solve a mystery behind her fiance Tony\'s death.', 0, 1, 50, '2022-06-09 00:00:00', 'Chabi Ibidon', 'Thriller', '[]', 'TH-54', 0, NULL, '2021-03-19 14:15:54'),
(28, 'Thrilling (1965)', 'https://m.media-amazon.com/images/M/MV5BYWFlMTUzNDMtNDU2MS00Njg0LTkyODctNzNlYjllYzg0ZTA0XkEyXkFqcGdeQXVyMzIzNDU1NTY@._V1_UY268_CR1,0,182,268_AL_.jpg', 'Three segments: in the first one (Il vittimista) a teacher is obsessed with the idea his wife betrays him. When he goes to a shrink he lets him understand that his fear has to do with him having cheated on her for some time. When he dumps the mistress and confesses to his wife she forgives him while the mistress seems to take it rather seriously. In the second segment (Sadik) a wife has her husband dress himself with a comic character costume. In the last segment (L\'autostrada del sole) a man has to spend the night in a mysterious hotel because of his car breaking down.', 6.6, 1, 57, '1965-10-21 00:00:00', 'Carlo LizzaniGian Luigi Polidoro1 more credit', 'Comedy, Mystery, Thriller', '[\"Nino Manfredi\",\"Magda Konopka\",\"Walter Chiari\",\"Alberto Sordi\",\"Nicoletta Machiavelli\",\"Oretta Fiume\",\"Raimondo Castellani\",\"Renato Terra\",\"Alexandra Stewart\",\"Tino Buazzelli\",\"Dorian Gray\",\"Sylva Koscina\",\"Alessandro Cutolo\",\"Alessandra Dal Sasso\",\"Raffaele Scialo\"]', 'TH-53', 0, NULL, '2021-03-19 14:15:54'),
(29, 'Thrill Ride (2016)', 'https://m.media-amazon.com/images/M/MV5BYjg3NTIxODUtMGZlMS00Y2IzLWI5YmMtNWI5NGE1ODNmM2Q4XkEyXkFqcGdeQXVyMTM3MTA2ODk@._V1_UX182_CR0,0,182,268_AL_.jpg', 'For generations, there have been all kinds of wild rumors surrounding gangster Al Capone\'s hidden fortune and the mysterious amusement park he built. When three kids sneak into the rundown park on the hunt for Capone\'s loot, the attractions come to life and take the kids on a wild and dangerous ride beyond all imagination. Now to survive the night, they must team up with a friendly sea witch, find a secret underground ride and take on an evil mermaid, bloodthirsty pirates, a fire-breathing dragon and an armada of monsters. And all on a school night!', 6.4, 1, 26, NULL, 'Chris Parrish', 'Adventure, Comedy', '[\"Kristen Johnston\",\"Tim Kazurinsky\",\"Michael B. Woods\",\"Nicole Scimeca\",\"Clare O\'Connor\",\"Andy Luther\",\"Paul Lang\",\"Frank Wiltse\",\"Lucas Jade Zumann\",\"Helen Sadler\",\"Sophia Ntovas\",\"Ira Amyx\",\"John Babbo\",\"Danny Farber\",\"Sarah Manasseri\"]', 'TH-14', 0, NULL, '2021-03-19 14:15:54'),
(30, 'Chhupa Rustam: A Musical Thriller (2001)', 'https://m.media-amazon.com/images/M/MV5BNGI4YWQ3MzQtNTM2Ny00YzcyLWIzYjQtZmNkOGVlYWIyM2EzXkEyXkFqcGdeQXVyNTM0MDc1ODE@._V1_UY268_CR43,0,182,268_AL_.jpg', 'Nirmal (Sanjay Kapoor) studies in London, and his dad (Anant Mahadevan) lives in a palatial home in India with his mom (Navneet Nishan). Unknown to both Nirmal and his dad, mom is having an affair with an employee, Baldev Diwan (Dalip Tahil). When caught in the act by dad, they kill him and his driver, Satpal (Mushtaq Khan) and arrange an accident with the help of another employee Manikchand (Tinnu Anand). When Nirmal returns he is informed of the accident, and he believes his dad dies of a car accident. One day while romancing with his girlfriend Sandhya (Mamta Kulkarni), he comes across Satpal, who is now confined in a mental institution. Curious to see what Satpal has to say about the accident, Nirmal arranges for more qualified doctors in the big city to examine Satpal. Unknown to Nirmal, Superintendent of Police Thappa (Raj Babbar) is plotting with Raja (also played by Sanjay Kapoor) to kill Nirmal and take his place, Raja\'s girlfriend, Nisha (Manisha Koirala) overhears this and ...', 4.5, 2, 7, '2001-04-25 00:00:00', 'Aziz Sejawal', 'Drama, Musical, Romance', '[\"Sanjay Kapoor\",\"Manisha Koirala\",\"Tinnu Anand\",\"Avtar Gill\",\"Mushtaq Khan\",\"Ananth Narayan Mahadevan\",\"Vishwajeet Pradhan\",\"Dalip Tahil\",\"Mamta Kulkarni\",\"Raj Babbar\",\"Laxmikant Berde\",\"Satyendra Kapoor\",\"Viju Khote\",\"Navneet Nishan\",\"Ram Sethi\"]', 'CH-46', 0, NULL, '2021-03-19 14:15:54'),
(31, 'In Time (2011)', 'https://m.media-amazon.com/images/M/MV5BMjA3NzI1ODc1MV5BMl5BanBnXkFtZTcwMzI5NjQwNg@@._V1_UY268_CR5,0,182,268_AL_.jpg', 'Welcome to a world where time has become the ultimate currency. You stop aging at 25, but there\'s a catch: you\'re genetically-engineered to live only one more year, unless you can buy your way out of it. The rich \"earn\" decades at a time (remaining at age 25), becoming essentially immortal, while the rest beg, borrow or steal enough hours to make it through the day. When a man from the wrong side of the tracks is falsely accused of murder, he is forced to go on the run with a beautiful hostage. Living minute to minute, the duo\'s love becomes a powerful tool in their war against the system.', 6.7, 1, 49, NULL, 'Andrew Niccol', 'Action, Sci-Fi, Thriller', '[\"Justin Timberlake\",\"Shyloh Oostwald\",\"Colin McGurk\",\"Michael William Freeman\",\"Aaron Perilo\",\"Will Peltz\",\"Matt Bomer\",\"Laura Ashley Samuels\",\"Olivia Wilde\",\"Johnny Galecki\",\"Will Harris\",\"Jesse Lee Soffer\",\"Nick Lashaway\",\"Ray Santiago\",\"Zuleyka Silver\"]', 'IN-97', 0, NULL, '2021-03-19 14:15:54'),
(32, 'A Call to Spy (2019)', 'https://m.media-amazon.com/images/M/MV5BMTk2ZjJiZTItYTJiOC00YmIyLWI2MmYtZWJkZGMzNDE4NjU1XkEyXkFqcGdeQXVyMTkxNjUyNQ@@._V1_UY268_CR2,0,182,268_AL_.jpg', 'In the beginning of WWII, with Britain becoming desperate, Churchill orders his new spy agency -- the Special Operations Executive (SOE) -- to recruit and train women as spies. Their daunting mission: conduct sabotage and build a resistance. SOE\'s \"spymistress,\" Vera Atkins (Stana Katic), recruits two unusual candidates: Virginia Hall (Sarah Megan Thomas), an ambitious American with a wooden leg, and Noor Inayat Khan (Radhika Atpe), a Muslim pacifist. Together, these women help to undermine the Nazi regime in France, leaving an unmistakable legacy in their wake. Inspired by true stories.', 6.4, 2, 3, NULL, 'Lydia Dean Pilcher', 'Biography, Crime, Drama', '[\"Sarah Megan Thomas\",\"Radhika Apte\",\"Rossif Sutherland\",\"Andrew Richardson\",\"Marc Rissmann\",\"Lola Pashalinski\",\"Rob Heaps\",\"Marceline Hugot\",\"Stana Katic\",\"Linus Roache\",\"Samuel Roukin\",\"Laila Robins\",\"Mathilde Ollivier\",\"David Schaal\",\"Matt Salinger\"]', 'AC-80', 0, NULL, '2021-03-19 14:15:54'),
(33, 'Thrill Kill (2016)', 'https://m.media-amazon.com/images/M/MV5BMjA5YmMwNWEtZWZiOS00NmEzLTkxZGItOTEzZjBiMDRiYmU3XkEyXkFqcGdeQXVyMzYxODUyMTM@._V1_UY268_CR1,0,182,268_AL_.jpg', 'Three seemingly normal teenagers commit a heinous murder for the sheer excitement of the act & their master ploy slowly crumbles to pieces... Thrill Kill is a dark, suspenseful tale which explores the cynical relationship between three lost teenagers left drifting alone in a foreclosed corner of Small Town America feeding on booze, pop culture, drugs, violent video games & plotting the unthinkable... a gruesome murder for the thrill of it.', 7.3, 1, 25, '2016-02-01 00:00:00', 'Giuseppe Asaro', 'Crime, Horror, Thriller', '[\"Veronica Asaro\",\"Sean Duggan\",\"Jennifer Kelly\",\"Kadu Lennox\",\"Max Gray Wilbur\",\"Todd Landon Black\",\"Dalton James\",\"Adea Lennox\",\"Harmony Smith\"]', 'TH-11', 0, NULL, '2021-03-19 14:15:54'),
(34, 'Thrill of a Romance (1945)', 'https://m.media-amazon.com/images/M/MV5BODc5OTM3MmUtNTQxYS00MWNlLTlhN2YtZWExN2RiZjJhZWJkXkEyXkFqcGdeQXVyNTY4NjI2OTA@._V1_UX182_CR0,0,182,268_AL_.jpg', 'Cynthia is swept off her feet and marries a rich and very successful business executive, but business affairs make him abandon her during their honeymoon. Cynthia is sad and while he\'s away, meets the charming war hero, Maj. Milvaine, who is on leave. Sparks fly. Will she choose wealth over love?', 6.5, 1, 45, '1945-11-12 00:00:00', 'Richard Thorpe', 'Musical, Romance', '[\"Van Johnson\",\"Frances Gifford\",\"Spring Byington\",\"Carleton G. Young\",\"Donald Curtis\",\"Fernando Alvarado\",\"Vince Barnett\",\"Joan Fay Macaboy\",\"Esther Williams\",\"Henry Travers\",\"Lauritz Melchior\",\"Ethel Griffies\",\"Jerry Scott\",\"Helene Stanley\",\"Billy House\"]', 'TH-59', 0, NULL, '2021-03-19 14:15:54'),
(35, 'Ad Astra (2019)', 'https://m.media-amazon.com/images/M/MV5BZTllZTdlOGEtZTBmMi00MGQ5LWFjN2MtOGEyZTliNGY1MzFiXkEyXkFqcGdeQXVyODk4OTc3MTY@._V1_UX182_CR0,0,182,268_AL_.jpg', 'Astronaut Roy McBride (Brad Pitt) travels to the outer edges of the solar system to find his missing father and unravel a mystery that threatens the survival of our planet. His journey will uncover secrets that challenge the nature of human existence and our place in the cosmos.', 6.5, 2, 3, NULL, 'James Gray', 'Adventure, Drama, Mystery', '[\"Brad Pitt\",\"Ruth Negga\",\"Kimberly Elise\",\"Donnie Keshawarz\",\"Bobby Nish\",\"John Finn\",\"Freda Foh Shen\",\"Ravi Kapoor\",\"Tommy Lee Jones\",\"Donald Sutherland\",\"Loren Dean\",\"Sean Blakemore\",\"LisaGay Hamilton\",\"John Ortiz\",\"Kayla Adams\"]', 'AD-85', 0, NULL, '2021-03-19 14:15:54'),
(36, 'Bridge of Spies (2015)', 'https://m.media-amazon.com/images/M/MV5BMjIxOTI0MjU5NV5BMl5BanBnXkFtZTgwNzM4OTk4NTE@._V1_UX182_CR0,0,182,268_AL_.jpg', 'In the cold war, a lawyer, James B. Donovan is recruited by the CIA and involved in an intense negotiation mission to release and exchange a CIA U-2 spy-plane pilot, Francis G. Powers. The pilot was arrested alive after his plane was shot down by the Soviet Union during a mission and stays in the company of a KGB intelligence officer, Rudolf Abel, who was arrested for espionage in the US.', 7.6, 2, 22, NULL, 'Steven Spielberg', 'Drama, History, Thriller', '[\"Mark Rylance\",\"Victor Verhaeghe\",\"Brian Hutchison\",\"Joshua Harto\",\"Rebekah Brockman\",\"John Rue\",\"Amy Ryan\",\"Noah Schnapp\",\"Domenick Lombardozzi\",\"Mark Fichera\",\"Tom Hanks\",\"Henny Russell\",\"Alan Alda\",\"Billy Magnussen\",\"Jillian Lebling\"]', 'BR-53', 0, NULL, '2021-03-19 14:15:54'),
(37, 'Generic Thriller (2009)', 'https://m.media-amazon.com/images/M/MV5BNzUwNzUyNTM0N15BMl5BanBnXkFtZTgwMTg1MTA2MDE@._V1_UY268_CR9,0,182,268_AL_.jpg', 'The writer can do anything he wants, right? Or maybe not...as Steven, a handsome young theater history professor discovers when he sets out to write a stage thriller - a plain, old generic thriller - only to discover that his characters prefer a character study - and want it to be a movie, not a play. At least Steven can create the man of his dreams, right? But that character - Vertigo - named after Steven\'s sixth grade teacher Mr. Vertigo (Steven always dates men named Vertigo) - isn\'t really cooperating. Will Steven ever finish his play? Will Vertigo behave (or rather, misbehave) as Steven wishes? And what about the friends on whom Steven is basing his other characters - will they still be his friends when it\'s all over?', 4.3, 1, 21, '2009-03-04 00:00:00', 'Scott Sublett', 'Comedy, Drama', '[\"Chloe Bronzan\",\"Lance Gardner\",\"Daniel Hawkey\",\"James Hiser\",\"Brad Kranich\",\"Craig Marker\",\"Ikenna Okoye\",\"Jose Portillo\",\"Daniel Hart Donoghue\",\"Rosemary Griggs\",\"David Hawkey\",\"Shirley Jones\",\"Laura Long\",\"Regina Melzer\",\"Lauren Plaxco\"]', 'GE-77', 0, NULL, '2021-03-19 14:15:54'),
(38, 'Ek Thriller Night (2015)', NULL, 'A group of friends go to an isolated house in the middle of the night. Certain incidents that happen in the house make them feel like they aren\'t the only ones in the house. Scared and confused, the bunch of youth try to escape from the house. Watch the movie to find out what happens next.', 0, 1, 17, '2015-11-06 00:00:00', 'Pradeep Mistry', 'Drama', '[\"Sanskruti Balgude\",\"Khushboo Tawde\",\"Ketan Pendse\"]', 'EK-41', 0, NULL, '2021-03-19 14:15:54'),
(39, 'Driller (2006)', 'https://m.media-amazon.com/images/M/MV5BMTA2OTQ5MDc5MzNeQTJeQWpwZ15BbWU3MDI2MTM3MzM@._V1_UY268_CR3,0,182,268_AL_.jpg', 'A dark and amusing tale of alien abduction, drugged up youth, drilling and killing.', 6.3, 1, 25, '2006-10-11 00:00:00', 'Jason Kartalian', 'Horror, Sci-Fi', '[\"Tanya Dempsey\",\"Jason Burks\",\"Robert Reins\",\"Matt Lewis\",\"Jed Rowen\",\"Randall Craig\",\"Zander Villayne\",\"Ivy Joeva\",\"Raymond Gaston\",\"Trisha Hershberger\",\"Eric Spudic\",\"Michael Haverty\",\"Rob Simpson\"]', 'DR-65', 0, NULL, '2021-03-19 14:15:54'),
(40, 'Hold Me Thrill Me Kiss Me (1992)', 'https://m.media-amazon.com/images/M/MV5BMTA3NzgyNDIwMjheQTJeQWpwZ15BbWU2MDk3MDI4OA@@._V1_UX182_CR0,0,182,268_AL_.jpg', 'Eli is a burglar who is caught in the act by Twinkle, a crazy heiress who coerces him into a sexual relationship. Their violent break-up at the altar makes him a fugitive in search of a new identity. He lands in a trashy trailer park where he touches the lives of several dysfunctional residents. Two of them are adult buxom woman, who\'s somewhat interested in Eli, and her young teen sister, who\'s still a virgin. The impressionable teen falls for Eli hard to which he reciprocates, so the kid decides to run away with him even if it means getting her big sister out of the way first.', 6, 1, 32, '1993-07-30 00:00:00', 'Joel Hershman', 'Comedy', '[\"Max Parrish\",\"Sean Young\",\"April Rayne\",\"Ania Suli\",\"Vic Trevino\",\"Joseph Anthony Richards\",\"Frank Noon\",\"Bruce Ed Morrow\",\"Adrienne Shelly\",\"Diane Ladd\",\"Bela Lehoczky\",\"Timothy Leary\",\"Allan Warnick\",\"Martha Shaw\",\"Mary Lanier\"]', 'HO-95', 0, NULL, '2021-03-19 14:15:54'),
(41, 'Thrill (2002)', 'https://m.media-amazon.com/images/M/MV5BZTU5NjUzNWMtNDFhOS00MzQ3LWJmYWUtN2Y2NzhmNzlhZjI5XkEyXkFqcGdeQXVyMTAyODk0NjE2._V1_UY268_CR9,0,182,268_AL_.jpg', '4 young people in Vienna have a hobby. Murder.', 0, 1, 10, '2002-02-02 00:00:00', 'Elmar Weihsmann', 'Thriller', '[\"Christina Gavras\",\"Rodja Pavlik\",\"Stefan Peczelt\",\"Elmar Weihsmann\",\"Tina Wolschner\",\"Max Mosing\",\"Norbert Peczelt\",\"Christine Untermoser\",\"Michaela Wolschner\",\"Monica Zenz\"]', 'TH-16', 0, NULL, '2021-03-19 14:15:54'),
(43, 'Test', 'https://m.media-amazon.com/images/M/MV5BMGEzZjdjMGQtZmYzZC00N2I4LThiY2QtNWY5ZmQ3M2ExZmM4XkEyXkFqcGdeQXVyMTQxNzMzNDI@._V1_UX182_CR0,0,182,268_AL_.jpg', 'A group of teenagers including Cindy Campbell and Bobby Prinze, accidentally hit a man when driving, and dispose of the body, but now they are being stalked by a very recognisable masked killer. The victim count increases, whilst Cindy must survive the carnage that has she has seen in so many films before.', 6.2, 1, 28, NULL, 'Keenen Ivory Wayans', 'Comedy', '[\"Carmen Electra\",\"Frank B. Moore\",\"Kyle Graham\",\"Mark McConchie\",\"Anna Faris\",\"Rick Ducommun\",\"Marlon Wayans\",\"Lloyd Berry\",\"Dave Sheridan\",\"Giacomo Baessato\",\"Leanne Santos\",\"Karen Kruper\",\"Jon Abrahams\",\"Regina Hall\",\"Shannon Elizabeth\"]', 'SC-61', 0, NULL, '2021-03-22 15:42:44');

-- --------------------------------------------------------

--
-- Struktur dari tabel `ordered_seat`
--

CREATE TABLE `ordered_seat` (
  `id` int(11) NOT NULL,
  `playlist_id` int(11) DEFAULT NULL,
  `transaction_id` int(11) DEFAULT NULL,
  `cinema_id` int(11) DEFAULT NULL,
  `seat_row` varchar(1) DEFAULT NULL,
  `seat_col` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `ordered_seat`
--

INSERT INTO `ordered_seat` (`id`, `playlist_id`, `transaction_id`, `cinema_id`, `seat_row`, `seat_col`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 3, 'A', 4, '2021-03-21 20:47:05', '2021-03-21 20:47:05'),
(3, 1, 1, 3, 'A', 7, '2021-03-22 01:26:23', '2021-03-22 01:26:23');

-- --------------------------------------------------------

--
-- Struktur dari tabel `playlists`
--

CREATE TABLE `playlists` (
  `id` int(11) NOT NULL,
  `movie_id` int(11) DEFAULT NULL,
  `cinema_id` int(11) DEFAULT NULL,
  `playing_time` datetime DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `playlists`
--

INSERT INTO `playlists` (`id`, `movie_id`, `cinema_id`, `playing_time`, `price`, `created_at`, `updated_at`) VALUES
(1, 31, 1, '2021-03-20 05:00:00', 10, '2021-03-19 21:14:34', '2021-03-19 21:14:34'),
(2, 31, 1, '2021-03-20 06:00:00', 10, '2021-03-19 21:14:51', '2021-03-19 21:14:51'),
(3, 31, 1, '2021-03-20 07:00:00', 10, '2021-03-19 21:15:01', '2021-03-19 21:15:01'),
(4, 31, 2, '2021-03-20 08:00:00', 10, '2021-03-19 21:15:08', '2021-03-19 21:15:08'),
(5, 1, 2, '2021-03-22 11:10:00', 10, '2021-03-21 13:48:57', '2021-03-21 13:48:57'),
(6, 1, 2, '2021-03-22 11:10:00', 11, '2021-03-21 13:56:47', '2021-03-21 13:56:47');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tickets`
--

CREATE TABLE `tickets` (
  `id` int(11) NOT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `transactions_id` int(11) DEFAULT NULL,
  `ordered_seat_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tickets`
--

INSERT INTO `tickets` (`id`, `user_id`, `transactions_id`, `ordered_seat_id`, `created_at`, `updated_at`) VALUES
(3, '91e799f9-2035-40a8-942b-a837960a72b3', 1, 3, '2021-03-22 01:19:51', '2021-03-22 01:27:48');

-- --------------------------------------------------------

--
-- Struktur dari tabel `transactions`
--

CREATE TABLE `transactions` (
  `id` int(11) NOT NULL,
  `total_price` int(11) DEFAULT NULL,
  `unique_code` varchar(255) DEFAULT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `status` enum('Pending','Process','Paid') DEFAULT NULL,
  `playlist_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `transactions`
--

INSERT INTO `transactions` (`id`, `total_price`, `unique_code`, `user_id`, `status`, `playlist_id`, `created_at`, `updated_at`) VALUES
(1, 30, NULL, '91e799f9-2035-40a8-942b-a837960a72b3', 'Paid', 1, '2021-03-21 15:53:31', '2021-03-21 15:53:31');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` varchar(255) NOT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `role` enum('admin','user') NOT NULL DEFAULT 'user',
  `active` tinyint(1) NOT NULL DEFAULT 0,
  `phone_number` varchar(20) DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `password`, `avatar`, `role`, `active`, `phone_number`, `created_at`, `updated_at`) VALUES
('0d992342-0c15-4a0e-b6ed-94c11ce0214c', 'User', 'Testing', 'user996@g.com', '$2b$10$Yx9cyY8VaiIHe.C3DLhf/uB7Cok9HD29QKuQrTdzwSRjfZr0z1cDS', NULL, 'user', 0, '0', '2021-03-24 05:42:32', '2021-03-24 05:42:32'),
('15697fef-21ad-45ac-a2ed-7c3d7980e51d', 'User', 'Testing', 'user997@g.com', '$2b$10$hUi362H0kOEMZ/GRptUSCO85KVAcDfzHMax3AYKcoON4duOKThVpK', NULL, 'user', 0, '0', '2021-03-24 05:41:48', '2021-03-24 05:41:48'),
('1d68bf9e-1e5d-4a52-ad5f-bb45111d5214', 'User', 'Testing', 'user993@g.com', '$2b$10$ev8JLih8035lCSdv0zgSNO4f2uMvwX3jxjEn8WmXfzpgBEVaC820i', NULL, 'user', 0, '0', '2021-03-24 05:48:40', '2021-03-24 05:48:40'),
('2116226b-586e-44a8-9628-4c5954879220', 'User', 'Testing', 'user999@g.com', '$2b$10$sd2ml9QwOEmF5oGXlJTp9uanHun6IcfTq.pXxtTIIvASyGEMCp/T.', NULL, 'user', 0, '0', '2021-03-24 05:40:24', '2021-03-24 05:40:24'),
('42e0fc99-224e-4fda-9432-d9d88debad6c', 'User', 'Testing', 'user@g.com', '$2b$10$XPaIFiY0BGdEae9D9ORrAe4Ql4h8ppiiPjf0aMhm4iQhz7qRePECC', 'http://localhost:6000/avatar/1616353017513_rest-api-icon-8.jpg', 'user', 0, '0', '2021-03-22 01:56:57', '2021-03-22 01:56:57'),
('6e68c9cb-5a9d-4a8a-9dab-ce0c6bd81ec4', 'User', 'Testing', 'user991@g.com', '$2b$10$jlH6ZH.qz/vw.4THXfyJUeEL38pm7nnGhnOCTmmvdjY0zHSmY0tZ.', 'http://localhost:6000/avatar/1616542048491_pngtree-family-protected-from-virus-vector-cartoon-image-illustration-png-image_2256906.jpg', 'user', 0, '0', '2021-03-24 06:27:28', '2021-03-24 06:27:28'),
('76e9e43a-b6c5-4701-91a5-7c0cc6f20cb2', 'User', 'Testing', 'user3@g.com', '$2b$10$n/Z6XkLoAYXIVt5Llutu6OSPAl5Dc3Ckj/VXhF.rYp0S56A6AWfnC', 'http://localhost:6000/avatar/1616399589499_star.png', 'user', 0, '0', '2021-03-22 14:53:09', '2021-03-22 14:53:09'),
('91e799f9-2035-40a8-942b-a837960a72b3', 'Rama', 'Seftiansyah', 'dev@sgbteam.id', '$2b$10$biorfUDnM23JvZJhICYCz.sQ4zUE/LggecO4sRqFx7c05z8XLbBFW', 'http://localhost:6000/avatar/1616542064692_beground-tembok-35.jpg', 'admin', 0, '0', '2021-03-21 13:15:10', '2021-03-24 06:27:44'),
('9b46fe11-f8ac-48af-a0a3-15a6139478eb', 'User', 'Testing', 'user994@g.com', '$2b$10$2Z8dr6LeyvrO0Yq4QxPMMue0NO2yhCoAXIlJkVtrhCYaechHyzr4y', NULL, 'user', 0, '0', '2021-03-24 05:45:12', '2021-03-24 05:45:12'),
('bbb9ee07-765c-4650-b321-6d1af8f5a822', 'User', 'Testing', 'user2@g.com', '$2b$10$TlYHRTSfT2BidUgAt.f7Le/Se/qNYVXQ1R2mz2AZKwEq8.1fuAKqq', 'http://localhost:6000/avatar/1616353026800_rest-api-icon-8.jpg', 'user', 0, '0', '2021-03-22 01:57:06', '2021-03-22 01:57:06'),
('c07f424f-5874-41e9-ae5e-d548700aeb9d', 'User', 'Testing', 'user995@g.com', '$2b$10$D7hvVW1AaWy9TZBv1YQYNumX1q9L/UpuaxLy2uEmK.UMbyZV/mz/u', NULL, 'user', 0, '0', '2021-03-24 05:43:20', '2021-03-24 05:43:20'),
('d1e985a4-8e56-4777-b141-31f65e7d276f', 'User', 'Testing', 'user998@g.com', '$2b$10$MoZfSLOP3iLtWJsykS1T4eOgwaPGyMW9RgW2PyDv3SrGLH5rQOmte', NULL, 'user', 0, '0', '2021-03-24 05:41:28', '2021-03-24 05:41:28'),
('d4da3148-9227-464a-b6ff-a7fb0667ca03', 'User', 'Testing', 'user992@g.com', '$2b$10$1gVooOyl10Zoei/eSHW03OdQh320t.dggDqZSi3StaAW/I0pQdY3G', NULL, 'user', 0, '0', '2021-03-24 06:21:36', '2021-03-24 06:21:36');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `cinemas`
--
ALTER TABLE `cinemas`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `movies`
--
ALTER TABLE `movies`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `ordered_seat`
--
ALTER TABLE `ordered_seat`
  ADD PRIMARY KEY (`id`),
  ADD KEY `playlist_id` (`playlist_id`),
  ADD KEY `transaction_id` (`transaction_id`),
  ADD KEY `cinema_id` (`cinema_id`);

--
-- Indeks untuk tabel `playlists`
--
ALTER TABLE `playlists`
  ADD PRIMARY KEY (`id`),
  ADD KEY `movie_id` (`movie_id`),
  ADD KEY `cinema_id` (`cinema_id`);

--
-- Indeks untuk tabel `tickets`
--
ALTER TABLE `tickets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `transactions_id` (`transactions_id`),
  ADD KEY `ordered_seat_id` (`ordered_seat_id`);

--
-- Indeks untuk tabel `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `playlist_id` (`playlist_id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `cinemas`
--
ALTER TABLE `cinemas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `movies`
--
ALTER TABLE `movies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT untuk tabel `ordered_seat`
--
ALTER TABLE `ordered_seat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `playlists`
--
ALTER TABLE `playlists`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `tickets`
--
ALTER TABLE `tickets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `ordered_seat`
--
ALTER TABLE `ordered_seat`
  ADD CONSTRAINT `ordered_seat_ibfk_1` FOREIGN KEY (`playlist_id`) REFERENCES `playlists` (`id`),
  ADD CONSTRAINT `ordered_seat_ibfk_2` FOREIGN KEY (`transaction_id`) REFERENCES `transactions` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `ordered_seat_ibfk_3` FOREIGN KEY (`cinema_id`) REFERENCES `cinemas` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ketidakleluasaan untuk tabel `playlists`
--
ALTER TABLE `playlists`
  ADD CONSTRAINT `playlists_ibfk_1` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`id`),
  ADD CONSTRAINT `playlists_ibfk_2` FOREIGN KEY (`cinema_id`) REFERENCES `cinemas` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ketidakleluasaan untuk tabel `tickets`
--
ALTER TABLE `tickets`
  ADD CONSTRAINT `tickets_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `tickets_ibfk_4` FOREIGN KEY (`ordered_seat_id`) REFERENCES `ordered_seat` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `tickets_ibfk_5` FOREIGN KEY (`transactions_id`) REFERENCES `transactions` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ketidakleluasaan untuk tabel `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `transactions_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `transactions_ibfk_2` FOREIGN KEY (`playlist_id`) REFERENCES `playlists` (`id`) ON DELETE NO ACTION ON UPDATE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
