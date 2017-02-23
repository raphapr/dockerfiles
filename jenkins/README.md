## Synopsis

**Jenkins** is an open source automation server written in Java. This image contains a Jenkins installation with RVM/Ruby2.2.5/Bundler and permissions to execute Docker inside.

## Code Example

```bash
$ docker run -p 8080:8080 -v /your/home:/var/jenkins_home -v /var/run/docker.sock:/var/run/docker.sock -v /usr/bin/docker:/usr/bin/docker jenkins

```
This will store the jenkins data in /your/home on the host. Ensure that /your/home is accessible by the jenkins user in container (jenkins user - uid 1000) or use -u some_other_user parameter with docker run.

## Installation

```bash
$ docker pull raphaelpr/jenkins:latest
```

#### Troubleshooting

```
docker logs <your-jenkins-container-name>
```

#### More information

- [How to use this image](https://hub.docker.com/_/jenkins/)
