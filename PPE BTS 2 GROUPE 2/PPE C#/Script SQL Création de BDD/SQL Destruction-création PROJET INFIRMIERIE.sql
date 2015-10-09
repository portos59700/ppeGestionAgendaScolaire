
------------------------------------------------------------
--        Script  déstruction / création BDD SQL server.  --
------------------------------------------------------------

--	Détruire la table Prescrire  --
Drop TABLE Prescrire;

--	Détruire la table Medicament  --
DROP TABLE Medicament;

--	Détruire la table Visite  --
DROP TABLE Visite;

--	Détruire la table Eleve  --
Drop TABLE Eleve;

--	Détruire la table Classe  --
Drop TABLE Classe;

--	Détruire la table Identification  --
Drop Table Identification;

--	Détruire la base de données gestioninfirmiere_prodtest  --
DROP DATABASE gestioninfirmiere_prodtest;



--	Création de la base de données gestioninfirmiere_prodtest  --
CREATE DATABASE gestioninfirmiere_prodtest;



--	Utiliser la base de données gestioninfirmiere_prodtest  --
USE DATABASE gestioninfirmiere_prodtest;




--	Création de la table Medicament  --
CREATE TABLE Medicament(
        Id_medicament      Int NOT NULL IDENTITY,
        Libelle_medicament Varchar (250) NOT NULL,
		Archive_medicament 	BIT DEFAULT (1),
        PRIMARY KEY (Id_medicament )
)

--	Création de la table Eleve  --
CREATE TABLE Eleve(
        Id_eleve            Int NOT NULL IDENTITY,
        Nom_eleve           Varchar (250) NOT NULL,
        Prenom_eleve        Varchar (250) NOT NULL,
        DateNaissance_eleve Date NOT NULL,
        Sante_eleve         Varchar (250) NULL,
        Tel_eleve           Varchar (25) NULL,
        TelPere_eleve       Varchar (25) NULL,
        TelMere_eleve       Varchar (25) NULL,
        Archive_eleve       Varchar (25) DEFAULT(0),
        TiersTemps_eleve    BIT DEFAULT(0),
        Id_classe           Int NOT NULL,
        PRIMARY KEY (Id_eleve )
)

--	Création de la table Visite  --
CREATE TABLE Visite(
        Id_visite              Int NOT NULL IDENTITY,
        Motif_visite           Varchar (100) NOT NULL,
        Commentaire_visite     Varchar (2500) NULL,
        HeureArrivee_visite    Time NOT NULL,
        HeureSortie_visite     Time NOT NULL,
        Date_visite            Date NOT NULL,
        ParentsPrevenus_visite BIT DEFAULT (0),
        Hopital_visite         BIT DEFAULT (0),
        RetourDomicile_visite  BIT DEFAULT (0),
        Pouls_visite           Varchar (250) ,
        Id_eleve               Int ,
        PRIMARY KEY (Id_visite )
)

--	Création de la table Classe  --
CREATE TABLE Classe(
        Id_classe      Int NOT NULL IDENTITY,
        Libelle_classe Varchar (250) NOT NULL,
        LienEdt_classe Varchar (250) NOT NULL,
        PRIMARY KEY (Id_classe )
)


--	Création de la table Identification  --
CREATE TABLE Identification(
        Id_identification         Int NOT NULL IDENTITY,
        Login_identification      Varchar (25) NOT NULL,
        Pwd_identification        Varchar (25) NOT NULL,
        TypeDroits_identification Int NOT NULL,
        PRIMARY KEY (Id_identification )
)


--	Création de la table Prescrire  --
CREATE TABLE Prescrire(
        Quantite_medicament Int ,
        Id_visite           Int ,
        Id_medicament       Int ,
        PRIMARY KEY (Id_visite ,Id_medicament )
)

--	Création des clées étrangères  --
ALTER TABLE Eleve ADD CONSTRAINT FK_Eleve_Id_classe FOREIGN KEY (Id_classe) REFERENCES Classe(Id_classe);
ALTER TABLE Visite ADD CONSTRAINT FK_Visite_Id_eleve FOREIGN KEY (Id_eleve) REFERENCES Eleve(Id_eleve);
ALTER TABLE Prescrire ADD CONSTRAINT FK_Prescrire_Id_visite FOREIGN KEY (Id_visite) REFERENCES Visite(Id_visite);
ALTER TABLE Prescrire ADD CONSTRAINT FK_Prescrire_Id_medicament FOREIGN KEY (Id_medicament) REFERENCES Medicament(Id_medicament);





------------------------------------------------------------
--        Script  jeu d'essai BDD SQL server.             --
------------------------------------------------------------

-- Utilisation de la base gestioninfirmiere_prodtest --

USE gestioninfirmiere_prodtest;




-- Insertion des classes dans la table CLASSE --
INSERT INTO CLASSE (Libelle_classe, LienEdt_classe)
	VALUES
	("2NDE1", "edt_s1") ,
	("2NDE2", "edt_s2") ,
	("2NDE3", "edt_s3") ,
	("2NDE4", "edt_s4") ,
	("2NDE5", "edt_s5") ,
	("2NDE6", "edt_s6") ,
	("2NDE7", "edt_s7") ,
	("1 L", "edt_pl") ,
	("1 ST2S", "edt_pst2s") ,
	("1 STMG", "edt_pstmg") ,
	("1 S1", "edt_ps1") ,
	("1 S2", "edt_ps2") ,
	("1 S3", "edt_ps3") ,
	("1 ES1", "edt_pes1") ,
	("1 ES2", "edt_pes2") ,
	("Terminale L", "edt_tl") ,
	("Terminale ST2S", "edt_tst2s") ,
	("Terminale STMG", "edt_tstmg") ,
	("Terminale S1", "edt_s1") ,
	("Terminale S2", "edt_s2") ,
	("Terminale S3", "edt_s3") ,
	("Terminale ES1", "edt_es1") ,
	("Terminale ES2", "edt_es2") ,
	("BTS1", "edt_bts1") ,
	("BTS2", "edt_bts2");




-- Insertion des élèves dans la table ELEVE --
INSERT INTO ELEVE (Nom_eleve, Prenom_eleve, DateNaissance_eleve, Sante_eleve, TiersTemps_eleve, Tel_eleve, TelPere_eleve, TelMere_eleve, Archive_eleve, Id_classe)
	VALUES 
	("David", "Jean-Louis", '1999-01-02', "hypocondriac", 0,  "06.98.87.74.45", "06.66.44.55.99", "01.23.45.67.89", 0, 1) , 
	("Dupond", "Marie", '1998-10-30', "rien de particulier", 0, "06.54.41.12.23", "07.56.45.23.91", "01.90.44.23.55", 0, 8) ,
	("Kerguelec", "Gwenael", '1997-08-16', "narcoleptique", 0, "06.14.47.75.53", "06.99.84.73.11", "02.98.57.56.12", 0, 17) ,
	("Liu", "Lucy", '1995-02-02', "hypertension", 1, "06.32.21.15.56", "07.22.34.56.78", "03.55.78.95.30", 0, 24) ,
	("Watson", "Emma", '1994-06-23', "pollen", "rien de particulier", 0, "06.56.63.37.78", "06.12.34.56.78", "01.11.51.61.88", 0, 25),
	("Benjamin", "Benjamin", '1999-04-06', "Allergie au pollen", 0, "06.99.99.99.99", "06.55.33.66.88", "01.32.54.76.98", 0, 1) , 
	("Grare", "Thibaut", '1998-09-10', "Allergie aux chiens", 0, "07.11.21.31.41", "07.65.54.32.17", "01.09.00.32.45", 0, 8) ,
	("Woodsen", "Maxime", '1997-01-13', "Allergie aux chats", 0, "06.15.48.57.35", "06.99.48.37.11", "02.89.75.65.21", 0, 17) ,
	("Dupont", "Corentin", '1995-07-25', "Allergie aux fruits de mers", 1, "06.23.12.51.65", "07.11.42.54.87", "03.55.87.59.03", 0, 24) ,
	("Rainier", "Quentin", '1994-04-03', "asthme", 0, "06.65.36.73.87", "06.21.43.65.76", "01.11.51.61.88", 0, 25),
	("Rainier", "Gael", '1999-01-02',"rien de particulier", 0, "06.89.78.47.54", "06.21.43.65.76", "01.11.51.61.88", 0, 1) , 
	("Lefevre", "Louise", '1998-10-22', "rien de particulier", 0, "06.45.14.21.32", "07.45.45.12.54", "01.01.22.70.88", 0, 8) ,
	("Dechappe", "Antoine", '1997-12-12', "Stresse", 0, "06.45.54.75.57", "06.75.77.76.78", "02.88.50.60.77", 0, 17) ,
	("Dasilva", "Charlie", '1995-01-01', "dépression", 1, "06.88.00.01.54", "07.21.22.24.25", "03.41.42.55.00", 0, 24) ,
	("Dumaré", "Emmilie", '1994-02-11', "rien de particulier", 0, "07.07.07.07.07", "06.22.23.34.65", "01.22.62.63.99", 1, 25);

	


-- Insertion des médicaments dans la table MEDICAMENT --
INSERT INTO MEDICAMENT (Libelle_medicament, Archive_medicament)
	VALUES
	("ARNICA", 0) ,
	("BIAFINE/VASELINE", 0) ,
	("BISEPTINE", 0) ,
	("COALGAN", 0) ,
	("CORTAPAISYL 0.5%", 0) ,
	("DOLIPRANE 500", 0) ,
	("GAVISCON", 0) ,
	("HEMOCLAR", 0) ,
	("HEXTRIL >6ans", 0) ,	
	("MAALOX", 0) ,
	("NIFLURIL", 0) ,
	("SERUM PHYSIOLOGIQUE", 0) ,
	("SMECTA", 0) ,
	("SPASFON", 0) ,
	("STREPSIL", 0) ,	
	("VOGALIB", 0);


-- Insertion des détails des visites dans la table VISITE --
INSERT INTO VISITE ( Motif_visite, Commentaire_visite, HeureArrivee_visite, HeureSortie_visite, Date_visite, ParentsPrevenus_visite, Hopital_visite, RetourDomicile_visite, Pouls_visite, Id_eleve)
	VALUES
	( "maux de ventre", "sans commentaire", '12:30:00', '12:35:00', '2015-03-01', 0, 0, 0, "80", 1) ,	
	( "maux de tete", "fatigue", '15:06:00', '15:45:00', '2015-03-01', 1, 0, 1, "65", 2) ,
	( "douleur au coude et cotes", "chute pendant cours de sport", '10:00:00', '10:15:00', '2015-03-02', 1, 1, 0, "60", 3) ,
	( "maux de ventre", "regle douloureuse", '16:00:00', '16:25:00', '2015-03-02', 1, 0, 0, "70", 4) ,
	( "fatigue", "debut de grippe", '12:30:00', '12:35:00', '2015-03-03', 1, 0, 1, "72", 5),
	
	( "Bras cassé", "C'est cassé le bras au foot durant l'AS", '12:50:00', '12:55:00', '2015-03-05', 1, 1, 0, "80", 6) ,	
	( "intoxication", "À eu mal au ventre après aller manger au kebab du coin, il a tout vomie", '13:06:00', '13:15:00', '2015-03-06', 1, 0, 1, "88", 7) ,
	( "bleues et plaies au visage", "C'est bagarré avec un autre élève", '10:30:00', '10:44:00', '2015-03-06', 1, 0, 0, "67", 8) ,
	( "plaies à la main", "C'est bagarré avec un autre élève", '10:44:00', '10:55:00', '2015-03-06', 1, 0, 0, "75", 9) ,
	( "Mal à la tête", "debut de grippe", '12:30:00', '12:35:00', '2015-03-08', 1, 0, 1, "74", 5),
	
	( "Saigne de la tête", "Il est tombé par terre, inconscient il saignait de la tête. Les parents ne répondent pas au téléphone", '16:05:00', '16:10:00', '2015-03-10', 0, 1, 0, "55", 11) ,	
	( "maux de tete", "Il a une engine et un rhum", '08:45:00', '08:50:00', '2015-03-22', 1, 0, 1, "61", 12) ,
	( "Fouler la cheville", "C'est foulé la cheville au baskette en cours de sport", '11:10:00', '11:35:00', '2015-03-29', 1, 0, 1, "71", 13) ,
	( "maux de ventre", "regle douloureuse", '15:00:00', '15:10:00', '2015-04-02', 1, 0, 0, "67", 14) ,
	( "fatigue", "Il a fait une nuit blanche ", '09:30:00', '09:32:00', '2015-04-03', 1, 0, 1, "59", 15);


-- Insertion des prescriptions dans la table PRESCRIRE --
INSERT INTO PRESCRIRE (Quantite_medicament, Id_visite, Id_medicament)
	VALUES
	(1, 1, 13) ,
	(1, 2, 6) ,
	(1, 3, 2) ,
	(2, 5, 6),
	
	(1, 6, 13) ,
	(1, 7, 6) ,
	(1, 8, 2) ,
	(2, 12, 6) ,
	
	(1, 6, 13) ,
	(1, 7, 6) ,
	(1, 8, 2) ,
	(2, 12, 6) ;

-- Insertion des identifications dans la table IDENTIFICATION --
INSERT INTO IDENTIFICATION (Login_identification, Pwd_identification, TypeDroits_identification)
	VALUES 
	("admin", "admin", 1) ,
	("infirmiere", "infirmiere", 2);