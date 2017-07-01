# docker-cleanup

It will periodically clean up exited containers and remove images and volumes that aren't in use by a running container.

## Usage

Docker:
```sh
$ docker run -v /var/run/docker.sock:/var/run/docker.sock -v /usr/bin/docker:/usr/bin/docker -e SCHEDULE=@daily raphaelpr/postgres-backup-s3
```

### Automatic Periodic Backups

More information about the scheduling can be found [here](http://godoc.org/github.com/robfig/cron#hdr-Predefined_schedules).
