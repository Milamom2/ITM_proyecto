\# Examen 2 - Orquestación de Contenedores y Microservicios



\## Instituto Tecnológico Metropolitano - ITM

\*\*Asignatura:\*\* Software Empresarial  

\*\*Evaluación:\*\* Evaluación 2 - Segundo Seguimiento  

\*\*Tema:\*\* Orquestación, contenerización y microservicios



\---



\## Descripción



Este proyecto implementa la orquestación mediante Docker Compose de las dos APIs desarrolladas previamente:



\- API de Festivos, desarrollada con Node.js / Express.

\- API de Calendario Laboral, desarrollada con Spring Boot.



Cada API utiliza su propia base de datos y los cuatro servicios se ejecutan como contenedores independientes conectados mediante la red Docker `redcalendario`.



\---



\## Arquitectura



La solución está compuesta por cuatro servicios:



\### 1. MongoDB

Base de datos utilizada por la API de Festivos.



\- Imagen: `mongo:7`

\- Contenedor: `mongodb-festivos`

\- Puerto: `27017`

\- Base de datos: `festivos`



\### 2. API Festivos

Microservicio encargado de consultar y verificar los días festivos.



\- Tecnología: Node.js / Express

\- Contenedor: `apifestivos`

\- Puerto: `3030`

\- Base de datos: MongoDB



\### 3. PostgreSQL

Base de datos utilizada por la API de Calendario Laboral.



\- Imagen: `postgres:16`

\- Contenedor: `postgres-calendario`

\- Puerto: `5432`

\- Base de datos: `CalendarioLaboral`



\### 4. API Calendario Laboral

Microservicio encargado de generar y consultar el calendario anual clasificando los días como laborales, fines de semana o festivos.



\- Tecnología: Java / Spring Boot

\- Contenedor: `apicalendariolaboral`

\- Puerto: `8080`

\- Base de datos: PostgreSQL

\- Consume la API de Festivos.



\---



\## Red de contenedores



Todos los servicios se encuentran conectados mediante la red:



`redcalendario`



La comunicación interna se realiza utilizando los nombres de los servicios definidos en Docker Compose.



Arquitectura general:



MongoDB → API Festivos → API Calendario Laboral → PostgreSQL



Los cuatro componentes se encuentran contenerizados y comunicados dentro de la misma red Docker.



\---



\## Ejecución del proyecto



Para construir las imágenes e iniciar toda la arquitectura:



```bash

docker compose up -d --build

