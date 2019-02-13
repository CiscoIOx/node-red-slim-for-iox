# Node-RED Slim

This repo contains code to build the docker image of Node-RED slim version that can be run on Cisco IR800 series devices.

## Installation

Build the image using:

`docker build -t node0:1.0 .`

### Usage

By building the above image, later you can use it to build docker image of IOx GPS node or other nodes.

If you want to play with the Node-RED without IOx specific nodes, you can now package the files using:

`ioxclient docker package node0:1.0 .`

Then deploy, activate and start the app in your device.

## Getting help

If you have questions, concerns, bug reports, etc., please file an issue in this repository's Issue Tracker.


----

## Credits and references

1. https://github.com/node-red/node-red-docker
