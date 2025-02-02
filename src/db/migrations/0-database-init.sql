-- migrate:up

-- This is the minialized version of the database. Triggers and functions are removed since they see no use without the table called 'user_info'
-- All the other tables, triggers, functions and some test functions can be found in the file 'database_with_nonused_stuff.sql'
-- Also, created a check for duration that the posted time is a positive value and within a quarter-hours reach, E.g 7.25h, 8.00h or 3.75h

-- Created a schema so that granting privileges to certain users is more controlled and clear. This on the other hand makes naming less explicit


CREATE SCHEMA IF NOT EXISTS n8n;

CREATE TABLE IF NOT EXISTS cvs (
  id bigserial PRIMARY KEY,
  embedding vector(3)
);

CREATE TABLE IF NOT EXISTS n8n.cvs (
  id              VARCHAR(16) PRIMARY KEY,
  name            VARCHAR(128) NOT NULL
);

REVOKE ALL PRIVILEGES ON SCHEMA n8n FROM public;
GRANT USAGE ON SCHEMA n8n TO pgvector;
GRANT ALL ON ALL TABLES IN SCHEMA n8n TO pgvector;
GRANT ALL ON ALL SEQUENCES IN SCHEMA n8n TO pgvector;
ALTER ROLE n8n SET timezone='Europe/Helsinki';


-- migrate:down

DROP SCHEMA n8n CASCADE;
