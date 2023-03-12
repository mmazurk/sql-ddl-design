-- from the terminal run:
-- psql < air_traffic.sql

DROP DATABASE IF EXISTS air_traffic;

CREATE DATABASE air_traffic;

\c air_traffic

CREATE TABLE tickets
(
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL,
  seat TEXT NOT NULL,
  departure TIMESTAMP NOT NULL,
  arrival TIMESTAMP NOT NULL,
  airline TEXT NOT NULL,
  from_city TEXT NOT NULL,
  from_country TEXT NOT NULL,
  to_city TEXT NOT NULL,
  to_country TEXT NOT NULL
);

INSERT INTO tickets
  (first_name, last_name, seat, departure, arrival, airline, from_city, from_country, to_city, to_country)
VALUES
  ('Jennifer', 'Finch', '33B', '2018-04-08 09:00:00', '2018-04-08 12:00:00', 'United', 'Washington DC', 'United States', 'Seattle', 'United States'),
  ('Thadeus', 'Gathercoal', '8A', '2018-12-19 12:45:00', '2018-12-19 16:15:00', 'British Airways', 'Tokyo', 'Japan', 'London', 'United Kingdom'),
  ('Sonja', 'Pauley', '12F', '2018-01-02 07:00:00', '2018-01-02 08:03:00', 'Delta', 'Los Angeles', 'United States', 'Las Vegas', 'United States'),
  ('Jennifer', 'Finch', '20A', '2018-04-15 16:50:00', '2018-04-15 21:00:00', 'Delta', 'Seattle', 'United States', 'Mexico City', 'Mexico'),
  ('Waneta', 'Skeleton', '23D', '2018-08-01 18:30:00', '2018-08-01 21:50:00', 'TUI Fly Belgium', 'Paris', 'France', 'Casablanca', 'Morocco'),
  ('Thadeus', 'Gathercoal', '18C', '2018-10-31 01:15:00', '2018-10-31 12:55:00', 'Air China', 'Dubai', 'UAE', 'Beijing', 'China'),
  ('Berkie', 'Wycliff', '9E', '2019-02-06 06:00:00', '2019-02-06 07:47:00', 'United', 'New York', 'United States', 'Charlotte', 'United States'),
  ('Alvin', 'Leathes', '1A', '2018-12-22 14:42:00', '2018-12-22 15:56:00', 'American Airlines', 'Cedar Rapids', 'United States', 'Chicago', 'United States'),
  ('Berkie', 'Wycliff', '32B', '2019-02-06 16:28:00', '2019-02-06 19:18:00', 'American Airlines', 'Charlotte', 'United States', 'New Orleans', 'United States'),
  ('Cory', 'Squibbes', '10D', '2019-01-20 19:30:00', '2019-01-20 22:45:00', 'Avianca Brasil', 'Sao Paolo', 'Brazil', 'Santiago', 'Chile');


-- For this you need to start over and make new tables: 

-- region
-- country
-- city
-- airline
-- flight
-- passenger
-- flight (join table)


CREATE TABLE "region" (
    "region_id" int   NOT NULL,
    "region_name" text   NOT NULL,
    CONSTRAINT "pk_region" PRIMARY KEY (
        "region_id"
     )
);

CREATE TABLE "country" (
    "country_id" int   NOT NULL,
    "country_name" text   NOT NULL,
    "region_id" int   NOT NULL,
    CONSTRAINT "pk_country" PRIMARY KEY (
        "country_id"
     )
);

CREATE TABLE "city" (
    "city_id" int   NOT NULL,
    "city_name" text   NOT NULL,
    "country_id" int   NOT NULL,
    CONSTRAINT "pk_city" PRIMARY KEY (
        "city_id"
     )
);

CREATE TABLE "passengers" (
    "passenger_id" int   NOT NULL,
    "region_id" int   NOT NULL,
    "country_id" int   NOT NULL,
    "flight_number" int   NOT NULL,
    "seat" text not null,
    "firstname" text   NOT NULL,
    "lastname" text   NOT NULL,
    "email" text   NOT NULL,
    CONSTRAINT "pk_passengers" PRIMARY KEY (
        "passenger_id"
     )
);

CREATE TABLE "airline" (
    "airline_id" int   NOT NULL,
    "name" text   NOT NULL,
    CONSTRAINT "pk_airline" PRIMARY KEY (
        "airline_id"
     ),
    CONSTRAINT "uc_airline_name" UNIQUE (
        "name"
    )
);

CREATE TABLE "flight" (
    "flight_number" int   NOT NULL,
    "flight_descrition" text   NOT NULL,
    "airline_id" int   NOT NULL,
    "from_city" int   NOT NULL,
    "to_city" int   NOT NULL,
    CONSTRAINT "pk_flight" PRIMARY KEY (
        "flight_number"
     )
);

ALTER TABLE "country" ADD CONSTRAINT "fk_country_region_id" FOREIGN KEY("region_id")
REFERENCES "region" ("region_id");

ALTER TABLE "city" ADD CONSTRAINT "fk_city_country_id" FOREIGN KEY("country_id")
REFERENCES "country" ("country_id");

ALTER TABLE "passengers" ADD CONSTRAINT "fk_passengers_region_id" FOREIGN KEY("region_id")
REFERENCES "region" ("region_id");

ALTER TABLE "passengers" ADD CONSTRAINT "fk_passengers_country_id" FOREIGN KEY("country_id")
REFERENCES "country" ("country_id");

ALTER TABLE "passengers" ADD CONSTRAINT "fk_passengers_flight_number" FOREIGN KEY("flight_number")
REFERENCES "flight" ("flight_number");

ALTER TABLE "flight" ADD CONSTRAINT "fk_flight_airline_id" FOREIGN KEY("airline_id")
REFERENCES "airline" ("airline_id");

ALTER TABLE "flight" ADD CONSTRAINT "fk_flight_from_city" FOREIGN KEY("from_city")
REFERENCES "city" ("city_id");

ALTER TABLE "flight" ADD CONSTRAINT "fk_flight_to_city" FOREIGN KEY("to_city")
REFERENCES "city" ("city_id");


-- region
-- -
-- region_id int pk
-- region_name text

-- country
-- -
-- country_id int pk
-- country_name text
-- region_id int fk >- region.region_id

-- city
-- -
-- city_id int pk
-- city_name text
-- country_id int fk >- country.country_id

-- passengers
-- -
-- passenger_id int pk
-- region_id int fk >- region.region_id
-- country_id int fk >- country.country_id
-- flight_number int fk >- flight.flight_number
-- seat text
-- firstname text
-- lastname text
-- email text

-- airline
-- -
-- airline_id int pk
-- name text unique

-- flight
-- -
-- flight_number int pk
-- flight_descrition text
-- airline_id int fk >- airline.airline_id
-- from_city int fk >- city.city_id
-- to_city int fk >- city.city_id