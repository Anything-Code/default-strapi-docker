# Default Strapi Docker

This repository contains a Dockerfile and configuration for running a Strapi application in a Docker container. It is meant for users who do not aim to use strapi as a development framework but rather just directly run it somewhere.

## Heads Up

1. Volume binding does not work for the Strapi container.
2. Sometimes Docker asks you to create the declared directory `db-data` before starting the Postgres container.

## Docker Image

The Dockerfile installs Strapi and its dependencies, builds the Strapi app, and configures the container to run Strapi in development mode.

It uses the latest Node.js 18 Alpine image as the base and installs additional packages like git and gcc to compile Strapi. PostgreSQL drivers are also installed.

The Strapi app is installed in /opt/strapi using `npx create-strapi-app.`

The container runs as the node user and exposes port 1337 for the Strapi admin UI. Environment variables are set to run Strapi in development mode.

## Usage

Simply run a desired and fitting version of:

``` bash
docker compose up
```

Strapi will be accessible at `http://localhost:1337` in development mode. Files can be edited on the host system and changes will be reflected in the running container.

The docker-compose.yml file contains a complete setup for running Strapi with a PostgreSQL database using Docker Compose.

## Customization

To use a different Node.js version, modify the base image in the Dockerfile.

Additional plugins and customizations can be added by modifying the package.json before the build step.

Content types, fields, and other Strapi configurations can be made by editing `/opt/strapi` on the host system. These changes will be reflected in the running Strapi container.

## License

This project is open source and available under the MIT License.
