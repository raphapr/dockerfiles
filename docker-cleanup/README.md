# docker-cleanup

It will periodically clean up exited containers and remove images and volumes that aren't in use by a running container.

## Usage

Docker:
```sh
$ docker run -v /var/run/docker.sock:/var/run/docker.sock --privileged -e SCHEDULE=@daily raphaelpr/docker-cleanup
```

### Automatic Periodic Backups

More information about the scheduling can be found [here](http://godoc.org/github.com/robfig/cron#hdr-Predefined_schedules).
