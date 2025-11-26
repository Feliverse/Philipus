#!/usr/bin/env bash

set -o errexit

chmod +x bin/*

bundle install
bin/rails assets:precompile
bin/rails assets:clean

# Only run migrations during build if a database URL is configured.
# In hosted build environments (like Render) there's often no DB available
# during the build step; running migrations there will fail. We check for
# DATABASE_URL and skip migrations if it's not set.
echo "Skipping db:migrate in build step. Run migrations in your release step or manually."