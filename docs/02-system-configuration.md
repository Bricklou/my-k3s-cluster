# System configuration

Starting to this point, we have a working system. Now, we need to configure it to be able to use it.
The best way to do it is to use Ansible, which is a tool that allows you to automate the configuration of your system.
With some preconfigured roles, we can easily configure our system to be ready to use, even if we have multiple type of devices and operating systems (currently: Raspberry Pi OS and Armbian).

## Pre-requisites

To be able to use Ansible, you need to install it on your computer. You can find the installation instructions [here](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html).

Once it's done, you need to clone this repository and copy the inventory file:

```sh
$ cp -r ansible/inventories/samples ansible/inventories/cluster

# Run the following command to check if everything is working
$ ansible all -m ping -i ansible/inventories/inventory
```

## Configuration

### Inventory

The inventory file is the file that contains all the hosts that will be configured by Ansible. In our case, we have 3 hosts: 1 Raspberry Pi 4B, 2 Raspberry Pi 3B+ and 2 Orange Pi 5.

The inventory file is located in `ansible/inventories/inventory.yaml`. You can edit it to add or remove hosts.

### Variables

The variables are located in `ansible/inventories/group_vars/main.yaml`. This file contains all the variables that will be used by Ansible to configure the hosts.

You can edit this file to change the configuration of your hosts.

### Launch the configuration

Once you're done with the configuration, you can launch the configuration using the following command:

(TODO: ensure the command is correct)

```sh
$ ansible-playbook -i ansible/cluster ansible/playbook.yaml
```
