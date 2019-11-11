[![Docker Pulls](https://img.shields.io/docker/pulls/peregin/velocorner.com)](https://hub.docker.com/r/peregin/velocorner.com)
[![Docker Pulls](https://img.shields.io/docker/pulls/peregin/web-front)](https://hub.docker.com/r/peregin/web-front)

# Web Infrastructure

The repository provides the code to create local (VirtualBox) and remote (AWS) infrastructure for
a web application stack.

## Prerequisites

* [VirtualBox](https://www.virtualbox.org/) for local virtualization
* [Vagrant](https://www.vagrantup.com/) to create a local infrastructure
* [AWS](https://console.aws.amazon.com/console/home?region=us-east-1) to create a remote infrastructure on AWS EC2
  * aws setup for config (region) and credentials (access key id, secret access key)
* [Ansible](https://www.ansible.com/) for provisioning tool
  
# Overview
The setup consists of the following steps, setting up the machines (locally or remotely)
, provisioning the infrastructure and deploying the application stack.

![overview](https://raw.github.com/peregin/my-little-infra/master/doc/infra.png "infra")

## Machines in the Infrastructure
Creates and and destroys the infrastructure (looked as abstractions over machines).
```bash
# env local|aws
# command create|destroy
machine.sh <env> [command]
```

## Provision the Infrastructure
Installs and configures the infrastructure.
```bash
# env local|aws
provision.sh <env>
```

## Application Stack Deployment
Deploys the application stack mainly running in docker containers.
```bash
# env local|aws
# stack velocorner|any-app-stack
deploy.sh <env> <stack>
```



