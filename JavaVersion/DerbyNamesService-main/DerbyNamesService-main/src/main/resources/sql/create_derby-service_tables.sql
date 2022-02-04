-- Create DerbyName table
create table DerbyNames
(
    DerbyNameId int auto_increment,
    Name        varchar(400) not null,
    Number      varchar(400) null,
    DateAdded   datetime     not null,
    League      varchar(400) not null,
    constraint DerbyNames_DerbyNameId_uindex
        unique (DerbyNameId)
);

alter table DerbyNames
    add primary key (DerbyNameId);

-- Create Leagues table
create table Leagues
(
    LeagueId      int auto_increment,
    LeagueName    varchar(512) not null,
    URL           varchar(512) null,
    StateProvince varchar(3)   not null,
    CountryCode   varchar(3)   not null,
    constraint Leagues_LeagueId_uindex
        unique (LeagueId)
);

alter table Leagues
    add primary key (LeagueId);
