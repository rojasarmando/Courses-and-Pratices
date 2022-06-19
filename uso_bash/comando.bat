@echo off
cls
title Armando Rojas
color 4f
cls
echo Cargar schema
mysql -u root -p < SQL_PLATZI.sql
echo Cargar Datos
mysql -u root -p -D pruebaplatzi < ALL_DATA.sql