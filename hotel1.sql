--
-- Base de données : `hotel`
--

--
-- Table Station
--

CREATE TABLE station (
  num_station int(11) NOT NULL AUTO_INCREMENT,
  nom_station varchar(250) NOT NULL,
  PRIMARY KEY (num_station)
);

--
-- Table Hotel
--

CREATE TABLE hotel (
  num_hotel int(11) NOT NULL AUTO_INCREMENT,
  capacite_hotel int(255) NOT NULL,
  categorie_hotel int(10) NOT NULL,
  nom_hotel varchar(255) NOT NULL,
  adresse_hotel text NOT NULL,
  stanum int(11) NOT NULL,
  PRIMARY KEY (num_hotel),
  FOREIGN KEY (stanum) REFERENCES station (num_station)
);

--
-- Table Chambre
--

CREATE TABLE chambre (
  num_chambre int(11) NOT NULL AUTO_INCREMENT,
  capacite_chambre int(10) NOT NULL,
  degre_confort varchar(20) NOT NULL,
  exposition varchar(20) NOT NULL,
  type_chambre varchar(20) NOT NULL,
  hotnum int(11) NOT NULL,
  PRIMARY KEY (num_chambre),
  FOREIGN KEY (hotnum) REFERENCES hotel (num_hotel)
);

--
-- Table Client
--

CREATE TABLE client (
  num_client int(11) NOT NULL AUTO_INCREMENT,
  adresse_client text NOT NULL,
  nom_client varchar(255) NOT NULL,
  prenom_client varchar(255) NOT NULL,
  PRIMARY KEY (num_client)
);


--
-- Table Reservation
--

CREATE TABLE reservation (
  chambnum int(11) NOT NULL,
  clinum int(11) NOT NULL,
  date_debut date NOT NULL,
  date_fin date NOT NULL,
  date_reservation date NOT NULL,
  montant_arrhes int(11) NOT NULL,
  prix_total int(11) NOT NULL,
  FOREIGN KEY (chambnum) REFERENCES chambre (num_chambre),
  FOREIGN KEY (clinum) REFERENCES client (num_client)
);



------------------------------------------------------------------

CREATE USER "util1"@"%" IDENTIFIED BY "mickeymouse";
GRANT ALL PRIVILEGES ON hotel.* TO "util1"@"%" IDENTIFIED BY "mickeymouse";

CREATE USER "util2"@"%" IDENTIFIED BY "donaldduck";
GRANT SELECT ON hotel.* TO "util2"@"%" IDENTIFIED BY "donaldduck";

CREATE USER "util3"@"%" IDENTIFIED BY "tomjerry";
GRANT  SELECT ON hotel.station TO "util3"@"%" IDENTIFIED BY "tomjerry";


