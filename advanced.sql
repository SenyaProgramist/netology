create table lang(
language_id serial primary key,
title varchar(10) not null unique
);

create table language_group(
group_id serial primary key,
title varchar(20) not null unique
);

create table country(
country_id serial primary key,
country varchar(20) not null unique
);

create table lang_group(
lang_id integer not null,
group_id integer,
primary key(lang_id, group_id),
foreign key(lang_id) references lang(language_id),
foreign key(group_id) references language_group(group_id)

);

create table group_country(
group_id integer not null,
country_id integer,
primary key(group_id, country_id),
foreign key(country_id) references country(country_id),
foreign key(group_id) references language_group(group_id)
);

insert into lang(title)
values ('russian'), ('english'), ('chinese'), ('german'), ('japonais')

insert into language_group(title)
values ('slovak'), ('indo-european'), ('asian')

insert into country(country)
values ('russia'), ('britain'), ('china'), ('japan')

insert into lang_group(lang_id, group_id)
values (2, 2), (1, 3), (4, 1), (3, 2), (3, 3)

insert into group_country
values (2, 2), (1, 3), (3, 1), (3, 4), (3, 3)









