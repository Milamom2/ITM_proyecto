#!/bin/bash
# mongosh ignora silenciosamente los scripts con "use <bd>;" cuando se
# ejecutan con --file (docker-entrypoint-initdb.d), por eso se elimina
# esa línea y se fuerza la BD en la cadena de conexión.
sed '/^use /d' /init-src/BDFestivos.mjs | mongosh --quiet "mongodb://localhost:27017/festivos"
