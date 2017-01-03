# find.me Full Stack

This repository contains a prepared
[Docker](https://docker.com)
environment to simply build and run a stage environment.
The resulting environment contains all project related components and micro
services
([MongoDB database](https://github.com/kswe-2016-17/graphql-findme-mongodb),
[GraphQL service](https://github.com/kswe-2016-17/graphql-findme-graphql-service),
[web frontend](https://github.com/kswe-2016-17/graphql-findme-webapp)),
which are also correctly configured by needed configuration files and also
needed system environments including needed software being installed like
[NodeJS and npm](https://nodejs.org)
in correct version.
That said,
you only need a Docker installation,
everything else
(OS, system environment configuration, etc.)
doesn't matter in any case.

## Prerequisites

- [Docker Engine v1.12+](https://docs.docker.com/engine/installation/)
- [Docker Compose v1.9+](https://docs.docker.com/compose/install/)

## Using Docker Compose

As there are `Dockerfile`s to build all needed Docker images,
you may be able build the images manually.
Creating the Docker containers gets more complexity because the containers
depend on each other and need to be run in the correct order and also to be
configured correctly
(networking, links, volumes, etc.)
as some containers need to communicated with each other.

A very elegant way to build the images and create and run the containers is
to use the Docker Compose tool.
Besides the `Dockerfile`s this repository also contains a configured
`docker-compose.yml` file,
so you don't need to do any configuration and stuff.
The only thing you have to do is to run some simple Docker Compose commands
being described afterwards.

### Building/Creating/Running Docker images/containers (shorthand)

You can build Docker images and create and run the Docker containers with a
simple command:

```bash
docker-compose up -d
```

This builds Docker images if they don't exist already.
Then new Docker containers will be created if they don't exist already or the
images differ from the images,
the existing containers were build on.
After container creation the containers will be started in the correct order,
as some containers depend on other containers.

To rebuild the images and recreate the containers you can use the following
command:

```bash
docker-compose up -d --build --force-recreate
```

This will rebuild the images on configuration changes and also recreate the
containers if necessary,
but there are some exceptions which will not be explained here.
The easier way to handle this case is to use the commands described afterwards.
There also exist some opposite commands like `--no-build`,
which prevent some operations like preventing building updated images and also
recreating containers if the configuration got updated,
but you want to use and run the already existing images and containers.
But this goes too deep into detail to being described here.

### Stopping/Killing/Destroying Docker containers (shorthand)

You can stop/kill and destroy the service containers by executing the following
command:

```bash
docker-compose down -v
```

This will stop/kill running containers if necessary and then destroy them and
also destroy the networks which were created for the project.
The `-v` option tells the `down` command to delete the volumes which were
created/used implicitly (no explicit volume definitions/options) by the
containers.
Otherwise those volumes would stay on the file system and messing it up.
Explicitly defined/created volumes will stay anyway,
so to clean up them is up to you.
That said,
keep your system always clean by using the `-v` option or the `--volumes` long
option when removing containers.

### Building Docker images

If you want to build the Docker images explicitely or to force build updated
images,
e.g. the configuration has been changed
(updated repository or made custom changes)
or just because you want to,
you can force the build by the following command:

```bash
docker-compose build --no-cache --pull
```

The `--no-cache` option tells the build process to ignore existing caches.
This may be needed in some situations like if the previous build installed some
application which exists in an updated version since the last image creation.
If you leave this option away,
the build process recycles caches if possible,
which may save lot of time.

The `--pull` option pulls the latest version of the base image if there is an
updated version of it.
This option basically is optional and can be left away,
but may be also practical.

### Creating Docker containers

If you want to force recreate existing containers,
e.g. to reset the database,
you can run the following command:

```bash
docker-compose create --force-recreate
```

### Running Docker containers

To simply start already existing containers,
you can use the following command:

```bash
docker-compose start
```

## Using Docker on its own

Well,
if you are familiar with Docker and want to use Docker itself,
nobody will hold you back from doing so.
To get all information you may need to create and run the images and also
containers,
you may look into the `Dockerfile`s and also into the `docker-compose.yml`
configuration.
