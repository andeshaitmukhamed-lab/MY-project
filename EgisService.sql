create table Paiydalanyshylar (
    id int primary key,
    roli varchar(20) not null check (roli in ('fermer', 'oryndaushy', 'administrator')),
    aty_jony varchar(100) not null,
    telefon varchar(20) not null,
    elektronik_poshta varchar(100),
    kupiya_soz varchar(255) not null,
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
    statusy varchar(20) check (statusy in ('bense', 'bos_emez', 'remontta')),
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
    qr_token varchar(255) not null,
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