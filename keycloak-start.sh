#!/bin/sh

# Clear first
docker compose down

# Start keycloak
docker compose up -d

# Wait keycloak started
RETRIES=10
CHECK=0
until [ "$CHECK" != 0 ]; do
  STATUS_CODE=$(curl -o /dev/null -s -w "%{http_code}" -L -X GET 'http://localhost:8080/auth')
	echo "Keycloak-HTTP-Response: $STATUS_CODE - $RETRIES"
	if [ "$STATUS_CODE" == "200" ]; then
	  let "CHECK=1"
	  echo "Keycloak is ready."
	else
		if [ $RETRIES -gt 0 ]; then
      let "RETRIES-=1"
      echo "Keycloak is starting, ${RETRIES} attempts left. Retry in 30 seconds..."
      sleep 30
    else
      echo "Failed to connect to Keycloak"
      exit 1
    fi
	fi
done

# Enable direct access for testing
docker exec -it docker-keycloak-db psql -U keycloak \
-c 'UPDATE client SET direct_access_grants_enabled=true;'
