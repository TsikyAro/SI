create user compte with password 'compte';

create database compte;
\c compte;
grant all privileges on database compte to compte;

create table Client(
    idClient serial primary key,
    NomPlan varchar(50)                   
);
grant all privileges on Client to compte;

create table fournisseur(
    idFournisseur serial primary key,
    NomPlan varchar(50)                   
);
grant all privileges on fournisseur to compte;

-- anaovana affichage code journal
create table codejournaux(
    idCode serial primary key,
    Code varchar(10),
    Nom varchar(30)
);


create table compteprincipal(
    NumeroCompte integer,
    NomCompte varchar(20)
);
grant all privileges on compteprincipal to compte;

create table comptes(
    NumeroCompte integer PRIMARY KEY,
    NomCompte varchar(50)
);
grant all privileges on comptes to compte;

create table exercice(
    idExercice serial primary key,
    Debut date ,
    Fin date
);
grant all privileges on exercice to compte;

create table devise(
    idDevise serial primary key,
    NomMonnaie varchar(5),
    PrixEnAriary double precision
);

create table journal(
    idJournal serial primary key,
    numpiece double precision,
    referencepiece varchar(20),
    numcompte integer,
    Libelle TEXT,
    Echeance varchar(20),
    Devise integer,
    Parite varchar(20),
    Quantite double precision,
    Debit double precision,
    Credit double precision,
    FOREIGN KEY (Devise) REFERENCES devise(idDevise),
    FOREIGN key (numcompte) REFERENCES comptes(NumeroCompte)
);


create table entreprise(
    idEntreprise serial primary key,
    NomSociete varchar(50),
    AdressePhysique varchar(50),
    AdresseExploitation varchar(50),
    Dirigeant varchar(70),
    Creation date,
    Identificationfiscal varchar(70),
    Numstatistique varchar(70),
    NumRegistre varchar(70),
    statusEntreprise text,
    exercice int,
    FOREIGN KEY (exercice) REFERENCES exercice(idExercice)
);
grant all privileges on entreprise to compte;

insert into comptes values(10100, 'Capital');
insert into comptes values(10610, 'RESERVE LEGALE');
insert into comptes values(10620, 'RESERVES STATUAIRES');
insert into comptes values(11000, 'REPORT A NOUVEAU');
insert into comptes values(11010, 'REPORT A NOUVEAU SOLDE CREDITEUR');
insert into comptes values(11200, 'AUTRES PRODUITS ET CHARGES');
insert into comptes values(11900, 'REPORT A NOUVEAUN SOLDE DEBITEUR');
insert into comptes values(12800, 'RESULTAT EN INSTANCE');
insert into comptes values(13100, 'SUBVENTION D EQUIPEMENT');
insert into comptes values(13300, 'IMPOTS DIFFERES ACTIFS');
insert into comptes values(16110, 'EMPRUNT A LT');
insert into comptes values(16510, 'EMPRUNT A MOYEN TERME');
insert into comptes values(20124, 'FRAIS DE REHABILITATION');
insert into comptes values(20800, 'AUTRES IMMOB INCORPORELLES');
insert into comptes values(21100, 'TERRAINS');
insert into comptes values(21200, 'CONSTRUCTION');
insert into comptes values(21300, 'MATERIEL ET OUTILLAGE');
insert into comptes values(21510, 'MATERIEL AUTOMOBILE');
insert into comptes values(21520, 'MATERIEL MOTO');
insert into comptes values(21600, 'AGENCEMENT .AM.INST');
insert into comptes values(21810, 'MATERIELS ET MOBILIERS DE BUREAU');
insert into comptes values(21819, 'MATERIELS INFORMAIQUES ET AUTRES');
insert into comptes values(21820, 'MAT.MOB DE LOEMENT');
insert into comptes values(21880, 'AUTRES IMMOBILISATIONS CORP');
insert into comptes values(23000, 'IMMOBILISATION EN COURS');
insert into comptes values(28000, 'AMORT IMMOB INCORP');
insert into comptes values(28120, 'AMORTISSEMENT DES CONSTRUCTIONS');
insert into comptes values(28130, 'AMORT MACH-MATER-OUTIL');
insert into comptes values(28150, 'AMORT MAT DE TRANSPORT');
insert into comptes values(28160, 'AMORT A.A.I');
insert into comptes values(28181, 'AMORT MATERIEL&MOB');
insert into comptes values(28182, 'AMORTISSEMENTS MATERIELS INFORMATIQ');
insert into comptes values(28183, 'AMORT MATER & MOB LOGT');
insert into comptes values(32110, 'STOCK MATIERES PREMIERES');
insert into comptes values(32120, 'PETITES FOURNITURES');


insert into codejournaux values (default,'AC','ACHAT');
insert into codejournaux values (default,'AN','A NOUVEAU');
insert into codejournaux values (default,'BN','BANQUE BNI');
insert into codejournaux values (default,'BO','BANQUE BOA');
insert into codejournaux values (default,'CA','CAISSE');
insert into codejournaux values (default,'OD','OPERATIONS DIVERSES');
insert into codejournaux values (default,'VE','VENTE EXPORT');
insert into codejournaux values (default,'VL','VENTE LOCALE');


CREATE TABLE balance_comptes (
    NumeroCompte INTEGER,
    mvt_debit FLOAT,
    mvt_credit FLOAT,
    solde_debit FLOAT,
    solde_credit FLOAT, 
    FOREIGN key (NumeroCompte)
    REFERENCES comptes(NumeroCompte)
);
grant all privileges on balance_comptes to compte;

INSERT into balance_comptes values(10100,0,1400000.00,0,1400000.00);
INSERT into balance_comptes values(10610,0,44044.00,0,44044.00);
INSERT into balance_comptes values(12000,322400.00,322400.00,0,0);
INSERT into balance_comptes values(16610,180720.00,388548.00,0,207828.00);
INSERT into balance_comptes values(32110,785800.00,276130.00,509670.00,1400000.00);
INSERT into balance_comptes values(21200,846200.00,0,846200.00,0);
INSERT into balance_comptes values(28150,0,1085400.00,0,1085400.00);
INSERT into balance_comptes values(32120,32000.00,0,32000.00,0);

select comptes.* , balance_comptes.* from comptes join balance_comptes on comptes.numerocompte = balance_comptes.numerocompte;

CREATE TABLE piece(
    numpiece INT,
    datepiece date,
    code VARCHAR(20),
    reference VARCHAR(50),
);
CREATE table grand_livre(
    
    numerocompte integer,
    debit FLOAT,
    credit FLOAT,
    solde FLOAT,

);