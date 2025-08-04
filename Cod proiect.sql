--CREAREA TABELEI CLIENTI
CREATE TABLE Clienti(
 id_client number(6),
 Nume varchar2(20),
 Prenume varchar2(20),
 CNP number(13),
 Adresa varchar2(50),
 Numar_de_telefon number(10),
 Email varchar2(20)
);
ALTER TABLE Clienti
 ADD CONSTRAINT id_client_pk primary key(id_client);
describe Clienti;

--CREAREA TABELEI CONTURI
CREATE TABLE Conturi(
 id_cont number(6) primary key,
 id_client number(6),
 Tip_cont varchar2(15),
 Sold number(10),
 Data_deschiderii date,
 CONSTRAINT id_client_fk foreign key (id_client) REFERENCES Clienti (id_client)
);

--CREAREA TABELEI IMPRUMUTURI
CREATE TABLE Imprumuturi(
 id_imprumut number(6),
 id_client number(6),
 Suma_imprumutata number(10),
 Data_acordarii date,
 Data_scadenta date,
 Rata_dobanzii number(4),
 Suma_rambursata number(10),
 Status varchar2(15),
 CONSTRAINT id_imprumut_pk primary key (id_imprumut),
 CONSTRAINT fk_id_client foreign key (id_client) REFERENCES Clienti (id_client)
);
ALTER TABLE Imprumuturi
 DROP COLUMN Suma_rambursata;
 describe Imprumuturi;

--CREAREA TABELEI TRANZACTII
CREATE TABLE Tranzactii(
 id_tranzactie number(6) primary key,
 id_cont number(6),
 Tip_tranzactie varchar2(10),
 Suma number(10),
 Data_tranzactiei date,
 Descriere varchar2(30)
);
ALTER TABLE TRANZACTII
 DROP COLUMN TIP_TRANZACTIE;
ALTER TABLE TRANZACTII
 ADD CONSTRAINT id_cont_fk foreign key (id_cont) REFERENCES Conturi (id_cont);
describe Tranzactii;

--CREAREA TABELEI ORASE
CREATE TABLE Orase(
 id_oras number(6) primary key,
 nume_oras varchar2(15)
);
describe Orase;

--CREAREA TABELEI DEPARTAMENTE
CREATE TABLE Departamente(
 id_departament number(6) primary key,
 id_oras number(6),
 nume_departament varchar2(50)
);
ALTER TABLE Departamente
 ADD CONSTRAINT id_oras_fk FOREIGN KEY (id_oras) REFERENCES Orase(id_oras);
 describe Departamente;

--CREAREA TABELEI ANGAJATI
CREATE TABLE Angajati(
 id_angajat number(6) primary key,
 id_departament number(6),
 id_manager number(6),
 Nume varchar2(20),
 Prenume varchar2(20),
 Salariu number(8),
 Data_angajarii date
);
ALTER TABLE ANGAJATI
 ADD CONSTRAINT id_departament_fk foreign key (id_departament) REFERENCES Departamente
(id_departament);
ALTER TABLE ANGAJATI
 ADD Varsta number(2);
ALTER TABLE ANGAJATI
 ADD CONSTRAINT restrictie_varsta CHECK (Varsta BETWEEN 18 AND 62);
 describe Angajati;

--CREAREA TABELEI SUCURSALE
CREATE TABLE Sucursale(
 id_sucursala number(6) primary key,
 id_oras number(6),
 Nume_sucursala varchar2(15),
 Adresa varchar2(40),
 CONSTRAINT fk_id_oras FOREIGN KEY (id_oras) REFERENCES Orase (id_oras)
);
ALTER TABLE Sucursale
 ADD CONSTRAINT fk_id_oras FOREIGN KEY (id_oras) REFERENCES Orase(id_oras);
DROP TABLE Sucursale;
CREATE TABLE Sucursale(
 id_sucursala number(6) primary key,
 id_oras number(6),
 Nume_sucursala varchar2(15),
 CONSTRAINT fk_id_oras FOREIGN KEY (id_oras) REFERENCES Orase (id_oras)
);
ALTER TABLE Sucursale
 ADD Adresa varchar2(40);
 describe Sucursale;

--POPULAREA TABELEI CLIENTI
INSERT INTO CLIENTI (id_client, Nume, Prenume, CNP, Adresa, Numar_de_telefon, Email)
VALUES (1, 'Lungu', 'Vanesa-Denisa', 6040105170041, 'Str. Ghioceilor', 0752884130, 'denisalungu434');
INSERT INTO CLIENTI (id_client, Nume, Prenume, CNP, Adresa, Numar_de_telefon, Email)
VALUES (2, 'Istrate', 'Andreea', 8530162842134, 'Str Batranetii', 0752884131, 'istrateandreea');
UPDATE CLIENTI SET Adresa='Str. Batranetii' WHERE ID_CLIENT=2;
UPDATE CLIENTI SET Prenume='Andreea-Alexandra' WHERE ID_CLIENT=2;
INSERT INTO CLIENTI (id_client, Nume, Prenume, CNP, Adresa, Numar_de_telefon, Email)
VALUES (3, 'Firan', 'Marian', 5926148294145, 'Str 18 Decembrie', 0752884132, 'firanmarian');
UPDATE CLIENTI SET Adresa='Str. 18 Decembrie' WHERE ID_CLIENT=3;
INSERT INTO CLIENTI (id_client, Nume, Prenume, CNP, Adresa, Numar_de_telefon, Email)
VALUES(4, 'Fluturu', 'Andreea', 6925174284718, 'Str Frumoasa', 0752884133, 'fluturuandreea');
UPDATE CLIENTI SET Adresa='Str. Frumoasa' WHERE ID_CLIENT=4;
INSERT INTO CLIENTI (id_client, Nume, Prenume, CNP, Adresa, Numar_de_telefon, Email)
VALUES(5, 'Fluturu', 'Patrisia', 7291752956247, 'Str Frumoasa', 0728519274, 'fluturupatrisia');
UPDATE CLIENTI SET Adresa='Str. Frumoasa' WHERE ID_CLIENT=5;
INSERT INTO CLIENTI (id_client, Nume, Prenume, CNP, Adresa, Numar_de_telefon, Email)
VALUES(6, 'Fuica', 'Andreea', 5195274915284, 'Str. Margeanului', 0751927539, 'fuicaandreea');
INSERT INTO CLIENTI (id_client, Nume, Prenume, CNP, Adresa, Numar_de_telefon, Email)
VALUES(7, 'Fuica', 'Diana', 8192548164294, 'Str Frunzei', 0715294629, 'fuicadiana');
UPDATE CLIENTI SET Adresa='Str. Frunzei' WHERE ID_CLIENT=7;
INSERT INTO CLIENTI (id_client, Nume, Prenume, CNP, Adresa, Numar_de_telefon, Email)
VALUES(8, 'Tudor', 'Razvan-Constantin', 5927149265172, 'Str. Salciei', 0724678123, 'tudorrazvan');
SELECT * FROM CLIENTI
ORDER BY ID_CLIENT;

--POPULAREA TABELEI CONTURI
INSERT INTO CONTURI (id_cont, id_client, Tip_cont, Sold, Data_deschiderii)
VALUES(10, 1, 'Economii', 12000, to_date('12.01.2022', 'dd.mm.yyyy'));
INSERT INTO CONTURI (id_cont, id_client, Tip_cont, Sold, Data_deschiderii)
VALUES(20, 2, 'Bursa', 900, to_date('17.11.2023', 'dd.mm.yyyy'));
INSERT INTO CONTURI (id_cont, id_client, Tip_cont, Sold, Data_deschiderii)
VALUES(30, 3, 'Salariu', 8200, to_date('19.05.2018', 'dd.mm.yyyy'));
INSERT INTO CONTURI (id_cont, id_client, Tip_cont, Sold, Data_deschiderii)
VALUES(40, 4, 'Economii', 4800, to_date('13.07.2020', 'dd.mm.yyyy'));
INSERT INTO CONTURI (id_cont, id_client, Tip_cont, Sold, Data_deschiderii)
VALUES(50, 5, 'Bursa', 730, to_date('20.01.2018', 'dd.mm.yyyy'));
INSERT INTO CONTURI (id_cont, id_client, Tip_cont, Sold, Data_deschiderii)
VALUES(60, 6, 'Economii', 2800, to_date('12.12.2023', 'dd.mm.yyyy'));
INSERT INTO CONTURI (id_cont, id_client, Tip_cont, Sold, Data_deschiderii)
VALUES(70, 7, 'Economii', 5200, to_date('05.03.2021', 'dd.mm.yyyy'));
INSERT INTO CONTURI (id_cont, id_client, Tip_cont, Sold, Data_deschiderii)
VALUES(80, 8, 'Salariu', 7300, to_date('25.10.2017', 'dd.mm.yyyy'));
SELECT * FROM CONTURI
ORDER BY ID_CLIENT;

--POPULAREA TABELEI IMPRUMUTURI
INSERT INTO IMPRUMUTURI (id_imprumut, id_client, Suma_imprumutata, Data_acordarii,
Data_scadenta, Rata_dobanzii, Status)
VALUES (100, 1, 5000, to_date('14.02.2023', 'dd.mm.yyyy'), to_date('14.02.2043', 'dd.mm.yyyy'), 7.5,
'Activ');
UPDATE IMPRUMUTURI SET RATA_DOBANZII=7 WHERE ID_CLIENT=1;
INSERT INTO IMPRUMUTURI (id_imprumut, id_client, Suma_imprumutata, Data_acordarii,
Data_scadenta, Rata_dobanzii, Status)
VALUES (300, 3, 30000, to_date('09.11.2021', 'dd.mm.yyyy'), to_date('09.11.2051', 'dd.mm.yyyy'), 8,
'Activ');
UPDATE IMPRUMUTURI SET RATA_DOBANZII=NULL WHERE ID_CLIENT=3;
INSERT INTO IMPRUMUTURI (id_imprumut, id_client, Suma_imprumutata, Data_acordarii,
Data_scadenta, Rata_dobanzii, Status)
VALUES (800, 8, 24000, to_date('20.05.2020', 'dd.mm.yyyy'), to_date('20.05.2048', 'dd.mm.yyyy'), 7,
'Activ');
SELECT * FROM IMPRUMUTURI
ORDER BY ID_CLIENT;

--POPULAREA TABELEI TRANZACTII
INSERT INTO TRANZACTII (id_tranzactie, id_cont, Suma, Data_tranzactiei, Descriere)
VALUES(1,10, 20, to_date('12.12.2023', 'dd.mm.yyyy'), 'Cumparaturi');
INSERT INTO TRANZACTII (id_tranzactie, id_cont, Suma, Data_tranzactiei, Descriere)
VALUES(2,10, 500, to_date('11.12.2023', 'dd.mm.yyyy'), 'Comanda online');
INSERT INTO TRANZACTII (id_tranzactie, id_cont, Suma, Data_tranzactiei, Descriere)
VALUES(3,10, 150, to_date('12.12.2023', 'dd.mm.yyyy'), 'Plata factura');
INSERT INTO TRANZACTII (id_tranzactie, id_cont, Suma, Data_tranzactiei, Descriere)
VALUES(4,30, 1500, to_date('20.11.2023', 'dd.mm.yyyy'), 'Chirie');
INSERT INTO TRANZACTII (id_tranzactie, id_cont, Suma, Data_tranzactiei, Descriere)
VALUES(5,30, 2000, to_date('01.12.2023', 'dd.mm.yyyy'), 'Rata credit');
INSERT INTO TRANZACTII (id_tranzactie, id_cont, Suma, Data_tranzactiei, Descriere)
VALUES(6,50, 300, to_date('08.12.2023', 'dd.mm.yyyy'), 'Transfer bancar');
INSERT INTO TRANZACTII (id_tranzactie, id_cont, Suma, Data_tranzactiei, Descriere)
VALUES(7,80, 1000, to_date('04.12.2023', 'dd.mm.yyyy'), 'Chirie');
INSERT INTO TRANZACTII (id_tranzactie, id_cont, Suma, Data_tranzactiei, Descriere)
VALUES(8,80, 500, to_date('15.05.2020', 'dd.mm.yyyy'), 'Transfer bancar');
INSERT INTO TRANZACTII (id_tranzactie, id_cont, Suma, Data_tranzactiei, Descriere)
VALUES(9,60, 86, to_date('12.12.2023', 'dd.mm.yyyy'), 'Cumparaturi');
INSERT INTO TRANZACTII (id_tranzactie, id_cont, Suma, Data_tranzactiei, Descriere)
VALUES(10,20, 300, to_date('10.10.2023', 'dd.mm.yyyy'), 'Facturi');
UPDATE TRANZACTII SET DESCRIERE='Plata factura' WHERE ID_TRANZACTIE=10;
INSERT INTO TRANZACTII (id_tranzactie, id_cont, Suma, Data_tranzactiei, Descriere)
VALUES(11,70, 330, to_date('05.06.2023', 'dd.mm.yyyy'), 'Comanda online');
SELECT * FROM TRANZACTII
ORDER BY ID_TRANZACTIE;

--POPULAREA TABELEI ORASE
INSERT INTO ORASE (id_oras, nume_oras)
VALUES (1, 'Bucuresti');
INSERT INTO ORASE (id_oras, nume_oras)
VALUES (2, 'Galati');
INSERT INTO ORASE (id_oras, nume_oras)
VALUES (3, 'Craiova');
SELECT * FROM ORASE
ORDER BY ID_ORAS;

--POPULAREA TABELEI DEPARTAMENTE
INSERT INTO DEPARTAMENTE(id_departament, id_oras, nume_departament)
VALUES (110, 1, 'FINANTE');
INSERT INTO DEPARTAMENTE(id_departament, id_oras, nume_departament)
VALUES (120, 1, 'MARKETING');
INSERT INTO DEPARTAMENTE(id_departament, id_oras, nume_departament)
VALUES (130, 1, 'IT');
INSERT INTO DEPARTAMENTE(id_departament, id_oras, nume_departament)
VALUES (140, 1, 'RESURSE UMANE');
INSERT INTO DEPARTAMENTE(id_departament, id_oras, nume_departament)
VALUES (210, 2, 'FINANTE');
INSERT INTO DEPARTAMENTE(id_departament, id_oras, nume_departament)
VALUES (220, 2, 'MARKETING');
INSERT INTO DEPARTAMENTE(id_departament, id_oras, nume_departament)
VALUES (230, 2, 'IT');
INSERT INTO DEPARTAMENTE(id_departament, id_oras, nume_departament)
VALUES (240, 2, 'RESURSE UMANE');
INSERT INTO DEPARTAMENTE(id_departament, id_oras, nume_departament)
VALUES (310, 3, 'FINANTE');
INSERT INTO DEPARTAMENTE(id_departament, id_oras, nume_departament)
VALUES (320, 3, 'MARKETING');
INSERT INTO DEPARTAMENTE(id_departament, id_oras, nume_departament)
VALUES (330, 3, 'IT');
INSERT INTO DEPARTAMENTE(id_departament, id_oras, nume_departament)
VALUES (340, 3, 'RESURSE UMANE');
SELECT * FROM DEPARTAMENTE
ORDER BY ID_DEPARTAMENT;

--POPULAREA TABELEI ANGAJATI
INSERT INTO ANGAJATI (id_angajat, id_departament, id_manager, Nume, Prenume, Salariu,
Data_angajarii)
VALUES (1, 110, 100, 'Lungu', 'Dragos', 8000, to_date('11.02.2020', 'dd.mm.yyyy'));
UPDATE ANGAJATI SET VARSTA=24 WHERE ID_ANGAJAT=1;
INSERT INTO ANGAJATI (id_angajat, id_departament, id_manager, Nume, Prenume, Salariu,
Data_angajarii)
VALUES (100, 110, NULL, 'Popescu', 'Ana', 7000, to_date('12.02.2018', 'dd.mm.yyyy'));
UPDATE ANGAJATI SET VARSTA=40 WHERE ID_ANGAJAT=100;
INSERT INTO ANGAJATI (id_angajat, id_departament, id_manager, Nume, Prenume, Varsta, Salariu,
Data_angajarii)
VALUES(2, 120, 100, 'Ionescu', 'Mihai', 35, 9000, to_date('12.02.2018', 'dd.mm.yyyy'));
INSERT INTO ANGAJATI (id_angajat, id_departament, id_manager, Nume, Prenume, Varsta, Salariu,
Data_angajarii)
VALUES(3, 130, 1, 'Popa', 'Ioana',40, 7500, to_date('13.02.2010', 'dd.mm.yyyy'));
INSERT INTO ANGAJATI (id_angajat, id_departament, id_manager, Nume, Prenume, Varsta, Salariu,
Data_angajarii)
VALUES(4, 140, 1, 'Radu', 'Elena',41, 8200, to_date('14.02.2015', 'dd.mm.yyyy'));
INSERT INTO ANGAJATI (id_angajat, id_departament, id_manager, Nume, Prenume, Varsta, Salariu,
Data_angajarii)
VALUES(5, 210, 3, 'Dumitru', 'Andrei',40, 8500, to_date('15.02.2011', 'dd.mm.yyyy'));
INSERT INTO ANGAJATI (id_angajat, id_departament, id_manager, Nume, Prenume, Varsta, Salariu,
Data_angajarii)
VALUES(6, 220, 100, 'Stanescu', 'Maria',35, 7800, to_date('16.02.2011', 'dd.mm.yyyy'));
INSERT INTO ANGAJATI (id_angajat, id_departament, id_manager, Nume, Prenume, Varsta, Salariu,
Data_angajarii)
VALUES(7, 230, 2, 'Moldovan', 'Cristina',32, 9200, to_date('17.02.2013', 'dd.mm.yyyy'));
INSERT INTO ANGAJATI (id_angajat, id_departament, id_manager, Nume, Prenume, Varsta, Salariu,
Data_angajarii)
VALUES(8, 240, 100, 'Dinu', 'Alexandru',34, 8700, to_date('18.02.2014', 'dd.mm.yyyy'));
INSERT INTO ANGAJATI (id_angajat, id_departament, id_manager, Nume, Prenume, Varsta, Salariu,
Data_angajarii)
VALUES(9, 310, 5, 'Gheorghiu', 'Laura',33, 8000, to_date('19.02.2015', 'dd.mm.yyyy'));
INSERT INTO ANGAJATI (id_angajat, id_departament, id_manager, Nume, Prenume, Varsta, Salariu,
Data_angajarii)
VALUES(10, 320, 100, 'Antonescu', 'Robert',25, 9300, to_date('20.02.2020', 'dd.mm.yyyy'));
INSERT INTO ANGAJATI (id_angajat, id_departament, id_manager, Nume, Prenume, Varsta, Salariu,
Data_angajarii)
VALUES(11, 330, 5, 'Mihai', 'Andreea',23, 7600, to_date('21.02.2022', 'dd.mm.yyyy'));
INSERT INTO ANGAJATI (id_angajat, id_departament, id_manager, Nume, Prenume, Varsta, Salariu,
Data_angajarii)
VALUES(12, 340, 2, 'Georgescu', 'Alex',21, 8800, to_date('22.02.2023', 'dd.mm.yyyy'));
INSERT INTO ANGAJATI (id_angajat, id_departament, id_manager, Nume, Prenume, Varsta, Salariu,
Data_angajarii)
VALUES(13, 110, 4, 'Florescu', 'Diana',28, 9200, to_date('23.02.2018', 'dd.mm.yyyy'));
INSERT INTO ANGAJATI (id_angajat, id_departament, id_manager, Nume, Prenume, Varsta, Salariu,
Data_angajarii)
VALUES(14, 120, 100, 'Dobre', 'Gabriel',29, 7900, to_date('24.02.2017', 'dd.mm.yyyy'));
INSERT INTO ANGAJATI (id_angajat, id_departament, id_manager, Nume, Prenume, Varsta, Salariu,
Data_angajarii)
VALUES(15, 130, 12, 'Stanciu', 'Elena',38, 8700, to_date('25.02.2012', 'dd.mm.yyyy'));
INSERT INTO ANGAJATI (id_angajat, id_departament, id_manager, Nume, Prenume, Varsta, Salariu,
Data_angajarii)
VALUES(16, 140, 100, 'Ilie', 'Ana-Maria',45, 9400, to_date('26.02.2010', 'dd.mm.yyyy'));
INSERT INTO ANGAJATI (id_angajat, id_departament, id_manager, Nume, Prenume, Varsta, Salariu,
Data_angajarii)
VALUES(17, 210, 1, 'Balan', 'Ionut',42, 8100, to_date('27.02.2015', 'dd.mm.yyyy'));
INSERT INTO ANGAJATI (id_angajat, id_departament, id_manager, Nume, Prenume, Varsta, Salariu,
Data_angajarii)
VALUES(18, 220, 2, 'Cristea', 'Teodora',29, 8700, to_date('28.02.2018', 'dd.mm.yyyy'));
INSERT INTO ANGAJATI (id_angajat, id_departament, id_manager, Nume, Prenume, Varsta, Salariu,
Data_angajarii)
VALUES(19, 230, 5, 'Serban', 'Raluca',36, 8000, to_date('29.02.2016', 'dd.mm.yyyy'));
INSERT INTO ANGAJATI (id_angajat, id_departament, id_manager, Nume, Prenume, Varsta, Salariu,
Data_angajarii)
VALUES(20, 240, 12, 'Anton', 'Adrian',30, 9100, to_date('01.03.2016', 'dd.mm.yyyy'));
INSERT INTO ANGAJATI (id_angajat, id_departament, id_manager, Nume, Prenume, Varsta, Salariu,
Data_angajarii)
VALUES(21, 310, 100, 'Tudor', 'Madalina',49, 7800, to_date('02.03.2013', 'dd.mm.yyyy'));
INSERT INTO ANGAJATI (id_angajat, id_departament, id_manager, Nume, Prenume, Varsta, Salariu,
Data_angajarii)
VALUES(22, 320, 15, 'Costin', 'Sorin',50, 9300, to_date('03.03.2012', 'dd.mm.yyyy'));
INSERT INTO ANGAJATI (id_angajat, id_departament, id_manager, Nume, Prenume, Varsta, Salariu,
Data_angajarii)
VALUES(23, 330, 12, 'Gavrila', 'Catalina',55, 8600, to_date('04.03.2020', 'dd.mm.yyyy'));
INSERT INTO ANGAJATI (id_angajat, id_departament, id_manager, Nume, Prenume, Varsta, Salariu,
Data_angajarii)
VALUES(24, 340, 1, 'Mocanu', 'Alina',20, 8900, to_date('05.03.2023', 'dd.mm.yyyy'));
SELECT * FROM ANGAJATI
ORDER BY ID_ANGAJAT;

--POPULAREA TABELEI SUCURSALE
INSERT INTO SUCURSALE (id_sucursala, id_oras, Nume_sucursala)
VALUES(11,1,'BT CENTRU');
UPDATE SUCURSALE SET NUME_SUCURSALA='BT UNIRII' WHERE ID_SUCURSALA=11;
UPDATE SUCURSALE SET ADRESA='BLD UNIRII 25' WHERE ID_SUCURSALA=11;
INSERT INTO SUCURSALE (id_sucursala, id_oras, Nume_sucursala)
VALUES(12,1,'BT UNIVERSITATE');
UPDATE SUCURSALE SET ADRESA='BLD REGINA ELISABETA 16' WHERE ID_SUCURSALA=12;
INSERT INTO SUCURSALE (id_sucursala, id_oras, Nume_sucursala)
VALUES(13,1,'BT RAHOVA');
UPDATE SUCURSALE SET ADRESA='SOS ALEXANDRIEI 16' WHERE ID_SUCURSALA=13;
INSERT INTO SUCURSALE (id_sucursala, id_oras, Nume_sucursala)
VALUES(14,2,'BT BRAILEI');
UPDATE SUCURSALE SET ADRESA='STRADA BRAILEI 152' WHERE ID_SUCURSALA=14;
INSERT INTO SUCURSALE (id_sucursala, id_oras, Nume_sucursala)
VALUES(15,2,'BT MICRO 18');
UPDATE SUCURSALE SET ADRESA='STRADA BRAILEI 192' WHERE ID_SUCURSALA=15;
INSERT INTO SUCURSALE (id_sucursala, id_oras, Nume_sucursala)
VALUES(16,2,'BT MAZEPA');
UPDATE SUCURSALE SET ADRESA='STRADA BRAILEI 132' WHERE ID_SUCURSALA=16;
INSERT INTO SUCURSALE (id_sucursala, id_oras, Nume_sucursala)
VALUES(17,2,'BT MICRO 14');
UPDATE SUCURSALE SET ADRESA='STRADA BRAILEI 200' WHERE ID_SUCURSALA=17;
INSERT INTO SUCURSALE (id_sucursala, id_oras, Nume_sucursala)
VALUES(18,3,'BT ELECTROPTR');
UPDATE SUCURSALE SET ADRESA='STR. IMPARATUL TRAIAN 219' WHERE ID_SUCURSALA=18;
INSERT INTO SUCURSALE (id_sucursala, id_oras, Nume_sucursala)
VALUES(19,3,'BT CRAIOVITEI');
UPDATE SUCURSALE SET ADRESA='STRADA TUFANELE 1' WHERE ID_SUCURSALA=19;
INSERT INTO SUCURSALE (id_sucursala, id_oras, Nume_sucursala)
VALUES(20,3,'BT VALEA ROSIE');
UPDATE SUCURSALE SET NUME_SUCURSALA='BT VALEA FETII' WHERE ID_SUCURSALA=20;
UPDATE SUCURSALE SET ADRESA='STRADA CARACAL 95' WHERE ID_SUCURSALA=20;
DELETE FROM SUCURSALE WHERE ADRESA='STRADA BRAILEI 152';
SELECT * FROM SUCURSALE
ORDER BY ID_SUCURSALA;

-------------------------STRUCTURI DE CONTROL---------------------------------
Ex 1:
Verificati daca fiecare angajat este eligibil pentru promovare în funcție de vechimea sa în companie și de salariu (cel putin 5 ani de vechime si un salariu mai mare de 5000 lei).
DECLARE
v_nume angajati.nume %type; v_prenume angajati.prenume %type; v_salariu angajati.salariu %type;
v_data_angajarii angajati.data_angajarii %type; v_vechime number(3); v_min number (3); v_max number(3); i number(3);
BEGIN
SELECT MIN(ID_ANGAJAT), MAX(ID_ANGAJAT) INTO v_min, v_max FROM angajati; i:=v_min;
WHILE i<=v_max LOOP
SELECT nume, prenume, salariu, data_angajarii, (sysdate-data_angajarii)/365 INTO v_nume, v_prenume, v_salariu, v_data_angajarii, v_vechime FROM angajati where id_angajat=i;
IF v_vechime>=5 AND v_salariu>5000 THEN dbms_output.put_line('Angajatul '||v_nume||'
'||v_prenume||' are o vechime de '||v_vechime||' ani, si un salariu de '||v_salariu||' lei, deci este eligibil pentru o promovare.');
ELSE dbms_output.put_line('Angajatul '||v_nume||' '||v_prenume||' are o vechime de '||v_vechime||' ani, si un salariu de '||v_salariu||' lei, deci nu este eligibil pentru o promovare.'); END IF; i:=i+1;
END LOOP;
END;
Ex 2:
Aplicati un discount la suma unui împrumut pentru toți clienții care au dobândă peste 7% și termenul de scadență peste 10 ani (5% reducere).
DECLARE
v_nume clienti.nume %type; v_prenume clienti.prenume %type; v_suma imprumuturi.suma_imprumutata %type; v_reducere number(5); v_suma_modificata number(8); v_termen number(3);
v_rata imprumuturi.rata_dobanzii %type; v_min number (3); v_max number(3); i number(3);
BEGIN
SELECT MIN(ID_client), MAX(ID_client) INTO v_min, v_max FROM Imprumuturi; i:=v_min;
WHILE i<=v_max LOOP
SELECT nume, prenume INTO v_nume, v_prenume FROM clienti where id_client=i;
SELECT suma_imprumutata, (data_scadenta-sysdate)/365, rata_dobanzii INTO v_suma, v_termen, v_rata FROM imprumuturi where id_client=i;
IF v_rata>=5 AND v_termen>10 THEN v_reducere:=0.05*v_suma; v_suma_modificata:=v_suma-0.05*v_suma; ELSE v_reducere:=0; v_suma_modificata:=v_suma; END IF; i:=i+2;
dbms_output.put_line('Clientul '||v_nume||' '||v_prenume||' are un imprumut in valoare de '||v_suma||' lei, pe un termen de '||v_termen||' ani, caruia i se va aplica o reducere de
'||v_reducere|| ' lei, deci valoarea finala a imprumutului dupa aplicarea reducerii va fi de '||v_suma_modificata||' lei.');
END LOOP;
END;
Acelasi exercitiu, insa folosind structura CASE in loc de IF:
DECLARE
v_nume clienti.nume %type; v_prenume clienti.prenume %type; v_suma imprumuturi.suma_imprumutata %type; v_reducere number(5); v_suma_modificata number(8); v_termen number(3);
v_rata imprumuturi.rata_dobanzii %type; v_min number (3); v_max number(3); i number(3);
BEGIN
SELECT MIN(ID_client), MAX(ID_client) INTO v_min, v_max FROM Imprumuturi; i:=v_min;
WHILE i<=v_max LOOP
SELECT nume, prenume INTO v_nume, v_prenume FROM clienti where id_client=i;
SELECT suma_imprumutata, (data_scadenta-sysdate)/365, rata_dobanzii INTO v_suma, v_termen, v_rata
FROM imprumuturi where id_client=i;
v_reducere:=CASE WHEN v_rata>=5 AND v_termen>10 THEN 0.05*v_suma
ELSE 0 END; v_suma_modificata:=CASE WHEN v_rata>=5 AND v_termen>10 THEN v_suma-v_reducere ELSE v_suma END;
i:=i+2;
dbms_output.put_line('Clientul '||v_nume||' '||v_prenume||' are un imprumut in valoare de '||v_suma||' lei, pe un termen de '||v_termen||' ani, caruia i se va aplica o reducere de '||v_reducere|| ' lei, deci valoarea finala a imprumutului dupa aplicarea reducerii va fi de '||v_suma_modificata||' lei.');
END LOOP;
END;
Ex 3:
Calculati și afisati suma soldurilor pentru conturile de economii deschise de mai mult de doi ani pentru fiecare client.
DECLARE
v_nume clienti.nume %type; v_prenume clienti.prenume %type; v_sold conturi.sold %type; v_suma number(10):=0; v_cont conturi.tip_cont %type; v_data number(3);
BEGIN
FOR i IN 1..8 LOOP
SELECT nume, prenume INTO v_nume, v_prenume FROM clienti WHERE id_client=i;
SELECT tip_cont, sold, (sysdate-data_deschiderii)/365 INTO v_cont, v_sold, v_data FROM conturi WHERE id_client=i;
IF v_data>2 AND v_cont LIKE 'Economii' THEN v_suma := v_suma + v_sold; END IF;
dbms_output.put_line('Clientul '||v_nume||' '||v_prenume||' prezinta un cont de '||v_cont||' cu un sold de '||v_sold||' lei. Contul a fost deschis in urma cu '||v_data|| ' ani.');
END LOOP;
dbms_output.put_line('Suma soldurilor conturilor de economii deschise de mai mult de doi ani este
'||v_suma||' lei.');
END;
Ex 4:
Actualizează statusul unui împrumut în funcție de rata dobanzii. Dacă rata dobânzii este mai mică de 5%, să fie setat Inactiv, dacă este între 5% și 8% să fie setat Activ, iar pentru mai mare de 8% să fie setat Pericol.
DECLARE
v_id_client Imprumuturi.id_client%TYPE :=3; (&c voiam sa dau valoarea de la tastatura, dar nu merge in apex, genereaza eroare, asa ca am pus direct valoarea ca sa functioneze) v_rata_dobanzii Imprumuturi.Rata_dobanzii%TYPE; v_status_nou VARCHAR2(15);
BEGIN
SELECT Rata_dobanzii INTO v_rata_dobanzii
FROM Imprumuturi
WHERE id_client = v_id_client;
v_status_nou := CASE WHEN v_rata_dobanzii < 5 THEN 'Inactiv'
WHEN v_rata_dobanzii BETWEEN 5 AND 8 THEN 'Activ'
ELSE 'Pericol'
END;
UPDATE Imprumuturi SET Status = v_status_nou WHERE id_client = v_id_client; dbms_output.put_line('Statusul imprumutului a fost actualizat: ' || v_status_nou);
END;
Comanda a trecut direct pe ramura else a structurii, deoarece comisionul pentru clientul cu id_client=3 era NULL.
--------------------------------------CURSORI----------------------------------
Ex 1: Creează un cursor care să returneze numele, prenumele clientului, tipul de cont si soldul acestuia, cu conditia ca acesta sa depaseasca suma de 5000 lei.
DECLARE
CURSOR c IS SELECT cl.nume, cl.prenume, co.tip_cont, co.sold FROM clienti cl JOIN conturi co USING (id_client) WHERE co.sold>5000;
v_nume clienti.nume%TYPE;
v_prenume clienti.prenume%TYPE;
v_tip_cont conturi.tip_cont%TYPE;
v_sold conturi.sold%TYPE;
BEGIN
OPEN c;
LOOP
FETCH c INTO v_nume, v_prenume, v_tip_cont, v_sold;
EXIT WHEN c%NOTFOUND;
DBMS_OUTPUT.PUT_LINE('Clientul ' || v_nume || ' ' || v_prenume || ' are un cont pentru ' || v_tip_cont ||' cu un sold de '|| v_sold || ' lei.');
END LOOP;
CLOSE c;
END;
Ex 2: Creaza un cursor pentru a afisa numele, prenumele, id-ul clientului si al tranzactiei efectuate impreuna cu suma tranzactiei, doar pentru tranzactiile efectuate dupa data de 1.12.2023.
DECLARE
CURSOR c IS SELECT cl.nume, cl.prenume, id_client, id_cont, tr.id_tranzactie, suma FROM clienti cl JOIN conturi co USING (id_client) JOIN tranzactii tr USING (id_cont) WHERE tr.data_tranzactiei>TO_DATE('01-12-2023', 'DD-MM-YYYY');
BEGIN
FOR V IN C LOOP
DBMS_OUTPUT.PUT_LINE('Clientul ' || v.nume || ' ' || v.prenume ||' cu id-ul '||v.id_client||' a efectuat o tranzactie cu id-ul '||v.id_tranzactie||' pentru suma de '||v.suma||' lei.');
END LOOP;
END;
Ex 3: Creaaza un cursor pentru a selecta și afișa numele, prenumele, id-ul clientului, contul si id-ul sau, soldurile conturilor si data ultimei tranzactii, pentru clientii care au conturi inactive (nu au avut tranzacții în ultimele 15 luni).
DECLARE
CURSOR c IS SELECT DISTINCT cl.nume, cl.prenume, id_client, id_cont,co.tip_cont, co.sold FROM clienti cl JOIN conturi co USING (id_client) JOIN tranzactii USING (id_cont) WHERE data_tranzactiei > ADD_MONTHS(SYSDATE, -15);
CURSOR d(a number) is select data_tranzactiei from tranzactii WHERE id_cont IN (SELECT id_cont from conturi where id_client=a) AND data_tranzactiei > ADD_MONTHS(SYSDATE, -15) ORDER BY data_tranzactiei DESC FETCH FIRST 1 ROW ONLY;
BEGIN
FOR v IN c LOOP
dbms_output.put_line('Clientul ' || v.nume || ' ' || v.prenume ||' cu id-ul '||v.id_client||' are un cont utilizat pentru '||v.tip_cont||' inactiv, cu id-ul '||v.id_cont||' si un sold de '||v.sold||' lei.');
FOR w IN d (v.id_client) LOOP
dbms_output.put_line(' Data ultimei tranzactii efectuate este '||w.data_tranzactiei);
END LOOP;
END LOOP;
END;
Ex 4:Afișati tranzacțiile celor mai activi 3 clienți (cei care au realizat cele mai multe tranzacții).
DECLARE
CURSOR c IS SELECT cl.nume, cl.prenume, id_client, id_cont, count(id_tranzactie) AS numar_tranzactii FROM clienti cl JOIN conturi co USING (id_client) JOIN tranzactii tr USING (id_cont) GROUP BY cl.nume, cl.prenume, id_client, id_cont ORDER BY numar_tranzactii DESC FETCH FIRST 3 ROWS ONLY;
CURSOR d(a number) is select data_tranzactiei from tranzactii WHERE id_cont IN (SELECT id_cont from conturi where id_client=a);
BEGIN
FOR v IN c LOOP
dbms_output.put_line('Clientul ' || v.nume || ' ' || v.prenume ||' cu id-ul '||v.id_client||' este unul dintre cei mai activi clienti, efectuand '||v.numar_tranzactii||' tranzactii.');
FOR w IN d (v.id_client) LOOP
dbms_output.put_line(' Tranzactiile au fost efectuate in data de: '||w.data_tranzactiei);
END LOOP;
END LOOP;
END;
---------------------EXCEPTII SI SUBPROGRAME----------------------
Ex 1: Creează un bloc PL/SQL care verifică dacă un client există în tabela Clienti, returnând TRUE sau FALSE.
CREATE OR REPLACE FUNCTION Verifica_Client(p_id_client NUMBER)
RETURN BOOLEAN IS
v_count NUMBER;
BEGIN
SELECT COUNT(*) INTO v_count
Clienti
WHERE id_client = p_id_client;
IF v_count > 0 THEN
RETURN TRUE;
ELSE
RETURN FALSE;
END IF;
END;
DECLARE
v_verifica BOOLEAN;
BEGIN
v_verifica:=Verifica_client(7);
IF v_verifica THEN DBMS_OUTPUT.PUT_LINE('Clientul există!');
ELSE DBMS_OUTPUT.PUT_LINE('Clientul nu există!');
END IF;
END;
Ex 2: Pe baza functiei creata anterior, creează un bloc PL/SQL care Creează un cont nou pentru un client, doar dacă sunt indeplinite urmatoarele conditii:
Clientul există.
Clientul nu are deja un cont de acelasi tip.
Soldul inițial trebuie să fie de cel puțin 1000.
Tratati exceptiile in cazul in care clientul nu exista, are deja un cont de tipul specificat sau soldul este mai mic de 1000 lei.
CREATE SEQUENCE SEQ_CONTURI
START WITH 90
INCREMENT BY 10;
CREATE OR REPLACE PROCEDURE Creeaza_Cont(
p_id_client NUMBER,
p_tip_cont VARCHAR2,
p_sold_initial NUMBER) IS
v_count NUMBER;
Nu_exista_client EXCEPTION;
Cont_existent EXCEPTION;
Sold_invalid EXCEPTION;
BEGIN
SELECT COUNT(*) INTO v_count
FROM Conturi
WHERE id_client = p_id_client AND Tip_cont = p_tip_cont;
IF NOT Verifica_Client(p_id_client) THEN
RAISE Nu_exista_client;
ELSIF v_count > 0 THEN
RAISE Cont_existent;
ELSIF p_sold_initial < 1000 THEN
RAISE Sold_invalid;
ELSE
INSERT INTO Conturi(id_cont, id_client, Tip_cont, Sold, Data_deschiderii)
VALUES (SEQ_CONTURI.NEXTVAL, p_id_client, p_tip_cont, p_sold_initial, SYSDATE);
DBMS_OUTPUT.PUT_LINE('Cont creat cu succes!');
END IF;
EXCEPTION
WHEN Nu_exista_client THEN
DBMS_OUTPUT.PUT_LINE('Clientul nu există!');
WHEN Cont_existent THEN
DBMS_OUTPUT.PUT_LINE('Clientul are deja un cont de acest tip!');
WHEN Sold_invalid THEN
DBMS_OUTPUT.PUT_LINE('Soldul inițial este prea mic!');
WHEN OTHERS THEN
DBMS_OUTPUT.PUT_LINE('Eroare neașteptată: ' || SQLERRM);
END;
BEGIN
Creeaza_Cont(20, 'Salariu', 100);
END;

Ex 3: Creează o funcție care calculează vechimea unui angajat pe baza datei de angajare. Folosește această funcție într-o procedură care listează toți angajații cu vârsta calculată.
CREATE OR REPLACE FUNCTION Calcul_vechime(p_id_angajat NUMBER)
RETURN NUMBER IS
v_vechime NUMBER;
BEGIN
SELECT TRUNC((SYSDATE-data_angajarii)/365) INTO v_vechime FROM Angajati WHERE id_angajat=p_id_angajat;
RETURN v_vechime;
EXCEPTION
WHEN NO_DATA_FOUND THEN RETURN -1;
END;
DECLARE
vechime NUMBER;
v_nume angajati.nume%TYPE;
v_prenume angajati.prenume%TYPE;
BEGIN
SELECT nume, prenume INTO v_nume, v_prenume FROM ANGAJATI WHERE id_angajat=7;
vechime:= TRUNC(Calcul_vechime(7));
DBMS_OUTPUT.PUT_LINE('Angajatul '||v_nume||' '||v_prenume||' are o vechime de '||vechime||' ani.');
END;
Ex 4: Apelați funcția Calcul_vechime în cadrul unei proceduri, prin care se vor parcurge toți angajatii, în scopul afișării vechimii fiecăruia.
CREATE OR REPLACE PROCEDURE Afisare_angajati IS
CURSOR c IS
SELECT nume||' '||prenume AS Nume_angajat, TRUNC(Calcul_vechime(id_angajat)) AS Vechime FROM Angajati ORDER BY Vechime DESC;
BEGIN
FOR v IN c LOOP
DBMS_OUTPUT.PUT_LINE('Angajatul '||v.Nume_angajat||' are o vechime de '||v.Vechime||' ani.');
END LOOP;
END;
BEGIN
Afisare_angajati;
END;
Ex 5: Creează o funcție care calculează numărul de zile rămase până la scadența unui împrumut.
CREATE OR REPLACE FUNCTION Zile_Pana_La_Scadenta(p_data_scadenta DATE)
RETURN NUMBER IS
v_zile NUMBER;
SCADENTA_DEPASITA EXCEPTION;
BEGIN
v_zile := p_data_scadenta - SYSDATE;
IF v_zile < 0 THEN
RAISE SCADENTA_DEPASITA;
END IF;
RETURN v_zile;
EXCEPTION
WHEN SCADENTA_DEPASITA THEN
DBMS_OUTPUT.PUT_LINE('Data scadenței a fost depășită!');
RETURN -1;
WHEN OTHERS THEN
DBMS_OUTPUT.PUT_LINE('Eroare neașteptată: ' || SQLERRM);
RETURN -1;
END;
SELECT id_imprumut, suma_imprumutata, TRUNC(Zile_Pana_La_Scadenta(data_scadenta)) AS Zile_pana_la_data_scadenta FROM Imprumuturi;
