-- migrate:up

-- This is the minialized version of the database. Triggers and functions are removed since they see no use without the table called 'user_info'

-- Created a schema so that granting privileges to certain users is more controlled and clear. This on the other hand makes naming less explicit
CREATE EXTENSION vector;

CREATE TABLE IF NOT EXISTS cvs (
  id bigserial PRIMARY KEY,
  embedding vector(3)
);

-- REVOKE ALL PRIVILEGES ON SCHEMA n8n FROM public;
-- GRANT USAGE ON SCHEMA n8n TO pgvector;
-- GRANT ALL ON ALL TABLES IN SCHEMA n8n TO pgvector;
-- GRANT ALL ON ALL SEQUENCES IN SCHEMA n8n TO pgvector;
-- ALTER ROLE n8n SET timezone='Europe/Helsinki';


-- migrate:down

-- DROP SCHEMA n8n CASCADE;
