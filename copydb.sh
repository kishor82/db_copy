#!/bin/bash

export PGCOPYDB_SOURCE_PGUR="postgres://postgres:123456@pagila/postgres"
export PGCOPYDB_TARGET_PGURI="postgres://postgres:h4ckm3@target/postgres"

 # pgcopydb copy-db --table-jobs 8 --index-jobs 2
 
 pgcopydb --version

