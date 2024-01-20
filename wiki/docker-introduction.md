# Containers

## Introduction

Docker is a tool that can package an application and its dependencies into an isolated container.

## Why containers instead of VMs?

Docker contains only the application and its dependencies, it does not have a kernel. Instead, it uses the machine kernel. A virtual machine has it's own kernel and runs on top of the machine OS.

## Benefits of containers

- Portable: can run consistenly across diffrent environments
- Efficient: shares the machine kernel, reducing overhead[^1].

[^1]: The "overhead" being referred to is the extra resources and processing requirements associated with virtualization in the case of virtual machines (VMs).

## _Compose_

Compose is a tool for defining and running multi-container Docker applications. We can define a multi-container Docker application in a single file (usually named `docker-compose.yml`). This file describes the services, networks and volumes for the application, as well as any configuration details required.

## Benefits of _compose_

- Simplified deployment: deploy multi-container applications with a single command
- Scalability: easily scalate services up or down to handle changes in demand
- Easy configuration: the `docker-compose.yml` file is a simple and readable configuration file
- Shared storage: volumes storage can be shared between the host and the containers