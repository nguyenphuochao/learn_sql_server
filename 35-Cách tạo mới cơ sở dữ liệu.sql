CREATE DATABASE mydatabase

create database NVDB
on
(
  name = 'nvdb_data',
  filename = 'c:\data\nvdb_data.mdf',
  size = 10MB,
  maxsize = 100MB,
  filegrowth = 5MB)
log on
(
  name = 'nvdb_log',
  filename = 'c:\data\nvdb_log.ldf',
  size = 5MB,
  maxsize = 50MB,
  filegrowth = 5MB)