# Error on loading offline session with parallel stream

# Reproduce Steps

1. Start Keycloak server

```
$ sh ./keycloak-start.sh
```

2. Add test data

```
$ sh ./test-data.sh
```

3. Go to [console](http://localhost:8080/auth/admin)
   1. Clear `User Cache` of `master` realm
   2. Go to `Offline Access` tab of `account` Clients
   3. Click `Show Offline Tokens`
   4. Error toast should be shown

4. See logs

```
$ docker logs docker-keycloak
```
