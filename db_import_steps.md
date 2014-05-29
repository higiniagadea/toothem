Pasos para importar la base de datos

```
#dentro del directorio del proyecto

psql -U postgres

#dentro de la consola de postgres

  create role toothem with password '';

  drop database toothem_development ;

  create database toothem_development ;

#salir de la consola de postgres

psql -U postgres toothem_development < toothem_development.dmp
```
