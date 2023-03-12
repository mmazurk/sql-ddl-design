
-- https://app.quickdatabasediagrams.com/#/
-- Just uncomment below and paste

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

-- users
-- -
-- user_id int pk
-- region_id int fk >- region.region_id
-- country_id int fk >- country.country_id
-- city_id int fk >- city.city_id
-- firstname text
-- lastname text
-- email text

-- posts
-- -
-- post_id int pk
-- user_id int fk >- users.user_id
-- region_id in fk >- region.region_id
-- country_id int fk >- country.country_id
-- city_id int fk >- city.city_id
-- title varchar(15)
-- text text

-- categories
-- -
-- category_id int pk
-- post_id int fk >- posts.post_id
-- name varchar(20) unique
-- description text


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

CREATE TABLE "users" (
    "user_id" int   NOT NULL,
    "region_id" int   NOT NULL,
    "country_id" int   NOT NULL,
    "city_id" int   NOT NULL,
    "firstname" text   NOT NULL,
    "lastname" text   NOT NULL,
    "email" text   NOT NULL,
    CONSTRAINT "pk_users" PRIMARY KEY (
        "user_id"
     )
);

CREATE TABLE "posts" (
    "post_id" int   NOT NULL,
    "user_id" int   NOT NULL,
    "region_id" in   NOT NULL,
    "country_id" int   NOT NULL,
    "city_id" int   NOT NULL,
    "title" varchar(15)   NOT NULL,
    "text" text   NOT NULL,
    CONSTRAINT "pk_posts" PRIMARY KEY (
        "post_id"
     )
);

CREATE TABLE "categories" (
    "category_id" int   NOT NULL,
    "post_id" int   NOT NULL,
    "name" varchar(20)   NOT NULL,
    "description" text   NOT NULL,
    CONSTRAINT "pk_categories" PRIMARY KEY (
        "category_id"
     ),
    CONSTRAINT "uc_categories_name" UNIQUE (
        "name"
    )
);

ALTER TABLE "country" ADD CONSTRAINT "fk_country_region_id" FOREIGN KEY("region_id")
REFERENCES "region" ("region_id");

ALTER TABLE "city" ADD CONSTRAINT "fk_city_country_id" FOREIGN KEY("country_id")
REFERENCES "country" ("country_id");

ALTER TABLE "users" ADD CONSTRAINT "fk_users_region_id" FOREIGN KEY("region_id")
REFERENCES "region" ("region_id");

ALTER TABLE "users" ADD CONSTRAINT "fk_users_country_id" FOREIGN KEY("country_id")
REFERENCES "country" ("country_id");

ALTER TABLE "users" ADD CONSTRAINT "fk_users_city_id" FOREIGN KEY("city_id")
REFERENCES "city" ("city_id");

ALTER TABLE "posts" ADD CONSTRAINT "fk_posts_user_id" FOREIGN KEY("user_id")
REFERENCES "users" ("user_id");

ALTER TABLE "posts" ADD CONSTRAINT "fk_posts_region_id" FOREIGN KEY("region_id")
REFERENCES "region" ("region_id");

ALTER TABLE "posts" ADD CONSTRAINT "fk_posts_country_id" FOREIGN KEY("country_id")
REFERENCES "country" ("country_id");

ALTER TABLE "posts" ADD CONSTRAINT "fk_posts_city_id" FOREIGN KEY("city_id")
REFERENCES "city" ("city_id");

ALTER TABLE "categories" ADD CONSTRAINT "fk_categories_post_id" FOREIGN KEY("post_id")
REFERENCES "posts" ("post_id");

