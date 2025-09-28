-- Ensure we're on postgres database for creating new DB
\c postgres;

-- Drop DB if exists (for clean rebuilds)
DROP DATABASE IF EXISTS library_db;

-- Create DB with platform-agnostic locale settings
CREATE DATABASE library_db
    WITH OWNER = admin
    ENCODING = 'UTF8'
    LC_COLLATE = 'C'
    LC_CTYPE = 'C'
    TEMPLATE = template0;

-- Note: After running this script, connect to library_db:
-- \c library_db