-- from the terminal run:
-- psql < outer_space.sql



DROP DATABASE IF EXISTS outer_space;

CREATE DATABASE outer_space;

\c outer_space

CREATE TABLE planets
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  orbital_period_in_years FLOAT NOT NULL,
  orbits_around TEXT NOT NULL,
  galaxy TEXT NOT NULL,
  moons TEXT[]
);

INSERT INTO planets
  (name, orbital_period_in_years, orbits_around, galaxy, moons)
VALUES
  ('Earth', 1.00, 'The Sun', 'Milky Way', '{"The Moon"}'),
  ('Mars', 1.88, 'The Sun', 'Milky Way', '{"Phobos", "Deimos"}'),
  ('Venus', 0.62, 'The Sun', 'Milky Way', '{}'),
  ('Neptune', 164.8, 'The Sun', 'Milky Way', '{"Naiad", "Thalassa", "Despina", "Galatea", "Larissa", "S/2004 N 1", "Proteus", "Triton", "Nereid", "Halimede", "Sao", "Laomedeia", "Psamathe", "Neso"}'),
  ('Proxima Centauri b', 0.03, 'Proxima Centauri', 'Milky Way', '{}'),
  ('Gliese 876 b', 0.23, 'Gliese 876', 'Milky Way', '{}');


-- Instead of storing an array of strings for the moons, we should create a separate table. It would look like this:

CREATE TABLE moons
(
  moon_id serial primary key,
  planets_id integer references planets (id),
  name text not null,
  diameter int not null,
  surface_temp int not null
);

insert into moons
  (planets_id, name, diameter, surface_temp)
values
  (1, 'The Moon', 500, 10),
  (2, 'Phobos', 500, 10),
  (2, 'Demios', 500, 10),
  (4, 'Naiad', 500, 10);

-- and so on 

alter table planets 
drop column moons;

-- to join

select * from planets p
left join moons m on p.id = m.planets_id;