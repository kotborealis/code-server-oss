# AGENTS.md

## Overview
This repo builds an OSS Docker image of Microsoft VS Code Server. The image is produced by running build scripts under `buildscripts/` and building a Docker image via `docker-compose`.

## Key Paths
- `buildscripts/` build pipeline and entrypoint scripts
- `buildscripts/steps/` numbered build steps
- `docker-compose.yml` image build/run configuration
- `Dockerfile` base image and build definitions

## Common Commands
- Build docker image: `npm run build` (alias to `docker-compose build`)
- Direct build: `docker-compose build`
- Run container (example): `docker-compose up code-server`

## Notes For Changes
- Prefer editing build logic in `buildscripts/steps/*.sh` rather than `Dockerfile` when possible.
- Keep scripts POSIX-compatible where feasible and avoid bashisms unless already used.
- Document any new build steps in `buildscripts/steps/` with clear ordering and comments.

## Testing
No automated tests are defined in this repo. Validate changes by building the image (`docker-compose build`) and running the container (`docker-compose up code-server`).
