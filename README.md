# Node-RED Slim
This repo contains code to build the docker image of Node-RED slim version. Build the image using:

`docker build -t node0:1.0 .`

By building this image, later you can use it to build docker image of IOx motion node.

### Note:

If you want to play with the Node-RED without IOx specific nodes, you can package the files using:

`ioxclient docker package node0:1.0 .`

Then deploy, activate and start the app in your device.