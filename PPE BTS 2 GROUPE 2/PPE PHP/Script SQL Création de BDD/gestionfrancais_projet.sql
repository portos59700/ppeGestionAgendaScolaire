
--
-- Database: `gestionfrancais_projet`
--
 drop database gestionAgendaScolaire_prodtest;
create database gestionAgendaScolaire_prodtest;

use gestionAgendaScolaire_prodtest;
-- --------------------------------------------------------

--
-- Table structure for table `CLASSE`
--
 
CREATE TABLE`CLASSE` (
  `idClasse` int(11) NOT NULL primary key AUTO_INCREMENT,
  `libelleClasse` varchar(25) NOT NULL,
  `couleurClasse` varchar(70) DEFAULT NULL
);

--
-- Dumping data for table `CLASSE`
--

INSERT INTO `CLASSE` ( `libelleClasse`, `couleurClasse`) VALUES
('BTS 2', '#82e86f'),
('2nde 7', '#7986e8' ),
( '1ère S2', '#ec9fe4'),
( '1ère ST2S', '#e87e6c' ),
( 'ECJS', '#eae289');

-- --------------------------------------------------------

--
-- Table structure for table `COMPETENCE`
--

CREATE TABLE `COMPETENCE` (
  `idCompetence` int(11) NOT NULL  primary key AUTO_INCREMENT,
  `libelleCompetence` varchar(25) NOT NULL
);

--
-- Dumping data for table `COMPETENCE`
--

INSERT INTO `COMPETENCE` (`idCompetence`, `libelleCompetence`) VALUES
(1, 'Ecriture'),
(2, 'Structure'),
(3, 'Réflexion'),
(4, 'Connaissance');
-- --------------------------------------------------------

--
-- Table structure for table `TRIMESTRE`
--

CREATE TABLE `TRIMESTRE` (
  `idTrimestre` int(11) NOT NULL primary key AUTO_INCREMENT,
  `libelleTrimestre` varchar(35) NOT NULL
);

--
-- Dumping data for table `TRIMESTRE`
--

INSERT INTO `TRIMESTRE` (`libelleTrimestre`) VALUES
( '1er trimestre'),
( '2ème trimestre'),
( '3ème trimestre');



--
-- Table structure for table `COURS`
--

CREATE TABLE IF NOT EXISTS `COURS` (
  `idCours` int(11) NOT NULL primary key AUTO_INCREMENT,
  `dateCours` date NOT NULL,
  `heureDebutCours` TIME NOT NULL,
  `heureFinCours` TIME NOT NULL,
  `id_classe` int(11) NOT NULL,
  `id_horaire` int(11) NOT NULL,
  `id_controle` int(11),
  FOREIGN KEY (`id_classe`) REFERENCES `CLASSE` (`idClasse`)
);



-- --------------------------------------------------------

--
-- Table structure for table `CONTROLE`
--

CREATE TABLE  `CONTROLE` (
  `idControle` int(11) NOT NULL primary key AUTO_INCREMENT,
  `id_cours` int(11) NOT NULL,
  `id_trimestre` int(11) NOT NULL,
  `intituleControle` varchar(255) NOT NULL,
  `coefControle` int(11) NOT NULL,
  FOREIGN KEY (`id_cours`) REFERENCES `COURS` (`idCours`),
  FOREIGN KEY (`id_trimestre`) REFERENCES `TRIMESTRE` (`idTrimestre`)
);

--
-- Table structure for table `USER`
--

CREATE TABLE  `USER` (
  `idUser` int(11) NOT NULL primary key AUTO_INCREMENT,
  `nomUser` varchar(30) DEFAULT NULL,
  `prenomUser` varchar(30) DEFAULT NULL,
  `ageUser` date DEFAULT NULL,
  `emailUser` varchar(90) DEFAULT NULL,
  `photoUser` varchar(255) DEFAULT NULL,
  `pseudoUser` varchar(255) DEFAULT NULL,
  `passUser` varchar(255) DEFAULT NULL,
  `isAdminUser` BOOLEAN DEFAULT 0,
  `id_classe` int(11),
  FOREIGN KEY (`id_classe`) REFERENCES `CLASSE` (`idClasse`)
);

--
-- Dumping data for table `USER`
--

INSERT INTO `USER` (`nomUser`, `prenomUser`, `ageUser`, `emailUser`, `photoUser`,`passUser`,`pseudoUser`,`isAdminUser`, `id_classe`) VALUES
('Test', 'Élève', '1995-08-22', 'USERtest@test.fr', '',NULL, NULL, 0, 1),
('Test', 'Élève', '1995-08-19', 'USERtest@test.fr', '',NULL, NULL, 0, 2),
('Test', 'Élève', '1998-08-13', 'USERtest@test.fr', '',NULL, NULL, 0, 3),
('Test', 'Élève', '1997-08-02', 'USERtest@test.fr', '',NULL, NULL, 0, 5),
('Attali', 'Théo', '0000-00-00', '', '',NULL, NULL, 0, 5),
('Rondet', 'Grégoire', '0000-00-00', '', '',NULL, NULL, 0, 5),
('Felicite', 'Lenny', '0000-00-00', '', '',NULL, NULL, 0, 5),
('Rodier', 'Guillaume', '0000-00-00', '', '',NULL, NULL, 0, 5),
('Viel', 'Pierre-Andreas', '0000-00-00', '', '',NULL, NULL, 0, 5),
('Chevallier', 'Pierre-Louis', '0000-00-00', '', '',NULL, NULL, 0, 5),
('Lefebvre', 'Marie', '0000-00-00', '', '',NULL, NULL, 0, 2),
('Thouin', 'Julien', '0000-00-00', '', '',NULL, NULL, 0, 2),
('Martigny', 'Antoine', '0000-00-00', '', '',NULL, NULL, 0, 2),
('Régnier', 'Corentin', '0000-00-00', '', '',NULL, NULL, 0, 2),
('Penhard', 'Thibaut', '0000-00-00', '', '',NULL, NULL, 0, 2),
('Guiffan', 'Florestan', '0000-00-00', '', '',NULL, NULL, 0, 2),
('Edeyer', 'Vincent', '0000-00-00', '', '',NULL, NULL, 0, 2),
('Duprey', 'Charles', '0000-00-00', '', '',NULL, NULL, 0, 2),
('Nourollahi', 'Artimes', '0000-00-00', '', '',NULL, NULL, 0, 2),
('De Waële', 'Maxence', '0000-00-00', '', '',NULL, NULL, 0, 2),
('Ammoun', 'Clara', '0000-00-00', '', '',NULL, NULL, 0, 1),
('Aubert', 'Elise', '0000-00-00', '', '',NULL, NULL, 0, 1),
('Brayer', 'Luc', '0000-00-00', '', '',NULL, NULL, 0, 1),
('Charon', 'Paul', '0000-00-00', '', '',NULL, NULL, 0, 1),
('Schneker', 'Rémy', '0000-00-00', '', '',NULL, NULL, 0, 1),
('Claye', 'Olivier', '0000-00-00', '', '',NULL, NULL, 0, 1),
('Coutansais', 'Benoit', '0000-00-00', '', '',NULL, NULL, 0, 1),
('Davies', 'Lucy', '0000-00-00', '', '',NULL, NULL, 0, 1),
('Delmon', 'Jules', '0000-00-00', '', '',NULL, NULL, 0, 1),
('Demarty', 'Clément ', '0000-00-00', '', '',NULL, NULL, 0, 3),
('Dezard', 'Louis-Arthur', '0000-00-00', '', '',NULL, NULL, 0, 3),
('Chneker', 'Rémy', '0000-00-00', '', '',NULL, NULL, 0, 3),
('Drecq', 'Sasha', '0000-00-00', '', '',NULL, NULL, 0, 3),
('Feron', 'Quentin', '0000-00-00', '', '',NULL, NULL, 0, 3),
('Fontaine', 'Victoria', '0000-00-00', '', '',NULL, NULL, 0, 3),
('Gerbelot', 'Laura', '0000-00-00', '', '',NULL, NULL, 0, 3),
('Gervais', 'Catherine', '0000-00-00', '', '',NULL, NULL, 0, 4),
('Giraud', 'Mathilde', '0000-00-00', '', '',NULL, NULL, 0, 4),
('Godié', 'Juliette', '0000-00-00', '', '',NULL, NULL, 0, 4),
('Hainaut', 'Laura', '0000-00-00', '', '',NULL, NULL, 0, 4),
('Lancry', 'Thomas', '0000-00-00', '', '',NULL, NULL, 0, 4),
('Leblanc', 'Victor', '0000-00-00', '', '',NULL, NULL, 0, 4),
('Leguay', 'Nathan', '0000-00-00', '', '', NULL, NULL, 0,4),
('Luton', 'Sibylle', '0000-00-00', '', '',NULL, NULL, 0, 4),
('Magnier', 'Ilias', '0000-00-00', '', '',NULL, NULL, 0, 4),
('Mallié', 'Petronille', '0000-00-00', '', '',NULL, NULL, 0, 4),
('Maurier', 'Clémentine', '0000-00-00', '', '',NULL, NULL, 0, 4),
(NULL, NULL, '0000-00-00', '', '','professeur','professeur',0, NUll);

-- --------------------------------------------------------

--
-- Table structure for table `CONSEIL`
--

CREATE TABLE  `CONSEIL` (
  `id_user` int(11) NOT NULL ,
  `id_trimestre` int(11) NOT NULL,
  `appreciationPersoConseil` varchar(255) NOT NULL,
  `avisConseil` varchar(255) NOT NULL,
  FOREIGN KEY (`id_User`) REFERENCES `USER` (`idUser`),
  FOREIGN KEY (`id_trimestre`) REFERENCES `TRIMESTRE` (`idTrimestre`)
);


-- --------------------------------------------------------

--
-- Table structure for table `NIVEAU`
--

CREATE TABLE `NIVEAU` (
  `id_User` int(11) NOT NULL,
  `id_trimestre` int(11) NOT NULL,
  `id_competence` int(11) NOT NULL,
  `niveau` varchar(25) NOT NULL,
  FOREIGN KEY (`id_user`) REFERENCES `USER` (`idUser`),
  FOREIGN KEY (`id_competence`) REFERENCES `COMPETENCE` (`idCompetence`),
  FOREIGN KEY (`id_trimestre`) REFERENCES `TRIMESTRE` (`idTrimestre`)
);

-- --------------------------------------------------------

--
-- Table structure for table `RESULTATCONTROLE`
--

CREATE TABLE  `RESULTATCONTROLE` (
  `id_User` int(11) NOT NULL,
  `id_controle` int(11) NOT NULL,
  `note` float NOT NULL,
  `commentaire` varchar(255) DEFAULT NULL,
  FOREIGN KEY (`id_user`) REFERENCES `USER` (`idUser`),
  FOREIGN KEY (`id_controle`) REFERENCES `CONTROLE` (`idControle`)
);


-- --------------------------------------------------------


--
-- Indexes for dumped tables
--


--
-- Indexes for table `CONSEIL`
--
ALTER TABLE `CONSEIL`
  ADD PRIMARY KEY (`id_user`,`id_trimestre`),
  ADD KEY `id_trimestre` (`id_trimestre`),
  ADD KEY `id_user` (`id_user`);

--
-- Indexes for table `CONTROLE`
--
ALTER TABLE `CONTROLE`
  ADD KEY `CONTROLE_ibfk_1` (`id_cours`),
  ADD KEY `CONTROLE_ibfk_2` (`id_trimestre`);

--
-- Indexes for table `COURS`
--
ALTER TABLE `COURS`
  ADD KEY `id_classe` (`id_classe`),
  ADD KEY `id_horaire` (`id_horaire`);

--
-- Indexes for table `USER`
--
ALTER TABLE `USER`
  ADD KEY `id_classe` (`id_classe`);

--
-- Indexes for table `NIVEAU`
--
ALTER TABLE `NIVEAU`
  ADD PRIMARY KEY (`id_user`,`id_trimestre`,`id_competence`),
  ADD KEY `id_competence` (`id_competence`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `id_trimestre` (`id_trimestre`);

--
-- Indexes for table `RESULTATCONTROLE`
--
ALTER TABLE `RESULTATCONTROLE`
  ADD PRIMARY KEY (`id_user`,`id_controle`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `id_controle` (`id_controle`);
  

