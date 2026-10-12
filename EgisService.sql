
create table Paiydalanyshylar (
    id int primary key,
    roli varchar(20) not null check (roli in ('fermer', 'oryndaushy', 'administrator')),
    aty_jony varchar(100) not null,
    telefon varchar(20) not null,
    elektronik_poshta varchar(100),
    kupiya_soz varchar(250) not null,
    tirkelgen_uaqyty datetime
);

create table Tekhnika (
    id int primary key,
    oryndaushy_id int not null,
    atauy varchar(100) not null,
    tehnika_tury varchar(50) not null,
    topyraq_tury varchar(50),
    baga_molsheri decimal(10, 2) not null,
    oltshem_birligi varchar(20) not null check (oltshem_birligi in ('gektar', 'sagat')),
    geolocaciya_eni decimal(10, 8),
    geolocaciya_boilygy decimal(11, 8),
    statusy varchar(20) check (statusy in ('bos', 'bos_emez', 'remontta')),
    foreign key (oryndaushy_id) references Paiydalanyshylar(id)
);

create table Tekhnika_kestesi (
    id int primary key,
    tehnika_id int not null,
    kuni date not null,
    bos_pa smallint default 1 check (bos_pa in (0, 1)),
    foreign key (tehnika_id) references Tekhnika(id)
);

create table Brondau (
    id int primary key,
    fermer_id int not null,
    tehnika_id int not null,
    bastalyp_uaqyty datetime not null,
    ayaqtalyp_uaqyty datetime not null,
    jalpy_kunu decimal(10, 2) not null,
    statusy varchar(30) default 'kutu' check (statusy in ('kutu', 'qabyldandy', 'qabylnamandy', 'oryndaluda', 'ayaqtaldy', 'joiylsa')),
    jasalgan_uaqyty datetime,
    foreign key (fermer_id) references Paiydalanyshylar(id),
    foreign key (tehnika_id) references Tekhnika(id)
);

create table Qr_rastau (
    id int primary key,
    brondau_id int not null,
    qr_token varchar(250) not null,
    kelgen_uaqyty datetime,
    ayaqtalgan_uaqyty datetime,
    statusy varchar(30) default 'kutu' check (statusy in ('kutu', 'jumys_bastaldy', 'jumys_ayaqtaldy')),
    foreign key (brondau_id) references Brondau(id)
);

create table Escrow_tolemder (
    id int primary key,
    brondau_id int not null,
    tolenetyn_soma decimal(10, 2) not null,
    statusy varchar(30) default 'escrowda_ustalu' check (statusy in ('escrowda_ustalu', 'oryndaushyga_audaryldy', 'fermerge_qaitaryldy')),
    tolem_uaqyty datetime,
    foreign key (brondau_id) references Brondau(id)
);

create table Aua_raiy (
    id int primary key,
    aimaq varchar(100) not null,
    kuni date not null,
    temperatura int,
    jaqdai varchar(50),
    jumysqa_qolaily_ma smallint default 1 check (jumysqa_qolaily_ma in (0, 1))
);

create table Pikirler_haim_reiting (
    id int primary key,
    brondau_id int not null,
    fermer_id int not null,
    oryndaushy_id int not null,
    baga int check (baga >= 1 and baga <= 5),
    pikir_matini text,
    qaldyrylgan_uaqyty datetime,
    foreign key (brondau_id) references Brondau(id),
    foreign key (fermer_id) references Paiydalanyshylar(id),
    foreign key (oryndaushy_id) references Paiydalanyshylar(id)
);


insert into Paiydalanyshylar (id, roli, aty_jony, telefon, elektronik_poshta, kupiya_soz, tirkelgen_uaqyty) values
(1, 'administrator', 'Ерлан Әбілов', '+77011234567', 'admin@egisservice.kz', 'hash_pass_1', '2026-03-01 08:00:00'),
(2, 'oryndaushy', 'Қайрат Нұрпейісов', '+77022345678', 'kairat@mail.kz', 'hash_pass_2', '2026-03-02 09:15:00'),
(3, 'oryndaushy', 'Мұратбек Сапарұлы', '+77033456789', 'murat@mail.kz', 'hash_pass_3', '2026-03-03 10:30:00'),
(4, 'oryndaushy', 'Серікболсын Жұмағұл', '+77044567890', 'serik@mail.kz', 'hash_pass_4', '2026-03-04 11:00:00'),
(5, 'oryndaushy', 'Азамат Төлеуов', '+77055678901', 'azamat@mail.kz', 'hash_pass_5', '2026-03-05 14:20:00'),
(6, 'fermer', 'Ақжүніс Смайлова', '+77066789012', 'akzhunis@gmail.com', 'hash_pass_6', '2026-03-06 15:40:00'),
(7, 'fermer', 'Бекжан Оспанов', '+77077890123', 'bekzhan@gmail.com', 'hash_pass_7', '2026-03-07 16:10:00'),
(8, 'fermer', 'Нұргүл Сейітова', '+77088901234', 'nurgul@gmail.com', 'hash_pass_8', '2026-03-08 09:00:00'),
(9, 'fermer', 'Дидар Ерболатұлы', '+77099012345', 'didar@gmail.com', 'hash_pass_9', '2026-03-09 10:25:00'),
(10, 'fermer', 'Гүлмира Исаева', '+77100123456', 'gulmira@gmail.com', 'hash_pass_10', '2026-03-10 11:50:00'),
(11, 'oryndaushy', 'Алмас Бейсенов', '+77111234578', 'almas@mail.kz', 'hash_pass_11', '2026-03-11 12:00:00'),
(12, 'oryndaushy', 'Талғат Махамбетов', '+77122345689', 'talgat@mail.kz', 'hash_pass_12', '2026-03-12 13:10:00'),
(13, 'fermer', 'Жандос Қаратаев', '+77133456790', 'zhandos@gmail.com', 'hash_pass_13', '2026-03-13 14:15:00'),
(14, 'fermer', 'Мақсат Рахметов', '+77144567801', 'maksat@gmail.com', 'hash_pass_14', '2026-03-14 16:30:00'),
(15, 'fermer', 'Салтанат Ахметова', '+77155678912', 'saltanat@gmail.com', 'hash_pass_15', '2026-03-15 17:00:00');

insert into Aua_raiy (id, aimaq, kuni, temperatura, jaqdai, jumysqa_qolaily_ma) values
(1, 'Ақмола облысы', '2026-05-01', 22, 'Ашық', 1),
(2, 'Қостанай облысы', '2026-05-01', 19, 'Бұлтты', 1),
(3, 'Солтүстік Қазақстан', '2026-05-02', 15, 'Жаңбыр', 0),
(4, 'Павлодар облысы', '2026-05-02', 24, 'Ашық', 1),
(5, 'Түркістан облысы', '2026-05-03', 30, 'Ашық', 1),
(6, 'Алматы облысы', '2026-05-03', 25, 'Желді', 1),
(7, 'Жамбыл облысы', '2026-05-04', 28, 'Ашық', 1),
(8, 'Ақтөбе облысы', '2026-05-04', 20, 'Бұлтты', 1),
(9, 'Батыс Қазақстан', '2026-05-05', 18, 'Жаңбыр', 0),
(10, 'Қарағанды облысы', '2026-05-05', 16, 'Бұлтты', 1),
(11, 'Шығыс Қазақстан', '2026-05-06', 14, 'Жаңбыр', 0),
(12, 'Қызылорда облысы', '2026-05-06', 32, 'Ашық', 1),
(13, 'Ақмола облысы', '2026-05-07', 21, 'Ашық', 1),
(14, 'Қостанай облысы', '2026-05-07', 23, 'Ашық', 1),
(15, 'Алматы облысы', '2026-05-08', 26, 'Ашық', 1);

insert into Tekhnika (id, oryndaushy_id, atauy, tehnika_tury, topyraq_tury, baga_molsheri, oltshem_birligi, geolocaciya_eni, geolocaciya_boilygy, statusy) values
(1, 2, 'МТЗ-82', 'Трактор', 'Қара топырақ', 5000.00, 'gektar', 51.160500, 71.470400, 'bos'),
(2, 2, 'John Deere 8R', 'Трактор', 'Сазды', 12000.00, 'gektar', 51.170000, 71.480000, 'bos'),
(3, 3, 'New Holland TC5.90', 'Комбайн', 'Қара топырақ', 15000.00, 'sagat', 50.400000, 80.200000, 'bos'),
(4, 3, 'Кировец К-744', 'Трактор', 'Құмдақ', 9000.00, 'gektar', 50.410000, 80.210000, 'bos_emez'),
(5, 4, 'Clas Lexion 770', 'Комбайн', 'Қара топырақ', 16000.00, 'sagat', 43.238949, 76.889709, 'bos'),
(6, 4, 'МТЗ-1221', 'Трактор', 'Сазды', 6000.00, 'gektar', 43.240000, 76.890000, 'bos'),
(7, 5, 'Case IH Magnum', 'Трактор', 'Қара топырақ', 11000.00, 'gektar', 42.341700, 69.590100, 'remontta'),
(8, 11, 'Valtra T239', 'Трактор', 'Құмдақ', 8500.00, 'gektar', 52.283300, 76.966700, 'bos'),
(9, 11, 'Acros 595 Plus', 'Комбайн', 'Қара топырақ', 14000.00, 'sagat', 52.290000, 76.970000, 'bos'),
(10, 12, 'Fendt 1050 Vario', 'Трактор', 'Сазды', 13500.00, 'gektar', 50.283900, 57.167000, 'bos'),
(11, 12, 'Massey Ferguson', 'Трактор', 'Қара топырақ', 7500.00, 'gektar', 50.290000, 57.170000, 'bos_emez'),
(12, 2, 'Xerion 4500', 'Трактор', 'Сазды', 12500.00, 'gektar', 51.180000, 71.490000, 'bos'),
(13, 3, 'Tucano 580', 'Комбайн', 'Қара топырақ', 14500.00, 'sagat', 50.420000, 80.220000, 'bos'),
(14, 4, 'Belarus 82.1', 'Трактор', 'Құмдақ', 4500.00, 'gektar', 43.250000, 76.900000, 'bos'),
(15, 5, 'John Deere S770', 'Комбайн', 'Қара топырақ', 17000.00, 'sagat', 42.350000, 69.600000, 'bos');

insert into Tekhnika_kestesi (id, tehnika_id, kuni, bos_pa) values
(1, 1, '2026-05-01', 1),
(2, 2, '2026-05-01', 1),
(3, 3, '2026-05-02', 1),
(4, 4, '2026-05-02', 0),
(5, 5, '2026-05-03', 1),
(6, 6, '2026-05-03', 1),
(7, 7, '2026-05-04', 0),
(8, 8, '2026-05-04', 1),
(9, 9, '2026-05-05', 1),
(10, 10, '2026-05-05', 1),
(11, 11, '2026-05-06', 0),
(12, 12, '2026-05-06', 1),
(13, 13, '2026-05-07', 1),
(14, 14, '2026-05-07', 1),
(15, 15, '2026-05-08', 1);

insert into Brondau (id, fermer_id, tehnika_id, bastalyp_uaqyty, ayaqtalyp_uaqyty, jalpy_kunu, statusy, jasalgan_uaqyty) values
(1, 6, 1, '2026-05-01 08:00:00', '2026-05-01 18:00:00', 50000.00, 'ayaqtaldy', '2026-04-25 10:00:00'),
(2, 7, 2, '2026-05-01 09:00:00', '2026-05-01 19:00:00', 120000.00, 'ayaqtaldy', '2026-04-26 11:00:00'),
(3, 8, 3, '2026-05-02 08:30:00', '2026-05-02 17:30:00', 135000.00, 'oryndaluda', '2026-04-27 12:00:00'),
(4, 9, 5, '2026-05-03 08:00:00', '2026-05-03 20:00:00', 192000.00, 'qabyldandy', '2026-04-28 09:30:00'),
(5, 10, 6, '2026-05-03 10:00:00', '2026-05-03 18:00:00', 48000.00, 'kutu', '2026-04-29 14:00:00'),
(6, 13, 8, '2026-05-04 08:00:00', '2026-05-04 16:00:00', 68000.00, 'kutu', '2026-04-30 15:10:00'),
(7, 14, 9, '2026-05-05 09:00:00', '2026-05-05 19:00:00', 140000.00, 'qabyldandy', '2026-05-01 08:15:00'),
(8, 15, 10, '2026-05-05 08:00:00', '2026-05-05 17:00:00', 121500.00, 'kutu', '2026-05-01 09:20:00'),
(9, 6, 12, '2026-05-06 08:00:00', '2026-05-06 18:00:00', 125000.00, 'kutu', '2026-05-02 10:00:00'),
(10, 7, 13, '2026-05-07 08:00:00', '2026-05-07 18:00:00', 145000.00, 'kutu', '2026-05-03 11:00:00'),
(11, 8, 14, '2026-05-07 09:00:00', '2026-05-07 17:00:00', 36000.00, 'kutu', '2026-05-03 12:30:00'),
(12, 9, 15, '2026-05-08 08:00:00', '2026-05-08 20:00:00', 204000.00, 'kutu', '2026-05-04 13:40:00'),
(13, 10, 1, '2026-05-09 08:00:00', '2026-05-09 18:00:00', 50000.00, 'kutu', '2026-05-05 14:00:00'),
(14, 13, 2, '2026-05-10 08:00:00', '2026-05-10 18:00:00', 120000.00, 'kutu', '2026-05-06 15:00:00'),
(15, 14, 3, '2026-05-11 08:00:00', '2026-05-11 18:00:00', 150000.00, 'kutu', '2026-05-07 16:00:00');

insert into Qr_rastau (id, brondau_id, qr_token, kelgen_uaqyty, ayaqtalgan_uaqyty, statusy) values
(1, 1, 'QR_TOKEN_HASH_001', '2026-05-01 08:05:00', '2026-05-01 18:02:00', 'jumys_ayaqtaldy'),
(2, 2, 'QR_TOKEN_HASH_002', '2026-05-01 09:10:00', '2026-05-01 19:05:00', 'jumys_ayaqtaldy'),
(3, 3, 'QR_TOKEN_HASH_003', '2026-05-02 08:35:00', null, 'jumys_bastaldy'),
(4, 4, 'QR_TOKEN_HASH_004', null, null, 'kutu'),
(5, 5, 'QR_TOKEN_HASH_005', null, null, 'kutu'),
(6, 6, 'QR_TOKEN_HASH_006', null, null, 'kutu'),
(7, 7, 'QR_TOKEN_HASH_007', null, null, 'kutu'),
(8, 8, 'QR_TOKEN_HASH_008', null, null, 'kutu'),
(9, 9, 'QR_TOKEN_HASH_009', null, null, 'kutu'),
(10, 10, 'QR_TOKEN_HASH_010', null, null, 'kutu'),
(11, 11, 'QR_TOKEN_HASH_011', null, null, 'kutu'),
(12, 12, 'QR_TOKEN_HASH_012', null, null, 'kutu'),
(13, 13, 'QR_TOKEN_HASH_013', null, null, 'kutu'),
(14, 14, 'QR_TOKEN_HASH_014', null, null, 'kutu'),
(15, 15, 'QR_TOKEN_HASH_015', null, null, 'kutu');

insert into Escrow_tolemder (id, brondau_id, tolenetyn_soma, statusy, tolem_uaqyty) values
(1, 1, 50000.00, 'oryndaushyga_audaryldy', '2026-04-25 10:05:00'),
(2, 2, 120000.00, 'oryndaushyga_audaryldy', '2026-04-26 11:05:00'),
(3, 3, 135000.00, 'escrowda_ustalu', '2026-04-27 12:05:00'),
(4, 4, 192000.00, 'escrowda_ustalu', '2026-04-28 09:35:00'),
(5, 5, 48000.00, 'escrowda_ustalu', '2026-04-29 14:05:00'),
(6, 6, 68000.00, 'escrowda_ustalu', '2026-04-30 15:15:00'),
(7, 7, 140000.00, 'escrowda_ustalu', '2026-05-01 08:20:00'),
(8, 8, 121500.00, 'escrowda_ustalu', '2026-05-01 09:25:00'),
(9, 9, 125000.00, 'escrowda_ustalu', '2026-05-02 10:05:00'),
(10, 10, 145000.00, 'escrowda_ustalu', '2026-05-03 11:05:00'),
(11, 11, 36000.00, 'escrowda_ustalu', '2026-05-03 12:35:00'),
(12, 12, 204000.00, 'escrowda_ustalu', '2026-05-04 13:45:00'),
(13, 13, 50000.00, 'escrowda_ustalu', '2026-05-05 14:05:00'),
(14, 14, 120000.00, 'escrowda_ustalu', '2026-05-06 15:05:00'),
(15, 15, 150000.00, 'escrowda_ustalu', '2026-05-07 16:05:00');

insert into Pikirler_haim_reiting (id, brondau_id, fermer_id, oryndaushy_id, baga, pikir_matini, qaldyrylgan_uaqyty) values
(1, 1, 6, 2, 5, 'Техника уақытында келді, жұмыс өте сапалы атқарылды. Рахмет!', '2026-05-01 19:00:00'),
(2, 2, 7, 2, 5, 'Керемет жұмыс! Оператор өз ісінің кәсіби маманы екен.', '2026-05-01 20:00:00'),
(3, 3, 8, 3, 4, 'Жалпы жаман емес, бірақ аздап кешігіп келді.', '2026-05-02 18:00:00'),
(4, 4, 9, 4, 5, 'Өте ұнады, келесі жолы да осы кісіден жалдаймын.', '2026-05-03 21:00:00'),
(5, 5, 10, 4, 4, 'Жақсы қызмет көрсетілді.', '2026-05-03 19:00:00'),
(6, 6, 13, 11, 5, 'Трактор жағдайы өте жақсы.', '2026-05-04 17:00:00'),
(7, 7, 14, 11, 5, 'Жұмыс жылдам әрі сапалы жасалды.', '2026-05-05 20:00:00'),
(8, 8, 15, 12, 4, 'Бәрі ойдағыдай өтті.', '2026-05-05 18:00:00'),
(9, 9, 6, 12, 5, 'Тамаша сервистік жүйе, QR арқылы растау өте ыңғайлы екен.', '2026-05-06 19:00:00'),
(10, 10, 7, 3, 5, 'Комбайн таза орып шықты, рахмет.', '2026-05-07 19:00:00'),
(11, 11, 8, 4, 4, 'Жаман емес, ұнады.', '2026-05-07 18:00:00'),
(12, 12, 9, 5, 5, 'Жоғары деңгейде қызмет көрсетті!', '2026-05-08 21:00:00'),
(13, 13, 10, 2, 5, 'Бәрі сәтті өтті, ешқандай проблема болған жоқ.', '2026-05-09 19:00:00'),
(14, 14, 13, 2, 4, 'Трактор күшті жұмыс істеді.', '2026-05-10 19:00:00'),
(15, 15, 14, 3, 5, 'Өте тәртіпті орындаушы, алғыс айтамын.', '2026-05-11 19:00:00');


SELECT * FROM Paiydalanyshylar;
SELECT * FROM Aua_raiy;
SELECT * FROM Tekhnika;
SELECT * FROM Tekhnika_kestesi;
SELECT * FROM Brondau;
SELECT * FROM Qr_rastau;
SELECT * FROM Escrow_tolemder;
SELECT * FROM Pikirler_haim_reiting;









insert into Tekhnika_kestesi (id, tehnika_id, kuni,bos_pa) values
(16, 15,'2026-05-21',1);
