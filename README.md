Unofficial Docker image for [Geyser](https://geysermc.org/). The tool enable clients from Minecraft Bedrock Edition to join your Minecraft Java server.

## Example

```bash
docker run -e REMOTE_ADDRESS=localhost -e REMOTE_AUTH_TYPE=offline -v `pwd`:/geyser/config -p 19132:19132/udp --name geyser -d fomkin/geyser-docker
```

## Configuration

You can configure Geyser using environment variables in Docker (`-e VAR:VALUE`).

| Variable        | Description           | Default  |
| ------------- |:-------------:| -----:|
| MEMORY      | Java Heap memory limit | 1G |
| REMOTE_ADDRESS      | Address of Minecraft Java Server      |   127.0.0.1 |
| REMOTE_AUTH_TYPE | Authentication type      |    online |

Also you may attach volume with `config.yml` (`- v hostdir_with_config:/geyser/config`) however environment variables have priority.

## Build

Find latest successfull build in [Gayser CI](https://ci.opencollab.dev/job/GeyserMC/job/Geyser/job/master/).

Run:
```bash
BUILD_NUMBER="714"; docker build --build-arg BUILD_NUMBER=$BUILD_NUMBER -t fomkin/geyser:$BUILD_NUMBER -t fomkin/geyser:latest .
```