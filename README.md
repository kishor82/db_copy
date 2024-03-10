---

# PostgreSQL Database Migration with pgcopydb

This repository contains a Docker Compose setup for performing a proof-of-concept (POC) database migration using pgcopydb. The migration involves copying data from a source PostgreSQL database, initialized with the Pagila sample database, to a target PostgreSQL database.

## Overview

The setup consists of the following services:

1. **source**: PostgreSQL database initialized with the Pagila sample database.
2. **target**: Empty PostgreSQL database where the data will be copied.
3. **pgadmin**: pgAdmin web interface for managing PostgreSQL databases.
4. **pgcopydb**: Containerized pgcopydb tool for copying data from the source to the target database.

## Requirements

- Docker
- Docker Compose

## Usage

1. Clone this repository:

   ```bash
   git clone <repository_url>
   ```

2. Navigate to the cloned directory:

   ```bash
   cd <repository_directory>
   ```

3. Start the Docker Compose services:

   ```bash
   docker-compose up -d
   ```

4. Access pgAdmin at [http://localhost:5050](http://localhost:5050) (default credentials: admin@admin.com / root) to manage the PostgreSQL databases.

5. Use pgcopydb to copy data from the source to the target database. You can run pgcopydb directly with Docker or use the provided shell script `copydb.sh`.

   To run pgcopydb directly with Docker:

   ```bash
   docker run --rm -it --network <network_name> dimitri/pgcopydb:v0.15 /bin/bash
   ```

   Once inside the container, you can execute the pgcopydb commands as needed.

6. After migration, you can access the target database to verify the copied data.

## Environment Variables

The `pgcopydb` service uses the following environment variables:

- **PGCOPYDB_SOURCE_PGURI**: PostgreSQL URI for the source database.
- **PGCOPYDB_TARGET_PGURI**: PostgreSQL URI for the target database.
- **PGCOPYDB_TARGET_TABLE_JOBS**: Number of jobs for copying tables.
- **PGCOPYDB_TARGET_INDEX_JOBS**: Number of jobs for copying indexes.

## Notes

- Ensure that the necessary PostgreSQL database dumps or initialization scripts are present in the respective volumes (`source_data` and `target_data`) as required by the services.

---


