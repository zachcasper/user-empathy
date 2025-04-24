# CableCo Internal Developer Platform Requirements

## Developer Experience Today

Developers at CableCo are served today by different groups, each offering a different service.

* The Developer Experience team offers a managed Kubernetes namespace as a service. For Enterprise and Maintenance applications, developers can request a Kubernetes namespace via a form. For Prime and Critical applications, the Developer Experience offers one on one consulting with development teams to meet the business-critical availability and resiliency requirements. 
* The Developer Experience team also offers a managed CI/CD service using GitLab and ArgoCD.
* The Enterprise Cloud team offers AWS accounts to development teams. These AWS accounts come pre-configured with IAM roles and shared VPCs with Direct Connect to the CableCo wide-area network. Developers are free to use whatever IaC solution they like but Terraform is very common in CableCo. The Developer Experience team uses this service to offer the managed Kubernetes service in AWS.
* The Enterprise Data Center team offers virtual machines as a service to development teams using either OpenStack or VMware. The Developer Experience team uses this service to offer the managed Kubernetes service on-premises.
* The Enterprise Data Services is the DBA team. They offer managed Oracle, PostgreSQL, and MySQL on-premises and in AWS. These managed databases are regularly backed up, monitored, and updated. Options are available for multi-location replication for availability and resiliency. NoSQL databases are left to the development team to manage.

## Current Challenges

**Developer Cognitive Load** – Because CableCo developers deploy applications on-premises and in AWS based on business requirements and cost, developers must know how to configure infrastructure. When deploying to Kubernetes, developers describe their application using Helm. But when they need a database, they must either work with the Enterprise Data Services team for a managed database, or choose provision their own RDS database using Terraform or CloudFormation. 

**Engineering Consistency** – CableCo has not been able to build an engineering culture which delivers applications to the business in a consistent way. This partially due to the lack of tooling and lack of a comprehensive developer experience. 

**Lack of Portability** – Because CableCo does not have an infrastructure abstraction layer aside from Kubernetes, developers are building for either AWS or the on-premises environment. While Kubernetes makes it easy to move containerized workloads, it is very difficult to move other application components. 

**Lack of an On-Premises Control Plane** – While AWS provides CableCo with a control plane and API and Terraform has a wide array of providers and modules, there is no such thing on-premises. Since CableCo has a large capital investment in their data centers and thousands of edge locations, they are committed to hosting application on-premises. Aside from managed Kubernetes and managed VMs, there is no control plane which would enable offering other cloud services.

**Scale** – CableCo operates tens of thousands of VMs in their on-premises data centers plus thousands of edge locations. Any on-premises control plane will need to operate at this scale.

**Existing Applications** – CableCo does not have a comprehensive view of where all of their applications are running and what resources they are consuming. CableCo does have a change management database (CMDB) which they use for change control, but because of its static nature, it is essentially a catalog of applications without deployment detail. Today, the CableCo CMDB has 2,000 desktop applications and 2,500 cloud and data center applications.

## Internal Developer Platform Requirements

### Developer Experience

Developers will be able to define their application 

