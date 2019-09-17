# Web Infrastructure

Repository provides the setup for creating local (VirtualBox) or remote (AWS) infrastructure.

## Prerequisites

* [VirtualBox](https://www.virtualbox.org/) for local virtualization
* [Vagrant](https://www.vagrantup.com/) to create a local infrastructure
* [AWS](https://console.aws.amazon.com/console/home?region=us-east-1) to create a remote infrastructure on AWS EC2
  * aws setup for config (region) and credentials (access key id, secret access key)
* [Ansible](https://www.ansible.com/) for provisioning tool
  
# Overview
The setup consists of two steps, setting up the machines (locally or remotely) and provisioning the application
deployment and configuration.

![overview](https://raw.github.com/peregin/my-little-infra/master/doc/infra.png "infra")

## Machine
Creates and keeps up to date infrastructure.
```bash
# env local|aws
# command create|destroy
machine.sh <env> [command]
```

## Setup
Provisions the infrastructure.
```bash
# env local|aws
provision.sh <env>
```



