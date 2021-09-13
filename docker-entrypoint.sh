#!/bin/sh

# Add 2 user
/opt/jboss/keycloak/bin/add-user-keycloak.sh --user user_a --password 123

/opt/jboss/keycloak/bin/add-user-keycloak.sh --user user_b --password 123

update client set direct_access_grants_enabled=true;

# Start
/opt/jboss/tools/docker-entrypoint.sh
