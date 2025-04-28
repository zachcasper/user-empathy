# CableCo IDP Proof of Concept Requirements

This document captures the scope and requirements for the Radius proof of concept at CableCo. 

## Motivation

CableCo has historically not been focused on the developer experience because we have been biased towards buy over build. However, our as our business climate has evolved and our customers expect higher quality digital experiences, we are investing heavily in our internal development capability. Having a world class developer experience is critical to support this new growth.

Because CableCo does not have a internal developer platform, we face the following challenges:

**Developer Cognitive Load** – Because CableCo developers deploy applications on-premises and in AWS based on business requirements and cost, developers must know how to configure infrastructure. When deploying to Kubernetes, developers describe their application using Helm. But when they need a relational database, they must either work with the Enterprise Data Services team for a managed database. For other components such as a storage bucket, NoSQL database, or message queue, they can either deploy the component's containers manually using Helm or they can use an AWS service—in which case they must provision the service themselves using either Terraform or CloudFormation. 

**Lack of Portability** – Because CableCo does not have an infrastructure abstraction layer aside from Kubernetes, developers are building for either AWS or the on-premises environment. While Kubernetes makes it easy to move containerized workloads, it is very difficult to move other application components. 

**Lack of an On-Premises Control Plane** – While AWS provides CableCo with a control plane and API and Terraform has a wide array of providers and modules, there is no such thing on-premises. Since CableCo has a large capital investment in their data centers and thousands of edge locations, they are committed to hosting application on-premises. Aside from managed Kubernetes and managed VMs, there is no control plane which would enable offering other cloud services.

**Existing Applications** – CableCo does not have a comprehensive view of where all of their applications are running and what resources they are consuming. CableCo does have a change management database (CMDB) which they use for change control, but because of its static nature, it is essentially a catalog of applications without deployment detail. Today, the CableCo CMDB has 2,000 desktop applications and 2,500 cloud and data center applications.

**Engineering Consistency** – CableCo has not been able to build an engineering culture which delivers applications to the business in a consistent way. This partially due to the lack of tooling and lack of a comprehensive developer experience. This inhibits internal mobility because each team has their own way of doing things and it takes many months to ramp up on a new team. 

**Scale** – CableCo operates tens of thousands of VMs in their on-premises data centers plus thousands of edge locations. Any on-premises control plane will need to operate at this scale.

## Proof of Concept Scope

At a high level, this proof of concept will demonstrate our ability to build an application-centric internal developer platform using Radius and our existing Kubernetes and CI/CD infrastructure. The scope includes:

* Installation and configuration of Radius in a non-production on-premises environment
* Installation and configuration of Radius in a non-production AWS environment
* Modeling of at least two common application resources
* Developer documentation for the two application resources
* Configuration of a developer workstation 
* Deployment of a sample application to each environment

Out of scope capabilities include:

* Compiling the sample application and building the container image
* Configuring the CI/CD pipeline to deploy to a test environment
* Identity and access management
* 

## Internal Developer Platform Requirements

### Developer Experience

Developers must have a single resource definition language for Kubernetes and other cloud resources.

Developers will have developer documentation for getting started with the internal developer platform and each resource type just like Azure users can browse the Azure documentation.

Developers can deploy their application and its resources locally or to a shared development environment, 

Developers must use the CI/CD system to deploy to the test, stage, and production environments.

Developers' IDE has built-in code assistance for defining their application and its resources.

### Resource types

**Web Service** – A long-running HTTP-based service with a RESTful API. Developers can specify:

| Developer Option                                             | Implementation Requirement                                   |
| ------------------------------------------------------------ | ------------------------------------------------------------ |
| Scaling behavior (auto or manual, metric name if auto-scaling) | When auto is selected, a horizontal pod auto-scaler is configured with proper label selector |
| Minimum number of vCPU and GiB of memory per replica         | When specified, the minimums are included in the pod resource request spec |
| Allow external ingress traffic or internal-only              | When external ingress is selected, the Kubernetes service is exposed and friendly DNS name is assigned |
| N/A                                                          | The web service will be fronted by an NGINX reverse proxy    |
| N/A                                                          | The web service will have an Aqua security container runtime security agent sidecar |

**Job** – A single execution 

| Developer Option | Implementation Requirement |
| ---------------- | -------------------------- |
|                  |                            |
|                  |                            |
|                  |                            |
|                  |                            |
|                  |                            |

**Function** – A short-lived execution of a container triggered by a RESTful API call

| Developer Option | Implementation Requirement |
| ---------------- | -------------------------- |
|                  |                            |
|                  |                            |
|                  |                            |
|                  |                            |
|                  |                            |







* PostgreSQL database
* MongoDB database
* Kafka message queue

