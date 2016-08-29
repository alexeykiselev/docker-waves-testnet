# Docker container for Waves testnet node 

Waves is a decentralised platform that allows any user to issue, transfer, swap and trade custom blockchain tokens on an integrated peer-to-peer exchange.
You can find more information about Waves at [wavesplatform.com](http://wavesplatform.com/) and [GitHub](https://github.com/wavesplatform).

This Docker image contains the latest release version of Testnet Node of Waves. 


## This image on Docker Hub

It is possible to download a prebuild Docker image from Docker Hub. To do so issue the command:

```
docker pull wavesplatform/waves-testnet:latest
```

After getting the image, you can run it.


## Building a Docker image

### Prerequisites 

You need the latest version of Docker installed.

Please, follow installation istructions at [Docker Site](https://docs.docker.com/engine/installation/).

### Building image

In order to build a new Docker image execute the following commands:


Clone the project's repository:

```
git clone https://github.com/alexeykiselev/docker-waves-testnet.git
```

Get into project's directory:

```
cd docker-waves-testnet
```

Build an image with the following command:

```
docker build -t waves-testnet .

```

### Running the image

List your Docker's images:

```
docker images
```

If you built the image by yourself it will have the name you gave to it (in our example it is 'waves-testnet'). If you have downloaded the image from Docker Hub it is tagged with 'wavesplatform/waves-testnet:latest'.

To start a new Docker container, please, execute:

```
docker run --name waves-testnet wavesplatform/waves-testnet:latest

```

It is possible to provide a concrete version instead of 'latest'.

This image defines a storage volume in folder `/waves`. This folder is persisted on host drive. So, your node configuration and downloaded blockchain will survive the container restart. You can find the location of this volume on a host computer using `docker inspect` command.

Alternatively you can map the volume on a host folder using option `-v` as in:

```
docker run --name waves-testnet -v /home/user/local-waves-folder:/waves wavesplatform/waves-testnet:latest
```

At first run a new wallet seed will be created for you and stored in `waves-testnet.json` configuration file on the volume.

To start and stop the container use Docker commands `docker start waves-testnet` and `docker stop waves-testnet`. We address the container by its name which we gave to it in the `--name` option of the `run` command.