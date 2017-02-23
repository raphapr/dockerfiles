## Synopsis

**pgbouncer** is a popular, small connection pooler for Postgresql. This is yet another docker image with pgbouncer, based on alpine.

## Code Example
You can configure it by Environment variables:
```bash
$ docker run -d \
 --name=pgbouncer \
 -e DB_HOST=postgresql.example.com \
 -e DB_USER=admin \
 -e DB_PASSWORD=mypassword \
 raphaelpr/pgbouncer:latest
```
Or You can mount config file into docker container:
```bash
$ docker run -d \
 --name pgbouncer \
 -v pgbouncer-config-file:/etc/pgbouncer/pgbouncer.ini \
 raphaelpr/bgbouncer:latest
```

## Docker Compose Example

```
pgbouncer:
  hostname: pgbouncer
  image: raphaelpr/pgbouncer:latest
  ports:
    - "6432:6432"
  environment:
    - DB_HOST=localhost
    - DB_USER=username
    - DB_PASSWORD=password
    - POOL_MODE=session
    - MAX_CLIENT_CONN=100 
    - DEFAULT_POOL_SIZE=20
    - RESERVE_POOL_SIZE=5 
    - LISTEN_ADDR=*
    - AUTH_TYPE=plain
    - AUTH_FILE=/etc/pgbouncer/userlist.txt
```

## Installation

```bash
$ docker pull raphaelpr/pgbouncer:latest
```
## Configuration

All configuration parameters of pgbouncer are available both by *--env* (use the same keys in upper case) and by mounting pgbouncer.ini into container.

#### Troubleshooting

```
docker logs <your-pgbouncer-container-name>
```

#### This is a fork

Original repository: [brainsam/pgbouncer](https://github.com/brainsam/pgbouncer)
