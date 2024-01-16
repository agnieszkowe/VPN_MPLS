# VPN_MPLS

Project for Inter-AS Networks 2023/2024

## Overview

Welcome to the Project Inter-AS Networks 2023/2024! This project focuses on the implementation of MPLS VPN using Ansible. The project draws inspiration from the [Ansible For Network Automation](https://www.youtube.com/playlist?list=PLtGnc4I6s8duzuHbTrirOEoRW5vcn6Gsh) playlist on YouTube by Network Savage, along with the blog post [Creating MPLS VPN](https://packetlife.net/blog/2011/may/16/creating-mpls-vpn/). Additionally, the project incorporates instructions and guidelines from the laboratory sessions on Teams from channel AGH Inter-AS Networks.

## Table of Contents

1. [Introduction](#introduction)
2. [Requirements](#requirements)
3. [Setup](#setup)
4. [Network Automation](#network-automation)
5. [Running the project](#running-the-project)
6. [Results](#results)
   
## Requirements

Before getting started, ensure that the following requirements are met:

- GNS3 configuration and preparation for network automation.
- VMware Station Pro configuration and creating VM for the automation.
- Knowledge of Ansible playbooks.
- Familiarity with MPLS VPN concepts and configurations.
- Basic understanding networking principles.
- Ability to run bash scripts.

## Setup

For the setup I used the Ansible for Network Automation linked in overview. It explains pretty well how to achieve the working configuration. By this I mean that you should be able to run properly ansible playbooks within the network. All routers in the projects are Cisco 7200 Series so please take that into consideration when going with the videos.

## Network Automation

When running the network automation for the first time you may encounter some errors. I encountered two of them.
First one was concerning the VM for VMware Station Pro that couldn't load due to error "Virtualized AMD-V/RVI is not supported on this platform". Fortunately, I resolved this (on Windows 10) with the following website: [Solution](https://www.makeuseof.com/how-to-fix-virtualized-amd-vrvi-is-not-supported-on-this-platform-error-on-windows-11/)
The second one was actually on the network automation and while running any playbook I got: "To use 'ssh' connection type with passwords, you must install the sshpass program". To fix this I had to do couple of things:

1) Add NAT to your GNS3 project
2) Change /etc/network/interfaces for the machine to get dhcp address and also Internet access
3) Reboot your network automation (just in GNS3 project)
4) Do the installs on the machine - firstly apt-get update -y, then apt-get upgrade -y, apt-get install sshpass -y
5) Go back to manual configuration of /etc/network/interfaces
6) Reboot your network automation again

## Running the project

Please note that as run_pl.sh is a Bash script you should be able to execute it (chmod +x on the file - if you have any doubts about this check with ls -la for file permissions).

1) Start all devices within the network
2) Check any configurations you may want to
3) Go to network automation and run ./run_pl.sh
4) Wait for the devices to configure
5) Check the connection and :)

## Results

Topology:

![2024-01-16 19_38_19-MPLS_VPN_NOTHING_CONF - GNS3](https://github.com/agnieszkowe/VPN_MPLS/assets/56120693/6ebb50db-8bb7-427d-a8dc-0a81288277c7)



Traceroute and ping from device CE1A towards network behind CE2A:

![2024-01-16 18_33_39-Window](https://github.com/agnieszkowe/VPN_MPLS/assets/56120693/62ccfa00-a336-48ec-93d0-3bdabe5afeb7)



Traceroute and ping from device CE2A towards network behind CE1A:

![2024-01-16 18_34_04-Window](https://github.com/agnieszkowe/VPN_MPLS/assets/56120693/2cf82cd9-0ce5-4343-a927-92901f91c880)


Devices P1, P2, PE1, PE2 cannot reach the networks behind CEs:

![2024-01-16 19_42_38-MPLS_VPN_NOTHING_CONF - GNS3](https://github.com/agnieszkowe/VPN_MPLS/assets/56120693/6c4f09aa-e975-431d-bf7c-ce7a48aad2fb)

![2024-01-16 19_42_17-P2](https://github.com/agnieszkowe/VPN_MPLS/assets/56120693/1cfadabd-9c0c-4a5d-8fa4-cd4c09d44389)
