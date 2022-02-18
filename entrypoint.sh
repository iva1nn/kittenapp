#!/bin/bash
set -e
# Sleep added to prevent app container start before postgres
sleep 5

# DB will be created when postgres container starts
#rake db:create
rake db:migrate
rake db:seed
rackup --port 3000 --host 0.0.0.0

exec "$@"