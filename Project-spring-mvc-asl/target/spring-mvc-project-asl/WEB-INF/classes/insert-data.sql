CREATE TABLE users(
    email VARCHAR PRIMARY KEY NOT NULL,
    username varchar NOT NULL,
    password varchar NOT NULL,
    points int ,
    role varchar,
    banned int,
);