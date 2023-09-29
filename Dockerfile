FROM postgres:latest

ENV POSTGRES_PASSWORD docker
ENV POSTGRES_DB world

RUN apt-get update && apt-get install -y wget
RUN wget https://ftp.postgresql.org/pub/projects/pgFoundry/dbsamples/world/dbsamples-0.1/dbsamples-0.1.tar.gz
RUN tar -xf dbsamples-0.1.tar.gz
RUN rm dbsamples-0.1.tar.gz
RUN cp dbsamples-0.1/world/world.sql /docker-entrypoint-initdb.d/

# Note the difference between the above and below commands
# RUN cp runs a copy within the docker context, COPY copies a local file into docker
# COPY dbsamples-0.1/world/world.sql /docker-entrypoint-initdb.d/