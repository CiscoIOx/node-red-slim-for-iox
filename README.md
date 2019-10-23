# Node-RED Slim

This repo contains code to build the docker image of Node-RED slim version that can be run on Cisco IR800 series devices.

## Installation and Usage

### 0. Build Node-RED slim Docker image

After you `git clone` this repo, build the Docker image using:

`docker build -t node0:1.0 .`

By building the above image, later you can use it to build docker image of IOx GPS node or other nodes.

### 1. Create IOx application package

If you want to play with the Node-RED without IOx specific nodes, you can now package the files using:

`ioxclient docker package node0:1.0 .`

### 2. Deploy, activate and start the app

Then use Local Manager, ioxclient or Fog Director to deploy, activate and start the app in your device(s).

**For Local Manager option:**

Access device Local Manager UI using the URL path **https://<IR829_mgmt_intf_ip>:8443**.

Deploy the app using the name `nodered` and the package `package.tar` that you created.

![image](https://user-images.githubusercontent.com/47573639/52669802-ec58eb80-2ecb-11e9-98ac-655385899b88.png)

![image](https://user-images.githubusercontent.com/47573639/52669839-0692c980-2ecc-11e9-8e75-940cd17bec35.png)

Activate the app with these configurations:
- Choose `iox-nat0` for network and `1880:1880` for custom port mapping.
- Choose `async1` and `async0` for device serial ports.
- The recommended resource profile is:
  - CPU: 200 cpu-units
  - Memory: 128 MB
  - Disk: 10 MB

  You can change the combination upon the consumption of your other apps. The memory should be no less.

![image](https://user-images.githubusercontent.com/47573639/52669886-21653e00-2ecc-11e9-9a46-a0d7893ebd6c.png)

![image](https://user-images.githubusercontent.com/47573639/52669905-33df7780-2ecc-11e9-9e87-2034a9c277c3.png)

![image](https://user-images.githubusercontent.com/47573639/52669953-478ade00-2ecc-11e9-8b28-372632210bfc.png)

Finally start the app.

![image](https://user-images.githubusercontent.com/47573639/52670022-730dc880-2ecc-11e9-9e7d-596e5a8aed68.png)

**For ioxclient option:**

Run the following command to deploy, activate and start the app:

`ioxclient app install nodered package.tar`

`ioxclient app activate --payload activation.json nodered`

`ioxclient app start nodered`

The `activation.json` file is similar to the Sample Activation payload in [GPS service introduction of IOx](https://developer.cisco.com/docs/iox/#!how-to-install-gps-service/how-to-install-gps-service).

## Verify the app is running

a) Add NAT forwarding rule in IOS running configuration for port 1880.

b) Open Node-RED interface at **http://<IR829_mgmt_interface_ip>:1880**.

![image](https://user-images.githubusercontent.com/47573639/52670134-ad776580-2ecc-11e9-8cdc-ee5e62316ee2.png)

Build a simple flow with `inject` and `debug` nodes. Use `timestamp` as the payload of `inject` node.

![image](https://user-images.githubusercontent.com/47573639/67434668-7ef37380-f59f-11e9-9fa7-c567924ad673.png)

Deploy the flow.

![image](https://user-images.githubusercontent.com/47573639/67434790-b530f300-f59f-11e9-8fff-8b4e0a210702.png)

Click the button at `timestamp` node once. You'll be able to see the current timestamp.

![image](https://user-images.githubusercontent.com/47573639/67434933-f7f2cb00-f59f-11e9-9ec3-e76c56c94ba1.png)

## Using on a DevNet Sandbox

You can also run the app on a Cisco DevNet Sandbox if you remove the **"devices"** section in **package.yaml**.

Go to DevNet Sandbox page: https://devnetsandbox.cisco.com/RM/Topology

Choose an IOx Sandbox under IoT category to reserve.

![image](https://user-images.githubusercontent.com/47573639/54312105-56c87e80-4593-11e9-99d4-af901ada290b.png)

## Getting help

If you have questions, concerns, bug reports, etc., please file an issue in this repository's Issue Tracker.


----

## Credits and references

1. https://github.com/node-red/node-red-docker
