DROP TABLE IF EXISTS trainings;
DROP TABLE IF EXISTS horses;
DROP TABLE IF EXISTS owners;
DROP TABLE IF EXISTS trainers;

CREATE TABLE trainers (
  id SERIAL4 PRIMARY KEY,
  first_name VARCHAR(255) NOT NULL,
  last_name VARCHAR(255) NOT NULL
);

CREATE TABLE owners (
  id SERIAL4 PRIMARY KEY,
  first_name VARCHAR(255) NOT NULL,
  last_name VARCHAR(255) NOT NULL
);

CREATE TABLE horses (
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  breed VARCHAR(255),
  health_details TEXT,
  current_activity VARCHAR(255),
  owner_id INT4 REFERENCES owners(id)
);

CREATE TABLE trainings (
  id SERIAL4 PRIMARY KEY,
  type VARCHAR(255),
  scheduled_time VARCHAR(255),
  duration INT2,
  scheduled_date VARCHAR(255),
  day_of_week VARCHAR(255),
  horse_id INT4 REFERENCES horses(id) ON DELETE CASCADE,
  trainer_id INT4 REFERENCES trainers(id) ON DELETE CASCADE
);
