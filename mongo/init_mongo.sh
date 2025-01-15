#!/bin/bash

# Importar los datos enriquecidos de aerolíneas como la colección 'origin_dest_distances'
mongoimport -d agile_data_science -c origin_dest_distances --file /data/db/origin_dest_distances.jsonl

# Crear índice para 'Origin' y 'Dest' en la colección 'origin_dest_distances'
mongosh agile_data_science --eval 'db.origin_dest_distances.createIndex({Origin: 1, Dest: 1})'
