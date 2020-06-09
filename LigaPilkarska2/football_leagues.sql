DROP SCHEMA

IF EXISTS football_leagues;
   CREATE SCHEMA football_leagues COLLATE = utf8_general_ci;

USE football_leagues;

create table country(
    country_id int not null auto_increment primary key,
    country_name varchar(25) not null
);

create table leagues(
    leagues_id int not null auto_increment primary key,
    countryID int not null,
    size_league int not null,
    name_league varchar(60) not null
);

create table stadium(
    stadium_id int not null auto_increment primary key,
    name_stadium varchar(60) not null,
    address varchar(60) not null,
    dateOfBuilt date not null,
    clubID int not null,
    capacity int not null
);

create table employees(
    employees_id int not null auto_increment primary key,
    job_title varchar(50) not null,
    first_name varchar(25) not null,
    surname varchar(25) not null,
    born_date date not null,
    clubID int not null
);

create table club(
    club_id int not null auto_increment primary key,
    club_name varchar(50) not null,
    city varchar(40) not null,
    dateOfFounding date not null,
    leagueID int null
);

create table player(
    player_id int not null auto_increment primary key,
    first_name varchar(25) not null,
    surname varchar(25) not null,
    born_date date not null,
    clubID int not null,
    countryID int not null,
    position enum ('GK','CB','LB','RB','CDM','CM','LM','RM','LW','RW','CAM','ST') not null,
    foot enum ('left','right','both'),
    market_value double not null
);


alter table employees add foreign key (clubID) references club(club_id);
alter table stadium add foreign key (clubID) references club(club_id);
alter table player add foreign key (countryID) references country(country_id);
alter table player add foreign key (clubID) references club(club_id);
alter table leagues add foreign key (countryID) references country(country_id);
alter table club add foreign key (leagueID) references leagues(leagues_id);


#wykonane
insert into country values (null,'Polska');
insert into country values (null,'Niemcy');
insert into country values (null,'Hiszpania');
insert into country values (null,'Włochy');
insert into country values (null,'Czechy');
insert into country values (null,'Słowacja');
insert into country values (null,'Ukraina');
insert into country values (null,'Francja');
insert into country values (null,'Słowenia');
insert into country values (null,'Argentyna');
insert into country values (null,'Serbia');
insert into country values (null,'Portugalia');
insert into country values (null,'Brazylia');
insert into country values (null,'Dania');
insert into country values (null,'Anglia');
insert into country values (null,'Rumunia');
insert into country values (null,'Belgia');
insert into country values (null,'Holandia');
insert into country values (null,'Węgry');
insert into country values (null,'Chorwacja');
insert into country values (null,'Urugwaj');
insert into country values (null,'Zambia');
insert into country values (null,'Norwegia');
insert into country values (null,'Austria');
insert into country values (null,'Grecja');
insert into country values (null,'USA');
insert into country values (null,'Islandia');
insert into country values (null,'Rosja');
insert into country values (null,'Irlandia');
insert into country values (null,'Albania');
insert into country values (null,'Gambia');
insert into country values (null,'Izrael');
insert into country values (null,'Bośnia i Hercegowina');
insert into country values (null,'Finlandia');
insert into country values (null,'łotwa');
insert into country values (null,'Szwecja');
insert into country values (null,'Gruzja');
insert into country values (null,'Szwajcaria');
insert into country values (null,'Algieria');
insert into country values (null,'Burkina Fasa');
insert into country values (null,'Jamajka');
insert into country values (null,'Korea Południowa');
insert into country values (null,'Mali');
insert into country values (null,'Turcja');
insert into country values (null,'Kolumbia');
insert into country values (null,'Wenezuela');
insert into country values (null,'Kamerun');
insert into country values (null,'Ghana');
insert into country values (null,'Nigeria');
insert into country values (null,'Walia');
insert into country values (null,'Maroko');
insert into country values (null,'Macedonia');
insert into country values (null,'Szkocja');
insert into country values (null,'Japonia');
insert into country values (null,'Wybrzeże Kości Słoniowej');
#wykonane
insert into leagues values (null,1,16,'Ekstraklasa');
insert into leagues values (null,2,18,'Bundesliga');
insert into leagues values (null,3,20,'LaLiga');
insert into leagues values (null,4,20,'Serie A');
insert into leagues values (null,8,20,'Ligue 1');

#do zrobieniea
#Ekstraklaska kluby
insert into club values (null,'Legia Warszawa','Warszawa','1927-04-03',1);
insert into club values (null,'Piast Gilwice','Gilwice','1945-06-18',1);
insert into club values (null,'Cracovia','Krakow','1906-06-13',1); #YYYY-MM-DD
insert into club values (null,'Śląsk Wrocław','Wrocław','1947-03-13',1);
insert into club values (null,'Lech Poznań','Poznań','1948-03-14',1);
insert into club values (null,'Pogoń Szczecin','Szczecin','1948-07-24',1);
insert into club values (null,'Lechia Gdańsk','Gdańsk','1945-01-14',1);
insert into club values (null,'Jagiellonia Białystok','Białystok','1920-11-04',1);
insert into club values (null,'Raków Częstochowa','Białystok','1921-12-09',1);
insert into club values (null,'Wisła Płock','Płock','1947-02-19',1);
insert into club values (null,'KGHM Zagłębie Lubin','Lubin','1946-12-29',1);
insert into club values (null,'Górnik Zabrze','Zabrze','1948-02-04',1);
insert into club values (null,'Wisla Krakow','Krakow','1906-05-11',1);
insert into club values (null,'Korona Kielce','Kielce','1973-07-24',1);
insert into club values (null,'Arka Gdynia','Gdynia','1929-02-12',1);
insert into club values (null,'ŁKS Łódź','Łódź','1908-03-22',1);

#Bundesliga kluby
insert into club values (null,'Bayern Monachium','Monachium','1900-02-27',2);
insert into club values (null,'Borussia Dortmund','Dortmund','1909-12-19',2);
insert into club values (null,'RB Lipsk','Lipsk','2009-05-19',2);
insert into club values (null,'Borussia Moenchengladbach','Moenchengladbach','1900-08-01',2);
insert into club values (null,'Bayer 04 Leverkusen','Leverkusen','1904-07-01',2);
insert into club values (null,'VfL Wolfsburg','Wolfsburg','1945-09-12',2);
insert into club values (null,'SC Freiburg','Freiburg','1904-05-30',2);
insert into club values (null,'TSG 1899 Hoffenheim','Hoffenheim','1899-07-01',2);
insert into club values (null,'Schalke 04 Gelsenkirchen','Gelsenkirchen','1904-05-04',2);
insert into club values (null,'FC Koeln','Kolonia','1948-10-14',2);
insert into club values (null,'Union Berlin','Berlin','1906-11-24',2);
insert into club values (null,'Eintracht Frankfurt','Frankfurt','1899-03-08',2);
insert into club values (null,'Hertha Berlin','Berlin','1892-07-25',2);
insert into club values (null,'FC Augsburg','Augsburg','1907-08-08',2);
insert into club values (null,'FSV Mainz','Mainz','1905-01-18',2);
insert into club values (null,'Fortuna Duesseldorf','Duesseldorf','1895-05-05',2);
insert into club values (null,'Werder Brema','Brema','1899-04-02',2);
insert into club values (null,'SC Paderborn','Paderborn','1907-11-12',2);


#laLiga kluby
insert into club values (null,'FC Barcelona','Barcelona','1899-11-29',3);
insert into club values (null,'Real Madryt','Madryt','1902-03-06',3);
insert into club values (null,'Sevilla FC','Sevilla','1890-01-25',3);
insert into club values (null,'Real Sociedad','San Sebastian','1909-09-07',3);
insert into club values (null,'Getafe CF','Getafe','1983-07-08',3);
insert into club values (null,'Atletico Madryt','Madryt','1903-04-26',3);
insert into club values (null,'Valencia CF','Walencja','1919-03-18',3);
insert into club values (null,'Villarreal CF','Villarreal','1923-03-10',3);
insert into club values (null,'Granada CF','Granada','1923-03-10',3);
insert into club values (null,'Athletic Bilbao','Bilbao','1898-01-12',3);
insert into club values (null,'Osasuna Pampeluna','Pampeluna','1920-11-22',3);
insert into club values (null,'Real Betis Sewilla','Sewilla','1907-09-12',3);
insert into club values (null,'Levante UD','Walencja','1909-11-02',3);
insert into club values (null,'Deportivo Alaves','Vitoria','1921-01-23',3);
insert into club values (null,'Real Valladolid','Valladolid','1928-11-21',3);
insert into club values (null,'SD Eibar','Eibar','1940-07-11',3);
insert into club values (null,'Celta Vigo','Vigo','1923-08-23',3);
insert into club values (null,'RCD Mallorca','Majorka','1916-03-05',3);
insert into club values (null,'CD Leganes','Madryt','1928-03-06',3);
insert into club values (null,'Espanyol Barcelona','Barcelona','1900-10-28',3);


#serie A kluby
insert into club values (null,'Juventus Turyn','Turyn','1897-11-01',4);
insert into club values (null,'Lazio Rzym','Rzym','1900-01-09',4);
insert into club values (null,'Inter Mediolan','Mediolan','1908-03-09',4);
insert into club values (null,'Atalanta Bergamo','Bergamo','1907-02-19',4);
insert into club values (null,'AS Roma','Rzym','1927-07-22',4);
insert into club values (null,'SSC Napoli','Neapol','1926-08-01',4);
insert into club values (null,'AC Milan','Mediolan','1899-12-16',4);
insert into club values (null,'Hellas Werona','Werona','1903-02-26',4);
insert into club values (null,'AC Parma','Parma','1990-05-27',4);
insert into club values (null,'Bologna FC','Parma','1909-04-17',4);
insert into club values (null,'Cagliari Calcio','Cagliari','1929-05-30',4);
insert into club values (null,'US Sassuolo','Sassuolo','1920-02-10',4);
insert into club values (null,'ACF Fiorentina','Fiorentina','1926-08-29',4);
insert into club values (null,'Udinese Calcio','Udine','1896-01-29',4);
insert into club values (null,'Torino FC','Torino','1906-11-12',4);
insert into club values (null,'Sampdoria Genua','Genua','1946-01-22',4);
insert into club values (null,'Genoa CFC','Genua','1893-09-07',4);
insert into club values (null,'US Lecce','Lecce','1908-02-17',4);
insert into club values (null,'SPAL Ferrara','Ferrara','1907-01-07',4);
insert into club values (null,'Brescia Calcio','Brescia','1911-03-27',4);


#Ligue 1
insert into club values (null,'Paris Saint-Germain','Parż','1970-08-11',5);
insert into club values (null,'Olympique Marsylia','Marsylia','1899-08-31',5);
insert into club values (null,'Stade Rennes','Rennes','1901-02-12',5);
insert into club values (null,'OSC Lille','Lille','1944-02-11',5);
insert into club values (null,'Stade de Reims','Reims','1931-06-22',5);
insert into club values (null,'OGC Nice','Nicea','1904-10-21',5);
insert into club values (null,'Olympique Lyon','Lyon','1899-01-02',5);
insert into club values (null,'Montpellier HSC','Montpellier','1919-01-06',5);
insert into club values (null,'AS Monaco','Monaco','1924-08-23',5);
insert into club values (null,'Angers SCO','Angers','1919-02-11',5);
insert into club values (null,'RC Strasbourg','Strasburgu','1906-10-07',5);
insert into club values (null,'Girondins Bordeaux','Bordeaux','1940-10-01',5);
insert into club values (null,'FC Nantes','Nantes','1943-12-25',5);
insert into club values (null,'Stade Brestois 29','Brest','1903-01-12',5);
insert into club values (null,'FC Metz','Metz ','1919-05-21',5);
insert into club values (null,'Dijon FCO','Dijon','1998-03-21',5);
insert into club values (null,'AS Saint-Etienne','Saint-Etienne','1919-07-05',5);
insert into club values (null,'Nimes Olympique','Nimes','1937-04-10',5);
insert into club values (null,'Amiens SC','Amiens ','1901-03-11',5);
insert into club values (null,'Toulouse FC','Tuluza','1970-01-29',5);



#Ekstraklasa stadiony
insert into  stadium values (null,'Stadion Miejski Legii Warszawa','Łazienkowska 3','1956-08-09',1,29861);
insert into  stadium values (null,'Stadion Miejski w Gliwicach','Okrzei 20','2011-11-05',2,9913);
insert into  stadium values (null,'Stadion MKS Cracovia','Józefa Kałuży 1','2010-10-11',3,15007);
insert into  stadium values (null,'Stadion Miejski we Wrocławiu','Śląska 1','2011-09-08',4,45107);
insert into  stadium values (null,'Stadion Miejski w Poznaniu','Bułgarska 17','2010-09-20',5,41609);
insert into  stadium values (null,'Stadion Miejski im. Floriana Krygiera','Karłowicza 28','1925-10-05',6,17015);
insert into  stadium values (null,'Stadion Energa Gdańsk','Pokoleń Lechii Gdańsk 1','2011-08-14',7,41268);
insert into  stadium values (null,'Stadion Miejski w Białymstoku','Słoneczna 1','2014-10-18',8, 22376);
insert into  stadium values (null,'GIEKSA Arena','Limanowskiego 83','1977-11-28',9, 5264);
insert into  stadium values (null,'Stadion im. Kazimierza Górskiego','Łukasiewicza 34','1973-06-10',10,9750);
insert into  stadium values (null,'Stadion Zagłębia Lubin','Marii Skłodowskiej-Curie 98','2009-03-14',11,16032);
insert into  stadium values (null,'Stadion im. Ernesta Pohla','Roosevelta 81','1934-09-02',12,31871);
insert into  stadium values (null,'Stadion Miejski im. Henryka Reymana','Reymonta 22','2011-10-02',13,33130);
insert into  stadium values (null,'Suzuki Arena',' Ściegiennego 8','2006-04-01',14,15500);
insert into  stadium values (null,'Stadion Miejski w Gdyni','Olimpijska 5','2011-02-19',15,15139);
insert into  stadium values (null,'Stadion Miejski w Łodzi','Unii Lubelskiej 2','2015-06-19',16,5992);


#Bundesliga stadiony
insert into stadium values (null,'Allianz Arena','Werner-Heisenberg-Allee 25','2005-05-30',17,75024);
insert into stadium values (null,'Signal Iduna Park','trobelallee 50','1974-04-02',18,81365);
insert into stadium values (null,'Red Bull Arena','Am Sportforum 3 ','2004-03-07',19,41939);
insert into stadium values (null,'Borussia-Park','Hennes Weisweiler Allee 1','2004-07-30',20,59724);
insert into stadium values (null,'BayArena','Bismarckstraße','1958-08-02',21,30210);
insert into stadium values (null,'Volkswagen-Arena','Allerwiesen 1','2002-12-13',22,30000);
insert into stadium values (null,'Schwarzwald-Stadion','Schwarzwaldstraße 193','1954-04-17',23,24000);
insert into stadium values (null,'Prezero-Arena','Dietmar-Hopp-Straße','2009-01-24 ',24,30150);
insert into stadium values (null,'Veltins-Arena','Rudi-Assauer-Platz 1','2001-08-13',25,62271);
insert into stadium values (null,'RheinEnergieStadion','Aachener Str','2004-01-31',26,49968);
insert into stadium values (null,'Stadion An der Alten Försterei','Wuhlheide 263','2004-03-07',27,21717);
insert into stadium values (null,'Commerzbank-Arena','Mörfelder Landstraße 362','2005-09-17',28,51500);
insert into stadium values (null,'Stadion Olimpijski w Berlinie','Olympischer Platz 3','2004-01-27',29,74475);
insert into stadium values (null,'WWK Arena','Bürgermeister-Ulrich-Straße 90','2009-07-26',30,30660);
insert into stadium values (null,'Opel Arena','Eugen-Salomon-Straße 1','2011-07-03',31,33305);
insert into stadium values (null,'Esprit Arena','Arena-Straße 1','2004-09-10',32,54600);
insert into stadium values (null,'Weserstadion','Franz-Böhmert-Straße 1','2010-10-27',33,42358);
insert into stadium values (null,'Benteler-Arena','Wilfried-Finke-Allee 1','2008-07-20',34,15000);

#LaLiga stadiony
insert into stadium values (null,'Camp Nou','Arístides Maillol','1954-09-10',35,99354);
insert into stadium values (null,'Santiago Bernabéu','Concha Espina','1947-12-14',36,81044);
insert into stadium values (null,'Ramon sanchez pizjuan','Calle Sevilla','1958-09-07',37,43883);
insert into stadium values (null,'Estadio Anoeta','Anoeta Pasalekua','2019-06-13',38,39500);
insert into stadium values (null,'Coliseum Alfonso Pérez','Teresa de Calcuta','1998-11-02',39,17000);
insert into stadium values (null,'Wanda Metropolitano','Luis Aragones','2017-09-17',40,68456);
insert into stadium values (null,'Estadio Mestalla','Suècia','2005-10-23',41,49500);
insert into stadium values (null,'El Madrigal',' Carrer Blasco Ibáñez','1989-06-12',42,23500);
insert into stadium values (null,'Estadio Nuevo Los Cármenes','Calle Pintor Manuel','1995-05-16',43,19336);
insert into stadium values (null,'San Mames','Rafael Moreno Pitxitxi','2013-09-16',44,53289);
insert into stadium values (null,'Estadio El Sadar','Calle del Sadar','1967-09-02',45, 18375);
insert into stadium values (null,'Estadio Benito Villamarín','Heliópolis','1993-06-06',46,60721);
insert into stadium values (null,'Estadio Ciudad de Valencia','Carrer de Sant Vicen','1969-09-09',47,26354);
insert into stadium values (null,'Estadio de Mendizorroza','Cervantes Ibilbidea','1924-04-27',48,19840);
insert into stadium values (null,'Estadio José Zorrilla','Mundial 82','1082-02-20',49,27618);
insert into stadium values (null,'Estadio de Ipurua','Ipurua Kalea 2','1947-09-14',50, 7083);
insert into stadium values (null,'Estadio Balaídos','de Balaídos 13','2004-08-17',51,29000);
insert into stadium values (null,'Iberostar Estadio','Camí dels Reis','1999-06-23',52,23142);
insert into stadium values (null,'Estadio municipal','','1998-10-03',53,12454);
insert into stadium values (null,'Estadi Cornellà-El Prat','Baix Llobregat','2009-08-02',54,40000);



#Seria A stadiony
insert into stadium values (null,'Allianz Stadium','Corso Gaetano Scirea','2011-09-08',55,41254);
insert into stadium values (null,'Stadio Olimpico','Viale dei Gladiatori','1937-09-11',56,72698);
insert into stadium values (null,'San Siro','Piazzale Angelo Moratti','1950-02-11',57,80018);
insert into stadium values (null,'Stadio Atleti Azzurri d’Italia','Viale Giulio Cesare','1928-12-23',58,21300);
insert into stadium values (null,'Stadio Olimpico','Viale dei Gladiatori','1937-09-11',59,72698);
insert into stadium values (null,'Stadio San Paolo','Piazzale Vincenzo Tecchio','1990-12-06',60,55000);
insert into stadium values (null,'San Siro','Piazzale Angelo Moratti','1950-02-11',61,80018);
insert into stadium values (null,'Stadio Marcantonio Bentegodi','Piazzale Olimpia','1963-09-15',62,45000);
insert into stadium values (null,'Stadio Ennio Tardini','Viale Partigiani','1923-09-16',63,22352);
insert into stadium values (null,'Stadio Renato Dall','Via Andrea Costa','1927-12-11',64,38279);
insert into stadium values (null,'Mapei Stadium','Piazzale Atleti Azzur','1995-04-15',65,23717);
insert into stadium values (null,'Sardegna Arena','Via Raimondo Carta','2017-09-10',66,16233);
insert into stadium values (null,'Stadio Artemio Franchi','Viale Manfredo Fant','1931-09-13',67,43147);
insert into stadium values (null,'Stadio Friuli','Piazzale Repubblica','1976-09-26',68,25132);
insert into stadium values (null,'Stadio Olimpico di Torino','Via Filadelfia','1933-05-14',69,28177);
insert into stadium values (null,'Stadio Luigi Ferraris','Via Giovanni','1911-01-22',70,37599);
insert into stadium values (null,'Stadio Luigi Ferraris','Via Giovanni','1911-01-22',71,37599);
insert into stadium values (null,'Stadio Via del Mare','73100 Lecce','1966-10-02',72,31533);
insert into stadium values (null,'Stadio Paolo Mazza','Corso Piave','1928-09-20',73,16134);
insert into stadium values (null,'Stadio Mario Rigamonti','Via Giovanni Novagani','1959-09-29',74,16743);


#Ligue 1 stadiony
insert into stadium values (null,'Parc des Princes','24 Rue du Commandant Guilbaud','1876-07-18',75,47929);
insert into stadium values (null,'Stade Vélodrome','3 Boulevard Michelet','1937-06-13',76,67394);
insert into stadium values (null,'Roazhon Park','111 Rue de Lorient','1912-03-12',77,31127);
insert into stadium values (null,'Stade Pierre-Mauroy','261 Boulevard de Tournai','2012-08-17',78,50186);
insert into stadium values (null,'Stade Auguste Delaune','Chaussée Bocquaine','1935-06-02',79,21127);
insert into stadium values (null,'Allianz Riviera','Boulevard des Jardiniers','2013-09-22',80,35624);
insert into stadium values (null,'Parc Olympique Lyonnais','10 Avenue Simone Veil','2016-01-09',81,59186);
insert into stadium values (null,'Stade de la Mosson','345 Avenue de Heidelberg','1972-11-30',82,32900);
insert into stadium values (null,'Stadion Ludwika II','7 Avenue des Castelans','1985-05-11',83,18523);
insert into stadium values (null,'Stade Raymond-Kopa','Boulevard Pierre de Coubertin','1912-12-19',84,18752);
insert into stadium values (null,'Stade de la Meinau','12 Rue de Extenwoerth','1914-03-13',85,26109);
insert into stadium values (null,'Stade Matmut-Atlantique','Cours Jules Ladoumegue','2015-05-18',86,42115);
insert into stadium values (null,'Stade de la Beaujoire','','1984-05-08',87,37473);
insert into stadium values (null,'Stade Francis-Le Blé','26 Rue de Quimper','1922-04-21',88,16000);
insert into stadium values (null,'Stade Municipal Saint Symphorien','3 Boulevard Saint-Symphorien','1923-09-11',89,25636);
insert into stadium values (null,'Stade Gaston Gérard','Place Gaston Gérard','1934-05-21',90,15995);
insert into stadium values (null,'Stade Geoffroy-Guichard','14 Rue Paul et Pierre','1931-09-13',91,41965);
insert into stadium values (null,'Stade des Costières','123 Avenue de la Bouvine','1989-05-15',92,18364);
insert into stadium values (null,'Stade de la Licorne','25 Rue du Chapitre','1999-07-24',93,12097);
insert into stadium values (null,'Stadium Municipal','1 Allée Gabriel Biénès','1937-09-11',94,33150);


#Piłkarze Legii Warszawa
insert into player values (null,'Radoslaw','Majecki','1999-11-16', 1, 1,'GK','right',4500000);
insert into player values (null,'Mateusz','Wieteska','1997-02-11', 1, 1,'CB','right',1300000);
insert into player values (null,'William','Rémy','1991-04-04', 1,8 ,'CB','right',1000000);
insert into player values (null,'Artur','Jedrzejczyk','1987-11-04', 1, 1,'CB','right',675000);
insert into player values (null,'Michał','Karbownik','2001-03-13',1, 1,'LB','both',3600000 );
insert into player values (null,'Marko','Vesovic','1991-08-28', 1, 11,'RB','right',1200000 );
insert into player values (null,'Bartosz','Slisz','1999-03-29',1 ,1 ,'CM','right',1300000 );
insert into player values (null,'André','Martins','1990-09-06', 1,12 ,'CM','right',1200000 );
insert into player values (null,'Valeriane','Gvilia','1994-05-24', 1, 7,'CAM','right',1600000 );
insert into player values (null,'Lucas','Linhares','1996-09-28',1 ,13 ,'LW','right',1200000 );
insert into player values (null,'Pawel','Wszolek','1992-04-30', 1, 1,'RW','right',1600000 );
insert into player values (null,'Tomas','Pekhart','1989-05-26', 1, 5,'ST','right',475000 );

#Pracownicy Legii Warszawa
insert into employees values(null,'President','Dariusz','Miodulski','1964-01-01',1);
insert into employees values(null,'Coach','Aleksandar','Vukovic','1979-08-25',1);

#Pilkarze piast Gliwice
insert into player values (null,'Frantisek','Plach','1992-03-08',2,5 ,'GK','right',400000 );
insert into player values (null,'Jakub','Czerwinski','1991-08-06',2, 1,'CB','right',550000 );
insert into player values (null,'Piotr','Malarczyk','1991-08-01',2, 1,'CB','right', 300000);
insert into player values (null,'Mikkel','Kirkeskov','1991-09-05',2, 14,'LB','left',550000 );
insert into player values (null,'Bartosz','Rymaniak','1989-11-13',2, 1,'RB','right', 325000);
insert into player values (null,'Tom','Hateley','1989-09-12',2, 15,'CDM','right',400000 );
insert into player values (null,'Sebastian','Milewski','1998-04-30',2,1 ,'CM','right',250000 );
insert into player values (null,'Martin','Konczkowski','1993-09-14',2, 1,'RM','right',400000 );
insert into player values (null,'Jorge','Félix','1991-08-22',2,3 ,'LW','right',800000 );
insert into player values (null,'Piotr','Parzyszek','1993-09-08',2, 1,'ST','both',800000 );
insert into player values (null,'Tiago','Alves','1996-06-19',2,12 ,'RW','right', 150000);

#Pracownicy piast Gliwice
insert into employees values(null,'President','Paweł','Żelem','1980-09-20',2);
insert into employees values(null,'Coach','Waldemar','Fornalik','1963-04-11',2);

#Pilkarze Cracovia
insert into player values (null,'Lukas','Hrosso','1987-04-19',3,5 ,'GK','both',150000);
insert into player values (null,'David','Jablonský','1991-10-08',3,5 ,'CB','right',1000000);
insert into player values (null,'Michał','Helik','1995-09-09',3,1 ,'CB','right',400000);
insert into player values (null,'Kamil','Pestka','1998-08-22',3,1 ,'LB','left',575000);
insert into player values (null,'Cornel','Rapa','1990-01-16',3,16 ,'RB','right',450000);
insert into player values (null,'Janusz','Gol','1985-11-11',3, 1,'CDM','right',325000);
insert into player values (null,'Florian','Loshaj','1996-08-13',3,17 ,'CM','left',400000);
insert into player values (null,'Loshaj','van Amersfoort','1996-04-01',3,18 ,'CAM','right',800000);
insert into player values (null,'Sylwester','Lusiusz','1999-10-18',3,1 ,'CM','right',200000);
insert into player values (null,'Mateusz','Wdowiak','1996-08-26',3,1 ,'LW','right',3250000);
insert into player values (null,'Sergiu','Hanca','1992-04-04',3,16 ,'RW','right',600000);
insert into player values (null,'Rafa','Lopes','1991-07-28',3,12 ,'ST','right',600000);

#Pracownicy Cracovia
insert into employees values(null,'President','Janusz','Filipiak','1952-08-03',3);
insert into employees values(null,'Coach','Michal','Probierz','1972-09-24',3);

#Piłkarze ślask Wrocław
insert into player values (null,'Daniel','Kajzer','1992-02-23',4,1 ,'GK','right',300000);
insert into player values (null,'Wojciech','Golla','1992-01-12',4,1 ,'CB','right',400000);
insert into player values (null,'Márk','Tamás','1993-10-28',4,19 ,'CB','left',250000);
insert into player values (null,'Guillermo','Cotugno','1995-03-12',4, 21,'RB','right',800000);
insert into player values (null,'Dino','Stiglec','1990-10-03',4,20 ,'LB','left',600000);
insert into player values (null,'Diego','Zivulic','1992-03-23',4,20 ,'CDM','right',300000);
insert into player values (null,'Michał','Chrapel','1992-04-03',4,1 ,'CM','right',350000);
insert into player values (null,'Jakub','Łabojko','1997-10-03',4,1 ,'CM','right',300000);
insert into player values (null,'Adrian','Lyszczarz','1999-09-22',4,1 ,'CAM','right',200000);
insert into player values (null,'Przemysław','Płacheta','1998-03-23',4,1 ,'LW','left',700000);
insert into player values (null,'Lubambo','Musonda','1995-03-01',4,22 ,'RW','right',300000);

#Pracownicy ślask Wrocław
insert into employees values(null,'President','Piotr','Waśniewski','1984-03-13',4);
insert into employees values(null,'Coach','Vitezslav','Lavicka','1963-04-30',4);

#Piłkarze Lech Poznan
insert into player values (null,'Mickey','van der Hart','1994-06-13',5,18 ,'GK','left',500000);
insert into player values (null,'Lubomir','Šatka','1995-12-02',5,6 ,'CB','right',800000);
insert into player values (null,'Thomas','Rogne','1990-06-29',5,23 ,'CB','right',600000);
insert into player values (null,'Volodymyr','Kostevych','1992-10-27',5,7 ,'LB','left',1000000);
insert into player values (null,'Robert','Gumny','1998-06-04',5,1 ,'RB','right',3800000);
insert into player values (null,'Pedro','Tiba','1988-08-31',5,12 ,'CM','right',1000000);
insert into player values (null,'Jakub','Moder','1999-04-07',5, 1,'CM','both',500000);
insert into player values (null,'Filip','Marchwinski','2002-01-10',5,1 ,'CAM','both',2300000);
insert into player values (null,'Kamil','Jozwiak','1998-04-22',5,1 ,'RW','right',2700000);
insert into player values (null,'Christian','Gytkjaer','1990-05-06',5,14 ,'ST','right',2000000);
insert into player values (null,'Tymoteusz','Puchacz','1999-01-23',5,1 ,'LW','left',900000);

#Pracownicy Lech Poznan
insert into employees values(null,'President','Karol','klimczak','1980-05-02',5);
insert into employees values(null,'Coach','Dariusz','Zuraw','1972-11-14',5);

#Piłkarze Pogoń Szczecin
insert into player values (null,'Dante','Stipica','1991-05-30',6, 20,'GK','right',650000);
insert into player values (null,'Benedikt','Zech','1990-11-03',6,24 ,'CB','right',650000);
insert into player values (null,'Konstantinos','Triantafyllopoulos','1993-04-03',6,25 ,'CB','right',600000);
insert into player values (null,'Hubert','Matynia','1995-11-04',6,1 ,'LB','both',470000);
insert into player values (null,'Jakub','Bartkowski','1991-11-07',6,1 ,'RB','right',300000);
insert into player values (null,'Tomás','Podstawski','1995-01-30',6,12 ,'CDM','both',500000);
insert into player values (null,'Kamil','Drygas','1991-09-11',6,1 ,'CM','left',500000);
insert into player values (null,'Marcin','Listkowski','1998-02-10',6,1 ,'CAM','both',300000);
insert into player values (null,'Srdjan','Spiridonovic','1993-09-13',6,24 ,'LW','both',600000);
insert into player values (null,'Sebastian','Kowalczyk','1998-08-22',6, 1,'RW','right',570000);
insert into player values (null,'Adam','Fraczczak','1987-08-07',6,1 ,'ST','both',250000);

#Pracownicy Pogoń Szczecin
insert into employees values(null,'President','Jarosław','Mroczek ','1956-10-22',6);
insert into employees values(null,'Coach','Kosta','Runjaic','1971-06-04',6);

#Piłkarze Lechi Gdańsk
insert into player values (null,'Dusan','Kuciak', '1985-05-21',7,6 ,'GK','right',380000);
insert into player values (null,'Michal','Nalepa','1993-01-22',7,1 ,'CB','right',650000);
insert into player values (null,'Blazej','Augustyn', '1988-01-26',7,1 ,'CB','both',300000);
insert into player values (null,'Filip','Mladenovic','1991-08-15',7, 11,'LB','left',1200000);
insert into player values (null,'Karol','Fila','1998-06-13',7,1 ,'RB','right',1300000);
insert into player values (null,'Jaroslaw','Kubicki','1995-08-07',7,1 ,'CM','right',500000);
insert into player values (null,'Tomasz','Makowski', '1999-07-19',7,1 ,'CM','right',500000);
insert into player values (null,'Kenny','Saief',  '1993-12-17',7,26 ,'LM','left',700000);
insert into player values (null,'Patryk','Lipski','1994-06-12',7,1 ,'CAM','right',400000);
insert into player values (null,'Lukasz','Zwolinski','1993-02-24',7,1 ,'ST','right',800000);
insert into player values (null,'Jaroslav','Mihalik','1994-07-27',7,6 ,'LW','right',400000);

#Pracownicy Lechi Gdańsk
insert into employees values(null,'President','Adam','Mandziara','1967-10-27',7);
insert into employees values(null,'Coach','Piotr','Stokowiec',   '1972-05-25',7);

#Piłkarze Raków Częstochowa
insert into player values (null,'Michal','Gliwa', '1988-04-08',9,1 ,'GK','right',250000);
insert into player values (null,'Jaroslaw','Jach','1994-02-17',9,1 ,'CB','left',520000);
insert into player values (null,'Tomas','Petrasek','1992-03-02',9,5 ,'CB','right',400000);
insert into player values (null,'Arkadiusz','Kasperkiewicz','1994-09-29',9,1 ,'RB','right',150000);
insert into player values (null,'Fran','Tudor', '1995-09-27',9,20 ,'LB','right',400000);
insert into player values (null,'Igor','Sapala','1995-10-11',9,1 ,'CDM','right',200000);
insert into player values (null,'Ruslan','Babenko',   '1992-07-08',9,7 ,'CM','left',400000);
insert into player values (null,'Marko','Poletanovic','1993-07-20',9,11 ,'CM','right',400000);
insert into player values (null,'Daniel','Bartl','1989-07-05',9,5 ,'RM','right',200000);
insert into player values (null,'Patryk','Kun',  '1995-04-20',9,1 ,'LM','right',200000);
insert into player values (null,'Sebastian','Musiolik','1996-05-19',9, 1,'ST','right',300000);

#Pracownicy Raków Częstochowa
insert into employees values(null,'President','Wojciech','Cygan','1954-11-03',9);
insert into employees values(null,'Coach','Marek','Papszun','1974-08-08',9);

#Piłkarze Jagielonia Białystok
insert into player values (null,'Dejan','Iliev','1995-02-25',8,15 ,'GK','right',300000);
insert into player values (null,'Bogdan','Tiru','1994-03-15',8,16 ,'CB','right',1200000);
insert into player values (null,'Ivan','Runje', '1990-10-09',8,20 ,'CB','right',800000);
insert into player values (null,'Bödvar','Bödvarsson','1995-04-09',8,27 ,'LB','left',200000);
insert into player values (null,'Jakub','Wojcicki',   '1988-07-06',8,1 ,'RB','right',200000);
insert into player values (null,'Taras','Romanczuk','1991-11-14',8,1 ,'CDM','left',1000000);
insert into player values (null,'Martin','Pospísil','1991-06-26',8, 5,'CM','right',470000);
insert into player values (null,'Jesús','Imaz','1990-09-26',8,3 ,'CAM','right',1100000);
insert into player values (null,'Martin','Kostal','1996-02-23',8,6 ,'LW','right',350000);
insert into player values (null,'Tomas','Prikryl','1992-07-04',8,5 ,'RW','right',600000);
insert into player values (null,'Bartosz','Bida','2001-02-21',8,1 ,'ST','right',1300000);

#Pracownicy Jagielonia Białystok
insert into employees values(null,'President','Cezary','Kulesza','1962-06-22',8);
insert into employees values(null,'Coach','Ivaylo','Petev','1975-11-09',8);

#Piłkarze Wisła Płock
insert into player values (null,'Krzysztof','Kaminski','1990-11-26',10,1 ,'GK','right',550000);
insert into player values (null,'Damian','Michalski','1998-05-17',10,1 ,'CB','right',450000);
insert into player values (null,'Alan','Uryga','1994-02-19',10, 1,'CB','right',400000);
insert into player values (null,'Piotr','Tomasik','1987-09-30',10, 1,'LB','left',250000);
insert into player values (null,'Cezary','Stefanczyk','1984-02-21',10, 1,'RB','right',100000);
insert into player values (null,'Damian','Rasak','1996-02-08',10,1 ,'CDM','right',300000);
insert into player values (null,'Dominik','Furman','1992-07-06',10,1 ,'CM','right',1000000);
insert into player values (null,'Rafal','Wolski','1992-11-10',10,1 ,'CAM','right',300000);
insert into player values (null,'Torgil','Gjertsen','1992-03-12',10,23 ,'LW','right',400000);
insert into player values (null,'Cillian','Sheridan','1989-02-23',10,29 ,'ST','left',470000);
insert into player values (null,'Suad','Sahiti','1995-02-06',10,30 ,'RW','right',250000);

#Pracownicy Wisła Płock
insert into employees values(null,'President','Jacek','Kruszewski ','1969-10-12',10);
insert into employees values(null,'Coach','Radoslaw','Sobolewski','1976-12-13',10);

#Piłkarze KGHM Zagłebie Lublin
insert into player values (null,'Dominik','Hladun','1995-09-17',11,1 ,'GK','right',300000);
insert into player values (null,'Bartosz','Kopacz','1992-05-21',11,1 ,'CB','right',350000);
insert into player values (null,'Damian','Oko','1997-01-22',11,1 ,'CB','right',250000);
insert into player values (null,'Sasa','Balic','1990-01-29',11, 20,'LB','left',320000);
insert into player values (null,'Alan','Czerwinski','1993-02-02',11,1 ,'RB','right',400000);
insert into player values (null,'Evgeniy','Bashkirov','1991-07-06',11,28 ,'CM','both',700000);
insert into player values (null,'Lukasz','Poreba','2000-03-13',11,1 ,'CM','right',250000);
insert into player values (null,'Filip','Starzynski','1991-05-27',11,1 ,'CAM','right',670000);
insert into player values (null,'Sasa','Zivec', '1991-04-02',11,10 ,'LW','right',470000);
insert into player values (null,'Kamil','Mazek','1994-07-22',11,1 ,'RW','both',100000);
insert into player values (null,'Bartosz','Bialek','2001-11-11',11,1 ,'ST','right',350000);

#Pracownicy KGHM Zagłebie Lublin
insert into employees values(null,'President','‎Marcin','Lewiński','1972-12-30',11);
insert into employees values(null,'Coach','Martin','Sevela','1975-11-20',11);

#Piłkarze Gornik Zabrze
insert into player values (null,'Martin','Chudy','1989-04-23',12,6 ,'GK','right',350000);
insert into player values (null,'Przemyslaw','Wisniewski','1998-07-27',12,1 ,'CB','right',450000);
insert into player values (null,'Pawel','Bochniewicz','1996-01-30',12,1 ,'CB','right',450000);
insert into player values (null,'Erik','Janza','1993-06-21',12,9 ,'LB','left',500000);
insert into player values (null,'Stavros','Vasilantonopoulos','1992-01-28',12,25 ,'RB','right',300000);
insert into player values (null,'Roman','Prochazka','1989-03-14',12,6 ,'CDM','right',1400000);
insert into player values (null,'Alasana','Manneh', '1998-04-08',12,31 ,'CM','left',250000);
insert into player values (null,'Jesús','Jiménez','1993-11-05',12,3 ,'LW','right',650000);
insert into player values (null,'Erik','Jirka','1997-09-19',12,6 ,'RW','right',550000);
insert into player values (null,'Georgios','Giakoumakis','1994-12-09',12,25 ,'ST','right',300000);
insert into player values (null,'Igor','Angulo','1984-01-26',12,3 ,'ST','left',300000);

#Pracownicy Gornik Zabrze
insert into employees values(null,'President','Bartosz','Sarnowski ','1973-1-25',12);
insert into employees values(null,'Coach','Marcin','Brosz','1973-04-11',12);

#Piłkarze Wisła Kraków
insert into player values (null,'Mateusz','Lis', '1997-02-27',13, 1,'GK','right',250000);
insert into player values (null,'Lukas','Klemenz','1995-09-24',13,1 ,'CB','right',300000);
insert into player values (null,'Hebert','Santos','1991-05-23',13,13 ,'CB','left',300000);
insert into player values (null,'Michał','Sadlok','1989-06-29',13,1 ,'LB','left',400000);
insert into player values (null,'David','Niepsuj','1995-08-16',13,1 ,'RB','right',300000);
insert into player values (null,'Vullnet','Basha','1990-07-11',13,30 ,'CDM','right',480000);
insert into player values (null,'Georgi','Zhukov','1994-11-19',13,17 ,'CM','right',1200000);
insert into player values (null,'Víctor','Martínez','1997-06-10',13,3 ,'CAM','right',300000);
insert into player values (null,'Jakub','Blaszczykowski','1985-12-14',13,1 ,'RW','right',550000);
insert into player values (null,'Alon','Turgeman','1991-06-09',13,32 ,'ST','right',650000);
insert into player values (null,'Vukan','Savicevic','1994-01-29',13,11 ,'ST','right',400000);

#Pracownicy Wisła Kraków
insert into employees values(null,'President','Dawid','Błaszczykowski','1982-10-24',13);
insert into employees values(null,'Coach','Artur','Skowronek','1982-05-22',13);

#Piłkarze Korona Kielce
insert into player values (null,'Marek','Koziol','1988-06-01',14,1 ,'GK','right',150000);
insert into player values (null,'Adnan','Kovacevic','1993-09-09',14,33 ,'CB','both',800000);
insert into player values (null,'Themistoklis','Tzimopoulos','1985-11-20',14,25 ,'CB','left',100000);
insert into player values (null,'Daniel','Dziwniel','1992-08-19',14,1 ,'LB','left',200000);
insert into player values (null,'Michael','Gardawski','1990-09-25',14,1 ,'RB','right',300000);
insert into player values (null,'Jakub','Zubrowski','1992-03-21',14,1 ,'CDM','right',350000);
insert into player values (null,'Andrés','Lioi','1997-03-07',14,10 ,'RM','right',300000);
insert into player values (null,'Petteri','Forsell','1990-09-16',14,34 ,'CAM','both',450000);
insert into player values (null,'Matej','Pucko','1993-09-06',14,9 ,'LW','both',300000);
insert into player values (null,'Bojan','Cecaric','1993-09-10',14,11 ,'ST','right',300000);
insert into player values (null,'Jacek','Kielb','1988-01-10',14,1 ,'RW','right',100000);

#Pracownicy Korona Kielce
insert into employees values(null,'President','Krzysztof','Zając','1958-02-22',14);
insert into employees values(null,'Coach','Maciej','Bartoszek','1977-04-12',14);

#Piłkarze Arka Gdynia
insert into player values (null,'Pavels','Steinbors', '1985-09-21',15,35 ,'GK','right',250000);
insert into player values (null,'Douglas','Bergqvist','1993-03-29',15,36 ,'CB','right',470000);
insert into player values (null,'Frederik','Helstrup','1993-03-16',15,14 ,'CB','both',300000);
insert into player values (null,'Adam','Marciniak','1988-09-28',15,1 ,'LB','left',300000);
insert into player values (null,'Damian','Zbozien','1989-04-25',15,1 ,'RB','right',300000);
insert into player values (null,'Marko','Vejinović','1990-02-03',15,11 ,'CDM','right',900000);
insert into player values (null,'Michal','Nalepa','1995-03-24',15,1 ,'CM','right',400000);
insert into player values (null,'Nemanja','Mihajlovic','1996-01-19',15,11 ,'LW','right',500000);
insert into player values (null,'Davit','Skhirtladze','1993-03-16',15,37 ,'ST','right',300000);
insert into player values (null,'Fabian','Serrarens','1991-02-09',15,18 ,'ST','right',250000);
insert into player values (null,'Nabil','Aankour','1993-08-09',15,8 ,'CAM','right',200000);

#Pracownicy Arka Gdynia
insert into employees values(null,'President','Wojciech','Pertkiewicz','1976-12-02',15);
insert into employees values(null,'Coach','Ireneusz','Mamrot','1970-12-13',15);

#Piłkarze łks łódź
insert into player values (null,'Arkadiusz','Malarz','1980-06-19',16,1 ,'GK','right',100000);
insert into player values (null,'Carlos','Gracia','1993-04-15',16,3 ,'CB','right',400000);
insert into player values (null,'Jan','Sobocinski','1999-03-20',16,1 ,'CB','left',300000);
insert into player values (null,'Tadej','Vidmajer','1992-03-10',16,9 ,'LB','left',300000);
insert into player values (null,'Jan','Grzesik','1994-10-21',16,1 ,'RB','right',200000);
insert into player values (null,'Michal','Trabka','1997-04-22',16,1 ,'CAM','right',150000);
insert into player values (null,'José','López','1992-04-17',16, 3,'LW','left',250000);
insert into player values (null,'Samuel','Corral','1992-04-03',16,3 ,'ST','right',250000);
insert into player values (null,'Lukasz','Sekulski','1990-11-03',16,1 ,'ST','right',250000);
insert into player values (null,'Dragoljub','Srnic','1992-01-12',16,11 ,'CM','right',200000);
insert into player values (null,'Maciej','Wolski','1997-03-29',16,1 ,'CDM','right',250000);

#Pracownicy łks łódź
insert into employees values(null,'President','Tomasz','Salski','1975-02-22',16);
insert into employees values(null,'Coach','Wojciech','Stawowy','1966-01-28',16);

select * FROM club;

#Piłkarze Bayern Monachium
insert into player values (null,'Manuel','Neuer','1986-03-27',17, 2,'GK','right',14000000);
insert into player values (null,'Lucas','Hernández','1996-02-14',17,8 ,'CB','left',56000000);
insert into player values (null,'Niklas','Süle','1995-09-03',17,2 ,'CB','right',48000000);
insert into player values (null,'David','Alaba','1992-06-24',17,24 ,'LB','left',52000000);
insert into player values (null,'Benjamin','Pavard','1996-03-28',17,8 ,'RB','right',28000000);
insert into player values (null,'Joshua','Kimmich','1995-02-08',17,2 ,'CDM','right',64000000);
insert into player values (null,'Thiago','Alcántara','1991-04-11',17,3 ,'CM','right',48000000);
insert into player values (null,'Leon','Goretzka','1995-02-06',17,2 ,'CM','right',40000000);
insert into player values (null,'Philippe','Coutinho','1992-06-12',17, 13,'CAM','right',56000000);
insert into player values (null,'Kingsley','Coman','1996-06-13',17,8 ,'LW','right',40000000);
insert into player values (null,'Serge','Gnabry','1995-07-14',17,2 ,'RW','right',72000000);
insert into player values (null,'Robert','Lewandowski','1988-08-21',17,1 ,'ST','right',56000000);

#Pracownicy
insert into employees values(null,'President','Herbert','Hainer','1954-07-03',17);
insert into employees values(null,'Coach','Hans','Flick','1965-02-24',17);

#Piłkarze Borussia Dortmund
insert into player values (null,'Roman','Bürki','1990-11-14',18,38 ,'GK','right',11000000);
insert into player values (null,'Manuel','Akanji','1995-07-19',18,38 ,'CB','right',20000000);
insert into player values (null,'Mats','Hummels','1988-12-16',18,2 ,'CB','right',24000000);
insert into player values (null,'Nico','Schulz','1993-04-01',18,2 ,'LB','right',16000000);
insert into player values (null,'Achraf','Hakimi','1998-11-04',18,3 ,'RB','right',54000000);
insert into player values (null,'Emre','Can','1994-01-12',18,3 ,'CDM','right',24000000);
insert into player values (null,'Julian','Brandt','1996-05-02',18,3 ,'CM','right',40000000);
insert into player values (null,'Erling','Haaland','2000-07-21',18,23 ,'ST','left',72000000);
insert into player values (null,'Marco','Reus','1989-05-31',18,3 ,'CAM','right',32000000);
insert into player values (null,'Jadon','Sancho','2000-03-25',18,15 ,'RW','right',117000000);
insert into player values (null,'Thorgan','Hazard','1993-03-29',18, 17,'LW','right',32000000);

#Pracownicy Borussia Dortmund
insert into employees values(null,'President','Reinhard','Rauball','19-12-25',18);
insert into employees values(null,'Coach','Lucien','Favre','1957-11-02',18);

#Piłkarze RB Lipsk
insert into player values (null,'Péter','Gulácsi','1990-05-06',19,19 ,'GK','right',9500000);
insert into player values (null,'Dayot','Upamecano','1998-10-27',19,8 ,'CB','right',45000000);
insert into player values (null,'Ibrahima','Konaté','1999-05-25',19,8 ,'CB','right',40000000);
insert into player values (null,'José','Ángel','1997-01-04',19,3 ,'LB','left',17000000);
insert into player values (null,'Nordi','Mukiele','1997-11-01',19,8 ,'RB','right',20000000);
insert into player values (null,'Tyler','Adams','1999-02-14',19,26 ,'CDM','right',11000000);
insert into player values (null,'Konrad','Laimer','1997-05-27',19,24 ,'CM','right',24000000);
insert into player values (null,'Christopher','Nkunku','1997-11-14',19, 8,'CAM','right',28000000);
insert into player values (null,'Marcel','Sabitzer','1994-03-17',19,24 ,'RW','right',32000000);
insert into player values (null,'Timo','Werner','1996-03-06',19,2 ,'ST','right',64000000);
insert into player values (null,'Ademola','Lookman','1997-10-20',19,15 ,'LW','right',13000000);

#Pracownicy RB Lipsk
insert into employees values(null,'President','Oliver','Mintzlaff','1975-08-19',19);
insert into employees values(null,'Coach','Julian','Nagelsmann','1987-07-23',19);

#Piłkarze Borussia Mönchengladbach
insert into player values (null,'Yann','Sommer','1988-12-17',20, 38,'GK','right',10000000);
insert into player values (null,'Matthias','Ginter','1994-01-19',20,2 ,'CB','right',28000000);
insert into player values (null,'Nico','Elvedi','1996-09-30',20,38 ,'CB','right',28000000);
insert into player values (null,'Ramy','Bensebaini','1995-04-16',20,39 ,'LB','left',9500000);
insert into player values (null,'Stefan','Lainer','1992-08-27',20,24 ,'RB','right',14000000);
insert into player values (null,'Denis','Zakaria','1996-11-20',20,38 ,'CDM','right',36000000);
insert into player values (null,'Florian','Neuhaus','1997-03-16',20,2 ,'CM','right',17000000);
insert into player values (null,'Marcus','Thuram','1997-08-06',20, 8,'ST','right',22000000);
insert into player values (null,'Alassane','Plea','1993-03-10',20, 8,'ST','right',24000000);
insert into player values (null,'Lars','Stindl','1988-08-06',20,2 ,'CAM','right',6000000);
insert into player values (null,'Patrick','Herrmann','1991-02-12',20, 2,'RW','right',5000000);

#Pracownicy Borussia Mönchengladbach
insert into employees values(null,'President','Rolf','Königs','1978-08-19',20);
insert into employees values(null,'Coach','Marco','Rose','1976-09-11',20);

#Piłkarze Bayer 04 Leverkusen
insert into player values (null,'Lukas','Hradecky','1989-11-24',21,5 ,'GK','right',8000000);
insert into player values (null,'Jonathan','Tah','1996-02-11',21,2 ,'GK','right',29000000);
insert into player values (null,'Edmond','Tapsoba','1999-02-02',21, 40,'CB','right',18000000);
insert into player values (null,'Wendell','Borges','1993-08-20',21, 13,'LB','left',13000000);
insert into player values (null,'Mitchell','Weiser','1994-04-21',21,2 ,'RB','right',8000000);
insert into player values (null,'Kerem','Demirbay','1993-07-03',21,2 ,'CDM','left',24000000);
insert into player values (null,'Exequiel','Palacios','1998-10-05',21,10 ,'CM','right',22000000);
insert into player values (null,'Kai','Havertz','1999-06-11',21,2 ,'CAM','left',81000000);
insert into player values (null,'Leon','Bailey','1997-08-09',21,41 ,'LW','left',29000000);
insert into player values (null,'Kevin','Volland','1992-07-30',21, 2,'ST','left',28000000);
insert into player values (null,'Moussa','Diaby','1999-07-07',21,8 ,'LW','left',27000000);

#Pracownicy Bayer 04 Leverkusen
insert into employees values(null,'President','Fernando','Carro','1964-12-27',21);
insert into employees values(null,'Coach','Peter','Bosz','1963-11-21',21);

#Piłkarze VfL Wolfsburg
insert into player values (null,'Josuha','Guilavogui','1990-09-19',22,8 ,'CDM','right',11000000);
insert into player values (null,'Koen','Casteels','1992-06-25',22,17 ,'GK','left',10000000);
insert into player values (null,'John','Brooks','1993-01-28',22, 2,'CB','left',12000000);
insert into player values (null,'Marin','Pongracic','1997-09-11',22,20 ,'CB','right',7000000);
insert into player values (null,'Jérôme','Roussillon','1993-01-06',22,8 ,'LB','right',16000000);
insert into player values (null,'William','Furtado','1995-04-03',22,13 ,'RB','right',11000000);
insert into player values (null,'Daniel','Ginczek','1991-04-13',22,2 ,'ST','right',9000000);
insert into player values (null,'Wout','Weghorst','1992-08-07',22,18 ,'ST','right',21000000);
insert into player values (null,'Josip','Brekalo','1998-06-23',22,20 ,'LW','right',13000000);
insert into player values (null,'Maximilian','Arnold','1994-05-27',22,2 ,'CM','left',14000000);
insert into player values (null,'Renato','Steffen','1991-11-03',22,38 ,'RW','left',4000000);

#Pracownicy VfL Wolfsburg
insert into employees values(null,'President','Tim','Schumacher','1974-02-17',22);
insert into employees values(null,'Coach','Oliver','Glasner','1974-08-28',22);

#Piłkarze SC Freiburg
insert into player values (null,'Alexander','Schwolow','1992-06-02',23,2 ,'GK','right',7000000);
insert into player values (null,'Robin','Koch','1996-07-17',23,2 ,'CB','right',14000000);
insert into player values (null,'Philipp','Lienhart','1996-07-11',23,24 ,'CB','right',9000000);
insert into player values (null,'Christian','Günter','1993-02-28',23,2 ,'LB','left',9000000);
insert into player values (null,'Jonathan','Schmid','1990-06-22',23,8 ,'RB','right',4000000);
insert into player values (null,'Nicolas','Höfler','1990-03-09',23,2 ,'CDM','right',3000000);
insert into player values (null,'Chang','Kwon','1994-06-30',23,42 ,'RW','left',3000000);
insert into player values (null,'Luca','Waldschmidt','1996-05-19',23,2 ,'ST','left',16000000);
insert into player values (null,'Nils','Petersen','1988-12-06',23,2 ,'ST','right',6000000);
insert into player values (null,'Roland','Sallai','1997-05-22',23,19 ,'LW','both',3000000);
insert into player values (null,'Janik','Haberer','1994-04-02',23, 2,'CM','right',8000000);

#Pracownicy SC Freiburg
insert into employees values(null,'President','Fritz','Keller','1942-08-21',23);
insert into employees values(null,'Coach','Christian','Streich','1965-06-11',23);

#Piłkarze TSG 1899 Hoffenheim
insert into player values (null,'Oliver','Baumann','1990-06-02',24,2 ,'GK','right',5000000);
insert into player values (null,'Stefan','Posch','1997-05-14',24,24 ,'CB','right',11000000);
insert into player values (null,'Benjamin','Hübner','1989-07-04',24,2 ,'CB','left',5000000);
insert into player values (null,'Robert','Skov','1996-05-20',24,14 ,'LB','left',10000000);
insert into player values (null,'Pavel','Kaderabek','1992-04-25',24,5 ,'RB','right',13000000);
insert into player values (null,'Diadie','Samassékou','1996-01-11',24, 43,'CDM','right',12000000);
insert into player values (null,'Florian','Grillitsch','1995-08-07',24,24 ,'CM','right',20000000);
insert into player values (null,'Dennis','Geiger','1998-06-10',24,2 ,'CM','right',11000000);
insert into player values (null,'Jacob','Larsen','1998-09-19',24,14 ,'LW','right',11000000);
insert into player values (null,'Andrej','Kramaric','1991-06-19',24,20 ,'ST','right',30000000);
insert into player values (null,'Ishak','Belfodil','1992-01-12',24,8 ,'ST','right',12000000);

#Pracownicy TSG 1899 Hoffenheim
insert into employees values(null,'President','Peter','Hofmann','1959-01-14',24);
insert into employees values(null,'Coach','Alfred','Schreuder','1972-11-02',24);

#Piłkarze Schalke 04 Gelsenkirchen
insert into player values (null,'Juan','Miranda','2000-01-19',25, 3,'LB','left',4000000);
insert into player values (null,'Jonjoe','Kenny','1997-03-15',25,15 ,'RB','right',10000000);
insert into player values (null,'Omar','Mascarell','1993-02-02',25,3 ,'CDM','right',11000000);
insert into player values (null,'Weston','McKennie','1998-08-28',25,26 ,'CM','right',20000000);
insert into player values (null,'Suat','Serdar','1997-04-11',25,2 ,'CM','right',20000000);
insert into player values (null,'Alexander','Nübel','1996-09-30',25,2 ,'GK','right',10000000);
insert into player values (null,'Ozan','Kabak','2000-03-25',25,44 ,'CB','right',29000000);
insert into player values (null,'Matija','Nastasic','1993-03-28',25, 11,'CB','left',13000000);
insert into player values (null,'Amine','Harit','1997-06-18',25,8 ,'CAM','right',24000000);
insert into player values (null,'Benito','Raman','1994-11-07',25,17 ,'LW','right',8000000);
insert into player values (null,'Rabbi','Matondo','2000-09-09',25,15 ,'ST','right',8000000);

#Pracownicy Schalke 04 Gelsenkirchen
insert into employees values(null,'President','Josef','Schnusenberg','1941-02-16',25);
insert into employees values(null,'Coach','David','Wagner','1971-10-19',25);

#Piłkarze FC Koeln
insert into player values (null,'Timo','Horn','1993-05-12',26,2 ,'GK','right',4000000);
insert into player values (null,'Sebastiaan','Bornauw','1999-03-22',26, 17,'CB','right',11000000);
insert into player values (null,'Jorge','Meré','1997-04-17',26,3 ,'CB','right',5000000);
insert into player values (null,'Noah','Katterbach','2001-04-13',26,2 ,'LB','left',6000000);
insert into player values (null,'Kingsley','Ehizibue','1995-05-25',26, 2,'RB','right',2000000);
insert into player values (null,'Jonas','Hector','1990-05-27',26,2 ,'CDM','left',7000000);
insert into player values (null,'Marcel','Risse','1989-12-17',26,2 ,'RM','right',1000000);
insert into player values (null,'Dominick','Drexler','1990-05-26',26,2 ,'CAM','right',3000000);
insert into player values (null,'Jan','Thielmann','2002-05-26',26,2 ,'RW','right',2000000);
insert into player values (null,'Mark','Uth','1991-08-24',26,2 ,'ST','right',6000000);
insert into player values (null,'Jhon','Córdoba','1993-05-11',26, 45,'ST','right',10000000);

#Pracownicy FC Koeln
insert into employees values(null,'President','Alexander','Wehrle','1975-02-11',26);
insert into employees values(null,'Coach','Markus','Gisdol','1969-08-17',26);

#Piłkarze Union Berlin
insert into player values (null,'Rafal','Gikiewicz','1987-10-26',27,1 ,'GK','right',1000000);
insert into player values (null,'Marvin','Friedrich','1995-12-13',27,2 ,'CB','right',3000000);
insert into player values (null,'Keven','Schlotterbeck','1997-04-28',27,2 ,'CB','left',3000000);
insert into player values (null,'Christopher','Lenz','1994-09-22',27,2 ,'LB','right',2000000);
insert into player values (null,'Christopher','Trimmel','1987-02-24',27,24 ,'RB','right',500000);
insert into player values (null,'Manuel','Schmiedebach','1988-12-05',27,2 ,'CDM','right',700000);
insert into player values (null,'Robert','Andrich','1994-09-22',27,2 ,'CM','right',2000000);
insert into player values (null,'Grischa','Prömel','1995-01-09',27,2 ,'CM','both',2000000);
insert into player values (null,'Yunus','Malli','1992-02-24',27,2 ,'CAM','right',3000000);
insert into player values (null,'Marius','Bülter','1993-03-29',27,2 ,'LW','right',2400000);
insert into player values (null,'Sebastian','Andersson','1991-07-15',27,36 ,'ST','right',5000000);

#Pracownicy Union Berlin
insert into employees values(null,'President','Dirk','Zingler','1964-08-23',27);
insert into employees values(null,'Coach','Urs','Fischer','1966-02-20',27);

#Piłkarze Eintracht Frankfurt
insert into player values (null,'Kevin','Trapp','1990-07-08',28,2 ,'GK','right',8000000);
insert into player values (null,'Evan','Dicka','1999-08-20',28,8 ,'CB','right',23000000);
insert into player values (null,'Martin','Hinteregger','1992-09-07',28,24 ,'CB','left',15000000);
insert into player values (null,'Danny','da Costa','1993-07-13',28,2 ,'RB','right',8000000);
insert into player values (null,'Erik','Durm','1992-05-12',28,2 ,'LB','right',2000000);
insert into player values (null,'Stefan','Ilsanker','1989-05-18',28,24 ,'CDM','right',2000000);
insert into player values (null,'Djibril','Sow','1997-02-06',28,38 ,'CM','right',10000000);
insert into player values (null,'Filip','Kostic','1992-11-01',28, 11,'LW','right',32000000);
insert into player values (null,'André','Silva','1995-11-06',28,12 ,'ST','right',16000000);
insert into player values (null,'Gonçalo','Paciência','1994-08-01',28,12 ,'ST','right',12000000);
insert into player values (null,'Mijat','Gacinovic','1995-02-08',28,11 ,'CAM','right',7000000);

#Pracownicy Eintracht Frankfurt
insert into employees values(null,'President','Peter','Fischer','1954-02-25',28);
insert into employees values(null,'Coach','Adi','Hütter','1970-02-11',28);

#Piłkarze Hertha Berlin
insert into player values (null,'Rune','Jarstein','1984-09-29',29,23 ,'GK','right',800000);
insert into player values (null,'Niklas','Stark','1995-04-14',29,2 ,'CB','right',16000000);
insert into player values (null,'Karim','Rekik','1994-12-02',29,18 ,'CB','left',10000000);
insert into player values (null,'Maximilian','Mittelstädt','1997-03-18',29,2 ,'LB','left',11000000);
insert into player values (null,'Lukas','Klünter','1996-05-26',29,2 ,'RB','right',4000000);
insert into player values (null,'Arne','Maier','1999-01-08',29,2 ,'CDM','right',16000000);
insert into player values (null,'Marko','Grujic','1996-04-13',29,11 ,'CM','right',15000000);
insert into player values (null,'Javairô','Dilrosun','1998-06-22',29,18 ,'LW','right',15000000);
insert into player values (null,'Dodi','Lukebakio','1997-09-24',29,17 ,'RW','right',17000000);
insert into player values (null,'Krzysztof','Piatek','1995-07-01',29,1 ,'ST','right',21000000);
insert into player values (null,'Matheus','Cunha','1999-05-27',29,13 ,'ST','right',13000000);

#Pracownicy Hertha Berlin
insert into employees values(null,'President','Werner','Gegenbauer','1950-05-28',29);
insert into employees values(null,'Coach','Bruno','Labbadia','1966-02-08',29);

#Piłkarze FC Augsburg
insert into player values (null,'Tomas','Koubek','1992-08-26',30,5 ,'GK','right',4000000);
insert into player values (null,'Jeffrey','Gouweleeuw','1991-07-10',30,18 ,'CB','right',10000000);
insert into player values (null,'Tin','Jedvaj','1995-11-28',30,20 ,'CB','right',7000000);
insert into player values (null,'Philipp','Max','1993-09-30',30,2 ,'LB','right',14000000);
insert into player values (null,'Raphael','Framberger','1995-09-06',30,2 ,'RB','right',1000000);
insert into player values (null,'Rani','Khedira','1994-01-27',30,2 ,'CDM','right',8000000);
insert into player values (null,'Eduard','Löwen','1997-01-28',30,2 ,'CM','right',6000000);
insert into player values (null,'Ruben','Vargas','1998-08-05',30,38 ,'LW','right',9000000);
insert into player values (null,'Marco','Richter','1997-11-24',30,2 ,'RW','right',8000000);
insert into player values (null,'Florian','Niederlechner','1990-10-24',30, 2,'ST','right',8000000);
insert into player values (null,'Sergio','Córdova','1997-08-09',30,46 ,'ST','right',2000000);

#Pracownicy FC Augsburg
insert into employees values(null,'President','Klaus','Hofmann','1967-10-21',30);
insert into employees values(null,'Coach','Heiko','Herrlich','1971-12-03',30);

#Piłkarze FSV Mainz
insert into player values (null,'Robin','Zentner','1994-10-28',31, 2,'GK','right',3000000);
insert into player values (null,'Moussa','Niakhaté','1996-03-08',31,8,'CB','right',11000000);
insert into player values (null,'Jeremiah','Juste','1996-10-19',31,18 ,'CB','right',7000000);
insert into player values (null,'Aarón','Martín','1997-04-22',31,3 ,'LB','left',11000000);
insert into player values (null,'Ronaël','Pierre-Gabriel','1998-06-13',31,8 ,'RB','right',4000000);
insert into player values (null,'Pierre','Malong','1995-07-26',31, 47,'CM','right',8000000);
insert into player values (null,'Edimilson','Fernandes','1996-04-15',31,38 ,'Cm','right',6000000);
insert into player values (null,'Levin','Öztunali','1996-03-15',31,2 ,'RM','right',3000000);
insert into player values (null,'Jean','Boëtius','1994-03-22',31, 18,'CAM','right',5000000);
insert into player values (null,'Jean','Mateta','1997-06-28',31,8 ,'ST','right',18000000);
insert into player values (null,'Robin','Quaison','1993-10-09',31,36 ,'ST','right',11000000);

#Pracownicy FSV Mainz
insert into employees values(null,'President','Harald','Strutz','1950-12-22',31);
insert into employees values(null,'Coach','Achim','Beierlorzer','1967-11-20',31);

#Piłkarze Fortuna Duesseldorf
insert into player values (null,'Zack','Steffen','1995-04-02',32,26 ,'GK','right',6000000);
insert into player values (null,'Kaan','Ayhan','1994-11-10',32, 2,'CB','right',7000000);
insert into player values (null,'Kasim','Adams','1995-06-22',32,48 ,'CB','right',3000000);
insert into player values (null,'Niko','Gießelmann','1991-09-26',32,2 ,'LB','left',3000000);
insert into player values (null,'Matthias','Zimmermann','1992-06-16',32, 2,'RB','right',4000000);
insert into player values (null,'Marcel','Sobottka','1994-04-25',32,2 ,'CDM','right',3000000);
insert into player values (null,'Valon','Berisha','1993-02-07',32,23 ,'CM','right',4000000);
insert into player values (null,'Alfredo','Morales','1990-05-12',32,2 ,'CM','right',3000000);
insert into player values (null,'Kevin','Stöger','1993-08-27',32,24 ,'CAM','left',4000000);
insert into player values (null,'Erik','Thommy','1994-08-20',32,2 ,'LM','right',5000000);
insert into player values (null,'Dawid','Kownacki','1997-03-14',32,1 ,'ST','right',5000000);

#Pracownicy Fortuna Duesseldorf
insert into employees values(null,'President','Robert','Schäfer','1967-03-23',32);
insert into employees values(null,'Coach','Uwe','Rösler','1968-11-15',32);
#Piłkarze Werder Brema
insert into player values (null,'Jiri','Pavlenka','1992-04-14',33, 5,'GK','right',7000000);
insert into player values (null,'Kevin','Vogt','1991-09-23',33,2 ,'CB','right',8000000);
insert into player values (null,'Milos','Veljkovic','1995-09-26',33,11 ,'CB','both',5000000);
insert into player values (null,'Ludwig','Augustinsson','1994-04-21',33, 36,'LB','left',10000000);
insert into player values (null,'Theodo','Selassie','1986-12-24',33,5 ,'RB','right',2000000);
insert into player values (null,'Philipp','Bargfrede','1989-03-03',33,2 ,'CDM','right',2000000);
insert into player values (null,'Maximilian','Eggestein','1996-12-08',33,2 ,'CM','right',13000000);
insert into player values (null,'Leonardo','Bittencourt','1993-12-19',33,2 ,'CAM','right',5000000);
insert into player values (null,'Johannes','Eggestein','1998-05-08',33,2 ,'RW','right',5000000);
insert into player values (null,'Davie','Selke','1995-01-20',33,2 ,'ST','right',8000000);
insert into player values (null,'Josh','Sargent','2000-02-20',33,26 ,'ST','right',7000000);

#Pracownicy Werder Brema
insert into employees values(null,'President','Klaus','Filbry','1967-01-09',33);
insert into employees values(null,'Coach','Florian','Kohfeldt','1982-10-05',33);

#Piłkarze SC Paderborn
insert into player values (null,'Leopold','Zingerle','1994-04-10',34,2 ,'GK','right',1000000);
insert into player values (null,'Sebastian','Schonlau','1994-08-05',34,2 ,'CB','right',2000000);
insert into player values (null,'Luca','Kilian','1999-09-01',34,2 ,'CB','right',1000000);
insert into player values (null,'Jamilu','Collins','1994-08-05',34, 49,'LB','left',3000000);
insert into player values (null,'Mohamed','Dräger','1996-06-25',34,2 ,'RB','right',3000000);
insert into player values (null,'Klaus','Gjasula','1989-12-14',34,2 ,'CDM','both',700000);
insert into player values (null,'Sebastian','Vasiliadis','1997-10-04',34, 2,'CM','right',3000000);
insert into player values (null,'Abdelhamid','Sabiri','1996-11-28',34, 2,'CAM','right',2000000);
insert into player values (null,'Gerrit','Holtmann','1995-03-25',34,2 ,'LW','left',1000000);
insert into player values (null,'Streli','Mamba','1994-06-17',34,2 ,'ST','right',1600000);
insert into player values (null,'Mamba','Pröger','1992-05-15',34,2 ,'RW','right',1000000);

#Pracownicy SC Paderborn
insert into employees values(null,'President','Elmar','Volkmann','1946-08-23',34);
insert into employees values(null,'Coach','Steffen','Baumgart','1972-01-05',34);

select  SUM(market_value) from football_leagues.player where clubID=2;

select SUM(market_value) from football_leagues.player AS club_value;

select  * FROM club;
#Liga hiszpańska piłkarze

#Piłkarze FC Barcelona
insert into player values (null,'Marc-André','Stegen','1992-04-30',35,2,'GK','right',72000000);
insert into player values (null,'Clément','Lenglet','1995-06-17',35,8 ,'CB','right',48000000);
insert into player values (null,'Samuel','Umtiti','1993-11-14',35, 8,'CB','left',32000000);
insert into player values (null,'Jordi','Alba','1989-03-21',35, 3,'LB','left',40000000);
insert into player values (null,'Sergi','Roberto','1992-02-07',35,3,'RB','right',40000000);
insert into player values (null,'Sergio','Busquets','1988-11-16',35,8,'CDM','right',28000000);
insert into player values (null,'Frenkie','de Jong','1997-05-12',35,18 ,'CM','right',72000000);
insert into player values (null,'Antoine','Griezmann','1991-03-21',35, 8,'CAM','right',96000000);
insert into player values (null,'Lionel','Messi','1987-06-24',35, 10,'RW','left',112000000);
insert into player values (null,'Luis','Suárez','1987-01-24',35,21 ,'ST','right',28000000);
insert into player values (null,'Ousmane','Dembélé','1997-05-15',35,8,'LW','right',56000000);

#Pracownicy FC Barcelona
insert into employees values(null,'President','Josep','Bartomeu','1963-02-06',35);
insert into employees values(null,'Coach','Quique','Setién','1958-09-27',35);

#Piłkarze Real Madryt
insert into player values (null,'Thibaut','Courtois','1992-05-11',36,17 ,'GK','left',48000000);
insert into player values (null,'Raphaël','Varane','1993-04-25',36,8 ,'CB','right',64000000);
insert into player values (null,'Éder','Militão','1998-01-18',36,13 ,'CB','right',36000000);
insert into player values (null,'Ferland','Mendy','1995-06-08',36,8 ,'LB','left',32000000);
insert into player values (null,'Daniel','Carvajal','1992-01-11',36,3 ,'RB','right',40000000);
insert into player values (null,'Carlos','Casemiro','1992-02-23',36,13 ,'CDM','right',64000000);
insert into player values (null,'Federico','Valverde','1998-07-22',36,3 ,'CM','right',54000000);
insert into player values (null,'Francisco','Isco','1992-04-21',36, 3,'CAM','right',40000000);
insert into player values (null,'Eden','Hazard','1991-01-07',36, 17,'RW','right',80000000);
insert into player values (null,'Gareth','Bale','1989-07-16',36,50 ,'LW','left',32000000);
insert into player values (null,'Karim','Benzema','1987-12-19',36,8 ,'ST','right',32000000);

#Pracownicy Real Madryt
insert into employees values(null,'President','Florentino','Pérez','1947-03-08',36);
insert into employees values(null,'Coach','Zinédine','Zidane','1972-06-23',36);

#Piłkarze Sevilla FC
insert into player values (null,'Tomáš','Vaclík','1989-03-29',37,5 ,'GK','right',15000000);
insert into player values (null,'Diego','Carlos','1993-03-15',37,13,'CB','right',32000000);
insert into player values (null,'Jules','Koundé','1998-11-12',37,8,'CB','right',22000000);
insert into player values (null,'Sergio','Reguilón','1996-12-16',37,3,'LB','left',20000000);
insert into player values (null,'Jesús','Navas','1985-11-21',37,3 ,'RB','right',3000000);
insert into player values (null,'Fernando','Reges','1987-07-25',37,13 ,'CDM','right',8000000);
insert into player values (null,'Joan','Jordán','1994-07-06',37,3 ,'CM','right',15000000);
insert into player values (null,'Franco','Vázquez','1989-02-22',37, 10,'CAM','right',10000000);
insert into player values (null,'Lucas','Ocampos','1994-07-11',37, 10,'RW','both',32000000);
insert into player values (null,'Youssef','En-Nesyri','1997-06-01',37,51 ,'ST','both',12000000);
insert into player values (null,'Rony','Lopes','1995-12-28',37, 12,'LW','left',10000000);

#Pracownicy Sevilla FC
insert into employees values(null,'President','José ','Carmona','1958-06-20',37);
insert into employees values(null,'Coach','Julen','Lopetegui','1966-09-12',37);

#Piłkarze Real Sociedad
insert into player values (null,'Álex','Remiro','1995-03-24',38,3 ,'GK','right',12000000);
insert into player values (null,'Diego','Llorente','1993-08-16',38,3 ,'CB','right',20000000);
insert into player values (null,'Robin','Normand','1996-11-11',38,8 ,'CB','right',12000000);
insert into player values (null,'Aihen','Muñoz','1997-08-16',38,3 ,'LB','left',4000000);
insert into player values (null,'Joseba','Zaldua','1992-06-24',38,3 ,'RB','right',12000000);
insert into player values (null,'Igor','Zubeldia','1997-03-30',38, 3,'CDM','right',24000000);
insert into player values (null,'Mikel','Merino','1996-06-22',38,3 ,'CM','right',24000000);
insert into player values (null,'Martin','Ödegaard','1998-12-17',38, 23,'CAM','left',48000000);
insert into player values (null,'Mikel','Oyarzabal','1997-04-21',38,3 ,'RW','right',48000000);
insert into player values (null,'Cristian','Manzanera','1992-05-21',38,3 ,'ST','right',16000000);
insert into player values (null,'Willian','José','1991-11-23',38,13 ,'LW','right',24000000);

#Pracownicy Real Sociedad
insert into employees values(null,'President','Jokin','Aperribay','1966-05-27',38);
insert into employees values(null,'Coach','Imanol','Alguacil','1971-07-04',38);

#Piłkarze Getafe CF
insert into player values (null,'David','Soria','1991-12-31',39, 3,'GK','right',25000000);
insert into player values (null,'Erick','Cabaco','1995-04-19',39,21 ,'CB','right',4000000);
insert into player values (null,'Vitorino','Antunes','1987-04-01',39,12 ,'CB','left',2000000);
insert into player values (null,'Allan','Nyom','1988-05-10',39,8 ,'LB','right',3000000);
insert into player values (null,'David','Timor','1989-10-17',39,3 ,'RB','left',2000000);
insert into player values (null,'Mauro','Arambarri','1995-09-30',39,21 ,'CDM','right',20000000);
insert into player values (null,'Nemanja','Maksimovic','1995-01-26',39,11 ,'CM','right',20000000);
insert into player values (null,'Marc','Cucurella','1998-07-22',39,3 ,'CAM','left',18000000);
insert into player values (null,'David','Salgueiro','1994-07-06',39, 3,'RW','right',5000000);
insert into player values (null,'Jaime','Mata','1988-10-24',39, 4,'ST','right',8000000);
insert into player values (null,'Ángel','Rodríguez','1987-04-26',39,3 ,'LW','right',6000000);

#Pracownicy Getafe CF
insert into employees values(null,'President','‎Ángel','Sánchez','1952-01-30',39);
insert into employees values(null,'Coach','Pepe','Bordalás','1964-03-05',39);

#Piłkarze Atletico Madryt
insert into player values (null,'Jan','Oblak','1993-01-07',40,9 ,'GK','right',80000000);
insert into player values (null,'José','Giménez','1995-01-20',40,21 ,'CB','right',56000000);
insert into player values (null,'Felipe','Monteiro','1989-05-16',40,13 ,'CB','right',26000000);
insert into player values (null,'Renan','Lodi','1998-04-08',40,13 ,'LB','left',32000000);
insert into player values (null,'Kieran','Trippier','1990-09-19',40,15 ,'RB','right',28000000);
insert into player values (null,'Thomas','Partey','1993-06-13',40,48,'CDM','right',40000000);
insert into player values (null,'Saúl','Ñíguez','1994-11-21',40,3 ,'CM','left',72000000);
insert into player values (null,'João','Félix','1999-11-10',40,12 ,'CAM','right',87000000);
insert into player values (null,'Ángel','Correa','1995-03-09',40,3 ,'RW','right',32000000);
insert into player values (null,'Diego','Costa','1988-10-07',40,13 ,'ST','right',15000000);
insert into player values (null,'Yannick','Carrasco','1993-09-04',40,17 ,'LW','both',23000000);

#Pracownicy Atletico Madryt
insert into employees values(null,'President','Enrique','Cerezo','1948-02-27',40);
insert into employees values(null,'Coach','Diego','Simeone','1970-04-28',40);

#Piłkarze Valencia CF
insert into player values (null,'Jasper','Cillessen','1989-04-22',41,18 ,'GK','right',15000000);
insert into player values (null,'Gabriel','Paulista','1990-11-26',41,13 ,'CB','right',18000000);
insert into player values (null,'Mouctar','Diakhaby','1996-12-19',41,8 ,'CB','right',18000000);
insert into player values (null,'José','Gayà','1995-05-25',41,3 ,'LB','left',40000000);
insert into player values (null,'Alessandro','Florenzi','1991-03-11',41,4 ,'RB','right',16000000);
insert into player values (null,'Francis','Coquelin','1991-05-13',41,8 ,'CDM','right',19000000);
insert into player values (null,'Dani','Parejo','1989-04-16',41,3 ,'CM','right',28000000);
insert into player values (null,'Geoffrey','Kondogbia','1993-02-15',41, 8,'CAM','left',23000000);
insert into player values (null,'Carlos','Soler','1997-01-02',41, 3,'RW','right',40000000);
insert into player values (null,'Rodrigo','Machado','1991-03-06',41,13 ,'ST','left',40000000);
insert into player values (null,'Gonçalo','Guedes','1996-11-29',41,12 ,'LW','right',23000000);

#Pracownicy Valencia CF
insert into employees values(null,'President','Anil','Murthy','1973-03-19',41);
insert into employees values(null,'Coach','Albert','Celades','1975-09-29',41);

#Piłkarze Villarreal CF
insert into player values (null,'Sergio','Asenjo','1989-06-28',42, 3,'GK','right',10000000);
insert into player values (null,'Pau','Torres','1997-01-16',42,3 ,'CB','left',16000000);
insert into player values (null,'Ramiro','Mori','1991-03-05',42,10 ,'CB','left',5000000);
insert into player values (null,'Alberto','Moreno','1992-07-05',42,3 ,'LB','left',6000000);
insert into player values (null,'Rubén','Peña','1991-07-18',42,3 ,'RB','right',7000000);
insert into player values (null,'André','Anguissa','1995-11-16',42,47 ,'CDM','right',20000000);
insert into player values (null,'Manu','Trigueros','1991-10-17',42,3 ,'CM','right',12000000);
insert into player values (null,'Samu','Chukwueze','1999-05-22',42, 49,'LW','left',27000000);
insert into player values (null,'Santi','Cazorla','1984-12-13',42,3 ,'CAM','right',4000000);
insert into player values (null,'Paco','Alcácer','1993-08-30',42,3 ,'ST','right',28000000);
insert into player values (null,'Gerard','Moreno','1992-04-07',42,3 ,'RW','left',16000000);

#Pracownicy Villarreal CF
insert into employees values(null,'President','Fernando','Roig','1947-07-25',42);
insert into employees values(null,'Coach','Javier','Calleja','1978-05-12',42);

#Piłkarze Granada CF
insert into player values (null,'Rui','Silva','1994-02-07',43,12 ,'GK','left',4000000);
insert into player values (null,'Jesús','Vallejo','1997-01-05',43, 3,'CB','right',6000000);
insert into player values (null,'Domingos','Duarte','1995-03-10',43, 12,'CB','right',4000000);
insert into player values (null,'Carlos','Neva','1996-06-12',43,3 ,'LB','left',800000);
insert into player values (null,'Dimitri','Foulquier','1993-03-23',43,8 ,'RB','right',2000000);
insert into player values (null,'Yangel','Herrera','1998-01-07',43,46 ,'CDM','right',9000000);
insert into player values (null,'Fede','Vico','1994-07-04',43,3 ,'CAM','left',1000000);
insert into player values (null,'Ángel','Montoro','1988-06-25',43,3 ,'CM','right',1000000);
insert into player values (null,'Gil','Dias','1996-09-28',43, 2,'RW','left',3000000);
insert into player values (null,'Carlos','Fernández','1996-05-06',43,3 ,'ST','left',4000000);
insert into player values (null,'Darwin','Machís','1993-02-07',43,46 ,'LW','right',3000000);

#Pracownicy Granada CF
insert into employees values(null,'President','Jiang','Lizhang','1981-10-27',43);
insert into employees values(null,'Coach','Diego','Martinez','1980-12-16',43);

#Piłkarze Athletic Bilbao
insert into player values (null,'Unai','Simón','1997-06-11',44,3 ,'GK','right',16000000);
insert into player values (null,'Iñigo','Martínez','1991-05-17',44,3 ,'CB','left',26000000);
insert into player values (null,'Yeray','Álvarez','1995-01-24',44,3 ,'CB','right',24000000);
insert into player values (null,'Yuri','Berchiche','1990-02-10',44, 3,'LB','left',16000000);
insert into player values (null,'Ander','Capa','1992-02-08',44,3 ,'RB','right',6000000);
insert into player values (null,'Mikel','San José','1989-05-30',44,3 ,'CDM','right',5000000);
insert into player values (null,'Unai','López','1995-10-30',44,3 ,'CM','right',3000000);
insert into player values (null,'Raúl','García','1986-07-11',44,3 ,'CAM','right',6000000);
insert into player values (null,'Ibai','Gómez','1989-11-11',44, 3,'RW','right',3000000);
insert into player values (null,'Iñaki','Williams','1994-06-15',44,3 ,'ST','right',40000000);
insert into player values (null,'Iker','Muniain ','1992-12-19',44,3 ,'LW','right',14000000);

#Pracownicy Athletic Bilbao
insert into employees values(null,'President','Aitor','Elizegi','1966-06-27',44);
insert into employees values(null,'Coach','Gaizka','Garitano','1975-09-27',44);

#Piłkarze Osasuna Pampeluna
insert into player values (null,'Sergio','Herrera','1993-06-05',45,3 ,'GK','right',1000000);
insert into player values (null,'Aridane','Hernández','1989-03-23',45, 3,'CB','right',3000000);
insert into player values (null,'David','García','1994-02-14',45,3 ,'CB','right',2000000);
insert into player values (null,'Pervis','Estupiñán','1998-01-21',45,3 ,'LB','left',7000000);
insert into player values (null,'Nacho','Vidal','1995-01-24',45,3 ,'RB','right',2000000);
insert into player values (null,'Jon','Moncayola','1998-05-13',45,3 ,'CDM','right',3000000);
insert into player values (null,'Rubén','García','1993-07-14',45,3 ,'CM','right',6000000);
insert into player values (null,'Chimy','Ávila','1984-02-06',45,10 ,'ST','right',12000000);
insert into player values (null,'Adrián','López','1988-01-08',45,3 ,'RW','right',2000000);
insert into player values (null,'Roberto','Torres','1989-03-07',45,3 ,'CAM','right',4000000);
insert into player values (null,'José','Arnáiz','1995-04-15',45, 3,'LW','right',2000000);

#Pracownicy Osasuna Pampeluna
insert into employees values(null,'President','Luis','Sabalza','1947-10-23',45);
insert into employees values(null,'Coach','Jagoba','Arrasate','1978-04-22',45);

#Piłkarze Real Betis Sewilla
insert into player values (null,'Joel','Robles','1990-06-17',46,3 ,'GK','right',6000000);
insert into player values (null,'Marc','Bartra','1991-01-15',46,3 ,'CB','right',18000000);
insert into player values (null,'Aïssa','Mandi','1991-10-22',46,8 ,'CB','right',16000000);
insert into player values (null,'Alfonso','Pedraza','1996-04-09',46, 3,'LB','left',10000000);
insert into player values (null,'Emerson','Souza','1999-01-14',46,13 ,'RB','right',18000000);
insert into player values (null,'William','Carvalho','1992-04-07',46,12 ,'CDM','right',16000000);
insert into player values (null,'Carles','Aleñá','1998-01-05',46,3 ,'CM','left',18000000);
insert into player values (null,'Nabil','Fekir','1993-07-18',46,8 ,'CAM','left',32000000);
insert into player values (null,'Borja','Iglesias','1993-01-17',46,3 ,'RW','right',15000000);
insert into player values (null,'Loren','Morón','1993-12-30',46, 3,'ST','right',16000000);
insert into player values (null,'Cristian','Tello','1991-08-11',46,3 ,'LW','both',5000000);

#Pracownicy Real Betis Sewilla
insert into employees values(null,'President','Ángel','Haro','1974-11-02',46);
insert into employees values(null,'Coach','Joan','Sicilia','1970-02-05',46);

#Piłkarze Levante UD
insert into player values (null,'Aitor','Fernández','1991-05-03',47,3 ,'GK','right',8000000);
insert into player values (null,'Rúben','Vezo','1994-04-25',47,12 ,'CB','right',5000000);
insert into player values (null,'Sergio','Postigo','1988-11-04',47,3 ,'CB','right',2000000);
insert into player values (null,'Carlos','Clerc','1992-02-21',47,3 ,'LB','left',2000000);
insert into player values (null,'Jorge','Miramón','1989-06-02',47,3 ,'RB','right',3000000);
insert into player values (null,'Nemanja','Radoja','1993-02-06',47,11 ,'CDM','right',3000000);
insert into player values (null,'Enis','Bardhi','1995-07-02',47, 52,'CM','right',12000000);
insert into player values (null,'José','Campaña','1993-05-31',47,3 ,'CAM','right',12000000);
insert into player values (null,'Hernâni','Fortes','1991-08-20',47,12 ,'RW','right',2000000);
insert into player values (null,'Roger','Martí','1991-01-03',47,3 ,'ST','right',8000000);
insert into player values (null,'José','Morales','1987-07-23',47,3 ,'LW','right',7000000);

#Pracownicy Levante UD
insert into employees values(null,'President','Francisco','Catalán','1943-05-07',47);
insert into employees values(null,'Coach','Paco','López','1967-09-19',47);

#Piłkarze Deportivo Alaves
insert into player values (null,'Fernando','Pacheco','1992-05-18',48, 3,'GK','left',15000000);
insert into player values (null,'Víctor','Laguardia','1989-11-05',48,3 ,'CB','right',7000000);
insert into player values (null,'Lisandro','Magallán','1993-09-27',48,10 ,'CB','right',5000000);
insert into player values (null,'Rubén','Duarte','1995-10-18',48,3 ,'LB','left',5000000);
insert into player values (null,'Martin','Aguirregabiria','1996-05-10',48,3 ,'RB','right',5000000);
insert into player values (null,'Pere','Pons','1993-02-20',48,3 ,'CDM','right',3000000);
insert into player values (null,'Víctor','Camarasa','1994-05-28',48,3 ,'CM','right',4000000);
insert into player values (null,'Luis','Rioja','1993-10-16',48,3 ,'LW','left',2000000);
insert into player values (null,'Oliver','Burke','1997-04-07',48,53 ,'RW','right',5000000);
insert into player values (null,'Lucas','Pérez','1988-09-10',48, 3,'ST','left',000000);
insert into player values (null,'José','Mato','1990-03-27',48,3 ,'CAM','right',6000000);

#Pracownicy Deportivo Alaves
insert into employees values(null,'President','Alfonso','Trocóniz','1959-12-11',48);
insert into employees values(null,'Coach','Asier','Garitano','1969-12-06',48);

#Piłkarze Real Valladolid
insert into player values (null,'Jordi','Masip','1989-01-03',49,3 ,'GK','right',5000000);
insert into player values (null,'Mohammed','Salisu','1999-04-17',49,48 ,'CB','left',11000000);
insert into player values (null,'Kiko','Olivas','1988-09-21',49,3 ,'CB','right',2000000);
insert into player values (null,'Nacho','Martínez','1989-03-07',49,3 ,'LB','left',4000000);
insert into player values (null,'Pedro','Porro','1999-09-13',49,3 ,'RB','right',9000000);
insert into player values (null,'Joaquín','Fernández','1996-05-31',49,3 ,'CDM','right',3000000);
insert into player values (null,'Rubén','Alcaraz','1991-05-01',49,3 ,'CM','right',8000000);
insert into player values (null,'Hatem','Ben Arfa','1987-03-07',49,8 ,'CAM','right',4000000);
insert into player values (null,'Sergi','Guardiola','1991-05-29',49,3 ,'RW','left',5000000);
insert into player values (null,'Óscar','Plano','1991-02-11',49, 3,'RW','both',3000000);
insert into player values (null,'Toni','Villa','1995-01-07',49,3 ,'LW','right',4000000);

#Pracownicy Real Valladolid
insert into employees values(null,'President','Ronaldo','Nazário ','1976-09-18',49);
insert into employees values(null,'Coach','Sergio','Soriano','1976-11-10',49);

#Piłkarze SD Eibar
insert into player values (null,'Marko','Dmitrovic','1992-01-24',50, 11,'GK','left',10000000);
insert into player values (null,'Paulo','Oliveira','1992-01-08',50,12 ,'CB','right',5000000);
insert into player values (null,'Pedro','Bigas','1990-05-15',50,3 ,'CB','left',2000000);
insert into player values (null,'José','Ángel','1989-09-05',50,3 ,'LB','left',4000000);
insert into player values (null,'Álvaro','Tejero','1996-07-20',50,3 ,'RB','both',3000000);
insert into player values (null,'Pape','Diop','1986-03-19',50,8 ,'CDM','right',1000000);
insert into player values (null,'Gonzalo','Escalante','1993-03-27',50,10 ,'CM','right',3000000);
insert into player values (null,'Sebastián','Cristóforo','1993-08-23',50,21 ,'CAM','right',1000000);
insert into player values (null,'Takashi','Inui','1988-06-02',50,54 ,'LW','right',3000000);
insert into player values (null,'Kike','García','1989-11-25',50, 3,'ST','right',3000000);
insert into player values (null,'Pedro','León','1986-11-24',50, 3,'RW','right',2000000);

#Pracownicy SD Eibar
insert into employees values(null,'President','Amaia','Gorostiza','1961-03-23',50);
insert into employees values(null,'Coach','José','Mendilibar','1961-03-14',50);

#Piłkarze Celta Vigo
insert into player values (null,'Rubén','Blanco','1995-07-25',51,3 ,'GK','right',8000000);
insert into player values (null,'Joseph','Aidoo','1995-09-29',51,48 ,'CB','right',7000000);
insert into player values (null,'Jeison','Murillo','1992-05-27',51,45 ,'CB','right',7000000);
insert into player values (null,'Lucas','Olaza','1994-07-21',51, 21,'LB','left',3000000);
insert into player values (null,'Hugo','Mallo','1991-06-22',51,3 ,'RB','right',7000000);
insert into player values (null,'Okay','Yokuslu','1994-03-09',51,44 ,'CDM','right',6000000);
insert into player values (null,'Fran','Beltrán','1999-02-03',51,3 ,'CM','right',14000000);
insert into player values (null,'Rafael','Alcântara','1993-02-12',51,13 ,'CAM','right',10000000);
insert into player values (null,'Brais','Méndez','1997-01-07',51,3 ,'RW','right',12000000);
insert into player values (null,'Iago','Aspas','1987-08-01',51,3 ,'ST','left',16000000);
insert into player values (null,'Denis','Suárez','1994-01-06',51,3 ,'LW','right',10000000);

#Pracownicy Celta Vigo
insert into employees values(null,'President','Carlos','Mouriño','1943-03-04',51);
insert into employees values(null,'Coach','Óscar','García','1973-04-26',51);

#Piłkarze RCD Mallorca
insert into player values (null,'Fabricio','Ramírez','1987-12-31',52,3 ,'GK','right',1000000);
insert into player values (null,'Martin','Valjent','1995-12-11',52, 6,'CB','right',3000000);
insert into player values (null,'Antonio','Raíllo','1991-10-08',52,3 ,'CB','right',2000000);
insert into player values (null,'Leonardo','Koutris','1995-07-23',52,13 ,'LB','left',4000000);
insert into player values (null,'Joan','Sastre','1997-04-30',52,3 ,'RB','right',2000000);
insert into player values (null,'Sungyueng','Ki','1989-01-24',52, 42,'CDM','right',3000000);
insert into player values (null,'Aleix','Febas','1996-02-22',52,3 ,'CM','right',3000000);
insert into player values (null,'Dani','Rodríguez','1988-06-06',52, 3,'CAM','right',1000000);
insert into player values (null,'Takefusa','Kubo','2001-06-04',52,54 ,'RW','left',14000000);
insert into player values (null,'Cucho','Hernández','1993-04-22',52, 45,'ST','right',7000000);
insert into player values (null,'Lago','Júnior','1990-12-31',52, 55,'LW','right',4000000);

#Pracownicy RCD Mallorca
insert into employees values(null,'President','Andy','Kohlberg','1959-09-17',52);
insert into employees values(null,'Coach','Vicente','Moreno','1974-10-26',52);

#Piłkarze CD Leganes
insert into player values (null,'Juan','Soriano','1997-08-23',53, 3,'GK','right',2000000);
insert into player values (null,'Dimitrios','Siovas','1988-09-16',53,25 ,'CB','left',5000000);
insert into player values (null,'Chidozie','Awaziem','1997-01-01',53,49 ,'CB','right',4000000);
insert into player values (null,'Jonathan','Silva','1994-06-29',53,10 ,'LB','left',3000000);
insert into player values (null,'Roberto','Rosales','1988-11-20',53, 46,'RB','right',2000000);
insert into player values (null,'Rubén','Pérez','1989-04-26',53, 3,'CDM','right',6000000);
insert into player values (null,'Roque','Mesa','1989-06-07',53, 3,'CM','right',6000000);
insert into player values (null,'Óscar','Rodríguez','1998-06-28',53,3 ,'CAM','right',11000000);
insert into player values (null,'Miguel','Guerrero','1990-07-12',53,3 ,'RW','right',2000000);
insert into player values (null,'Roger','Assalé','1991-12-23',53, 55,'ST','right',6000000);
insert into player values (null,'Bryan','Gil','2001-02-11',53, 3,'LW','left',9000000);

#Pracownicy CD Leganes
insert into employees values(null,'President','‎María','Pavón','1959-11-14',53);
insert into employees values(null,'Coach','Javier','Aguirre','1958-12-01',53);

#Piłkarze Espanyol Barcelona
insert into player values (null,'Oier','Olazábal','1989-09-14',54,3 ,'GK','left',2000000);
insert into player values (null,'Leandro','Cabrera','1991-06-17',54,21 ,'CB','left',8000000);
insert into player values (null,'Bernardo','Espinosa','1989-07-11',54,45 ,'CB','right',5000000);
insert into player values (null,'Adrià','Pedrosa','1998-05-13',54,3 ,'LB','left',9000000);
insert into player values (null,'Víctor','Gómez','2000-04-01',54,3 ,'RB','right',2000000);
insert into player values (null,'Marc','Roca','1996-11-26',54,3 ,'CDM','right',16000000);
insert into player values (null,'Sergi','Darder','1993-12-22',54,3 ,'CM','right',11000000);
insert into player values (null,'Matías','Vargas','1997-05-08',54,10 ,'CAM','right',9000000);
insert into player values (null,'Oscar','Melendo','1997-08-23',54,3 ,'RW','left',6000000);
insert into player values (null,'Raúl','Tomás','1994-10-17',54,3 ,'ST','right',16000000);
insert into player values (null,'Jonathan','Calleri','1993-09-23',54, 10,'LW','right',6000000);

#Pracownicy Espanyol Barcelona
insert into employees values(null,'President','Chen','Yansheng','1970-08-24',54);
insert into employees values(null,'Coach','Abelardo','Artuña','1970-04-19',54);






