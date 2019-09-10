# Web Infrastructure

Repository provides the setup for creating local (VirtualBox) or remote (AWS) infrastructure.

## Prerequisites

* [VirtualBox](https://www.virtualbox.org/) for local virtualization
* [Vagrant](https://www.vagrantup.com/) to create a local infrastructure
* [AWS](https://console.aws.amazon.com/console/home?region=us-east-1) to create a remote infrastructure on AWS EC2
  * aws setup for config (region) and credentials (access key id, secret access key)
* [Ansible](https://www.ansible.com/) for provisioning tool
  
# Setup
The setup consists of two steps, setting up the machines (locally or remotely) and provisioning the application
deployment and configuration.

## Machine
```bash
# env local|aws
# command create|destroy
machine.sh <env> [command]
```

## Provision
```bash
# env local|aws
provision.sh <env>
```


