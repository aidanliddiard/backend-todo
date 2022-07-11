-- Use this file to define your SQL tables
-- The SQL in this file will be executed when you run `npm run setup-db`
DROP TABLE IF EXISTS todousers;
DROP TABLE IF EXISTS todos;

CREATE TABLE todousers (
  id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  email VARCHAR NOT NULL UNIQUE,
  password_hash VARCHAR NOT NULL
);

CREATE TABLE todos (
  id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  item VARCHAR NOT NULL,
  user_id BIGINT ,
  done BOOLEAN NOT NULL DEFAULT(false),
  FOREIGN KEY (user_id) REFERENCES todousers(id)
)
