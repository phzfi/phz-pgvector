-- migrate:up

-- This is the minialized version of the database. Triggers and functions are removed since they see no use without the table called 'user_info'

-- Created a schema so that granting privileges to certain users is more controlled and clear. This on the other hand makes naming less explicit
CREATE EXTENSION vector;

-- note! n8n creates the tables automatically
CREATE TABLE IF NOT EXISTS data (
  id UUID PRIMARY KEY NOT NULL DEFAULT uuid_generate_v4(),
  text TEXT,
  metadata JSONB,
  embedding VECTOR(3)
);

-- REVOKE ALL PRIVILEGES ON SCHEMA n8n FROM public;
-- GRANT USAGE ON SCHEMA n8n TO pgvector;
-- GRANT ALL ON ALL TABLES IN SCHEMA n8n TO pgvector;
-- GRANT ALL ON ALL SEQUENCES IN SCHEMA n8n TO pgvector;
-- ALTER ROLE n8n SET timezone='Europe/Helsinki';


-- migrate:down

-- DROP SCHEMA n8n CASCADE;
