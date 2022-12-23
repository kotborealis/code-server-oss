# code-server-oss

Docker image of [Microsoft Code-Server](https://code.visualstudio.com/docs/remote/vscode-server), compiled from sources.
Basically, this is an OSS version of code-server.

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
