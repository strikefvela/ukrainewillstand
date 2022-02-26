FROM postgres
ENV POSTGRES_PASSWORD uk*rai$ne$stand22
ENV POSTGRES_DB ukraine
COPY backend/db_init.sql /docker-entrypoint-initdb.d/

FROM python:3

WORKDIR /home/app

#If we add the requirements and install dependencies first, docker can use cache if requirements don't change
ADD backend/requirements.txt /home/app
RUN pip install --no-cache-dir -r requirements.txt

ADD . /home/app
CMD python backend/server.py

EXPOSE 3000