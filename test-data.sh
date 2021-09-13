#!/bin/sh

# Login with offline_access scope
function login() {
curl -s -L -X \
  POST 'http://localhost:8080/auth/realms/master/protocol/openid-connect/token' \
  -H 'Content-Type: application/x-www-form-urlencoded' \
  --data-urlencode 'client_id=account' \
  --data-urlencode 'grant_type=password' \
  --data-urlencode 'scope=offline_access' \
  --data-urlencode "username=$1" \
  --data-urlencode 'password=123'
}

login user_a
login user_b
login user_a
