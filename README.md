# code-server-oss

Docker image of [Microsoft Code-Server](https://code.visualstudio.com/docs/remote/vscode-server), compiled from sources.
Basically, this is an OSS version of code-server.

# Builds

Builds are driven by the `VSCODE_TAG` file in this repo.

Workflow:
1. Open a PR and set `VSCODE_TAG` to the desired VS Code tag or commit.
2. CI builds the image on the PR (no push).
3. When the PR is merged to `master`, CI builds again, pushes the Docker image, and creates a GitHub Release.

Published image tags:
- `kotborealis/code-server-oss:<VSCODE_TAG>`
- `kotborealis/code-server-oss:latest`

# Usage

Usage:
```sh
# Start via docker-compose.yml:
export CODE_PORT=8080
docker-compose up code-server
# code-server available at 0.0.0.0:8080
# you can overwrite code-server arguments in docker-compose.yml

# Start via `docker run`:
docker run kotborealis/code-server-oss:latest --host 0.0.0.0 --port 8080
```
