create database fatec_ride;
use fatec_ride;

create table motorista(
	motorista_id int primary key auto_increment,
    nome varchar(25) not null,
    sobrenome varchar(25) not null,
    email varchar(60) not null unique,
    senha varchar(100) not null,
    matricula varchar(20) not null,
    cnh varchar(20) not null
);

create table passageiro(
	passageiro_id int primary key auto_increment,
    nome varchar(25) not null,
    sobrenome varchar(25) not null,
    email varchar(60) not null unique,
    senha varchar(100) not null,
    matricula varchar(20) not null
);

create table veiculo(
	placa varchar(30) primary key unique,
    cor varchar(30) not null,
    capacidade int,
    motorista_id int,
    foreign key(motorista_id) references motorista( motorista_id)

);