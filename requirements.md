# CableCo IDP Proof of Concept Requirements

This document captures the scope and requirements for the Radius proof of concept at CableCo. 

## Developer Experience

Developers must have a single resource definition language for Kubernetes and other cloud resources.

Developers will have developer documentation for getting started with the internal developer platform and each resource type just like Azure users can browse the Azure documentation.

Developers' IDE has built-in code assistance for defining their application and its resources.

## Resource types

The proof of concept must demonstrate both resource types with the included developer options:

**Web Service**

* Container image, port, and environment variables
* Scaling behavior – Auto or manual plus metric name if auto-scaling; when auto is selected; number of replicas when manual
* Minimum number of vCPU and GiB of memory per replica
* Allow external ingress traffic or internal-only

**MySQL Database**

* Database storage size

## Infrastructure Requirements

Radius will be installed in a shared test environment.

Kubernetes clusters on AWS will use EKS.

Kubernetes clusters on-premises will use the CableCo standard OpenShift environment.

> [!TIP]
>
> This may be a hard requirement to meet. Consult the Radius supported Kubernetes distributions. kind or k3d may be a better substitute.

When ingress is set to true on a web service, DNS name is assigned and the service is publicly accessible. When set to false, the service only responds to intra-cluster traffic.

MySQL databases are deployed using AWS RDS when deployed on AWS.

MySQL databases deployed on-premises are deployed on Kubernetes with a persistent volume.

When auto-scaling is selected on a web service, a horizontal pod auto-scaler is configured with proper label selector.

> [!TIP]
>
> This is a lower priority requirement.

## Sample Application

The proof of concept must demonstrate deploying Wordpress with a MySQL or MariaDB database. The [Kubernetes sample application](https://github.com/kubernetes/examples/tree/master/mysql-wordpress-pd) is a good resource.
