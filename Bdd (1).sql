-- CREATE DATABASE nom_base;

-- CREATE DATABASE firstbdd;

-- USE firstbdd;
-- Numérique : int, float, double, bit
-- Alphanumérique : char, varchar, text, clob, blob
-- Temporelle : date, time, datetime, timestamp

-- date sous mysql : aaaa-mm-jj  /  jj/mm/aaaa

CREATE DATABASE mycontacts;
USE mycontacts;
#------------------------------------------------------------
# Table: civilite
#------------------------------------------------------------

CREATE TABLE civilite(
        id            Int  Auto_increment  NOT NULL ,
        libelle_court Varchar (5) NOT NULL ,
        libelle_long  Varchar (50) NOT NULL
	,CONSTRAINT civilite_PK PRIMARY KEY (id)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: cp_ville
#------------------------------------------------------------

CREATE TABLE cp_ville(
        id         Int  Auto_increment  NOT NULL ,
        codepostal Char (5) NOT NULL ,
        ville      Varchar (200) NOT NULL
	,CONSTRAINT cp_ville_PK PRIMARY KEY (id)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: personne
#------------------------------------------------------------

CREATE TABLE personne(
        id                 Int  Auto_increment  NOT NULL ,
        nom                Varchar (200) NOT NULL ,
        prenom             Varchar (200) NOT NULL ,
        date_naissance     Date ,
        numero_rue         Varchar (10) ,
        nom_rue            Varchar (250) ,
        complement_adresse Varchar (250) ,
        id_civilite        Int NOT NULL ,
        id_cp_ville        Int NOT NULL
	,CONSTRAINT personne_PK PRIMARY KEY (id)

	,CONSTRAINT personne_civilite_FK FOREIGN KEY (id_civilite) REFERENCES civilite(id)
	,CONSTRAINT personne_cp_ville0_FK FOREIGN KEY (id_cp_ville) REFERENCES cp_ville(id)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: societe
#------------------------------------------------------------

CREATE TABLE societe(
        siret        Varchar (14) NOT NULL ,
        denomination Varchar (100) NOT NULL ,
        secteur      Varchar (100)
	,CONSTRAINT societe_PK PRIMARY KEY (siret)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: type_telephone
#------------------------------------------------------------

CREATE TABLE type_telephone(
        id      Int  Auto_increment  NOT NULL ,
        libelle Varchar (50) NOT NULL
	,CONSTRAINT type_telephone_PK PRIMARY KEY (id)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: categorie
#------------------------------------------------------------

CREATE TABLE categorie(
        id      Int  Auto_increment  NOT NULL ,
        libelle Varchar (50) NOT NULL
	,CONSTRAINT categorie_PK PRIMARY KEY (id)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: email
#------------------------------------------------------------

CREATE TABLE email(
        id           Int  Auto_increment  NOT NULL ,
        adresse      Varchar (250) NOT NULL ,
        id_categorie Int NOT NULL
	,CONSTRAINT email_PK PRIMARY KEY (id)

	,CONSTRAINT email_categorie_FK FOREIGN KEY (id_categorie) REFERENCES categorie(id)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: telephone
#------------------------------------------------------------

CREATE TABLE telephone(
        id                Int  Auto_increment  NOT NULL ,
        numero            Varchar (20) NOT NULL ,
        id_personne       Int NOT NULL ,
        id_type_telephone Int NOT NULL ,
        id_categorie      Int NOT NULL
	,CONSTRAINT telephone_PK PRIMARY KEY (id)

	,CONSTRAINT telephone_personne_FK FOREIGN KEY (id_personne) REFERENCES personne(id)
	,CONSTRAINT telephone_type_telephone0_FK FOREIGN KEY (id_type_telephone) REFERENCES type_telephone(id)
	,CONSTRAINT telephone_categorie1_FK FOREIGN KEY (id_categorie) REFERENCES categorie(id)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: fonction
#------------------------------------------------------------

CREATE TABLE fonction(
        id      Int  Auto_increment  NOT NULL ,
        libelle Varchar (50) NOT NULL
	,CONSTRAINT fonction_PK PRIMARY KEY (id)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: posseder_mail
#------------------------------------------------------------

CREATE TABLE posseder_mail(
        id       Int NOT NULL ,
        id_email Int NOT NULL
	,CONSTRAINT posseder_mail_PK PRIMARY KEY (id,id_email)

	,CONSTRAINT posseder_mail_personne_FK FOREIGN KEY (id) REFERENCES personne(id)
	,CONSTRAINT posseder_mail_email0_FK FOREIGN KEY (id_email) REFERENCES email(id)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: travailler
#------------------------------------------------------------

CREATE TABLE travailler(
        id          Int NOT NULL ,
        siret       Varchar (14) NOT NULL ,
        id_fonction Int NOT NULL
	,CONSTRAINT travailler_PK PRIMARY KEY (id,siret,id_fonction)

	,CONSTRAINT travailler_personne_FK FOREIGN KEY (id) REFERENCES personne(id)
	,CONSTRAINT travailler_societe0_FK FOREIGN KEY (siret) REFERENCES societe(siret)
	,CONSTRAINT travailler_fonction1_FK FOREIGN KEY (id_fonction) REFERENCES fonction(id)
)ENGINE=InnoDB;


