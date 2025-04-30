# Radius User Empathy Group Activity

Radius is solving complex problems for complex organizations. On the Radius team, we all use Radius, Kubernetes, and Bicep every day and we deal with the quirks of our systems or write scripts to automate things every day. But our users do not have that luxury. New users have limited time to evaluate if Radius meets their needs those familiar with Radius just want it to work with their environment. Imagine how much more complicated things are for our users. Not only are they running production systems, but their organizations are more complex, they have security and regulatory requirements that we don't yet understand, and their core competency is not building cloud software.

For the next two and a half hours, you will no longer be a member of the Radius team. You have just joined the Developer Experience team at CableCo as a platform engineer. The CableCo CIO has asked your team to build a proof of concept for a internal developer platform using Radius for the Enterprise division. 

## Group Organization

You have been placed in a group of your teammates. 

| Group 1           | Group 2             | Group 3              | Group 4            | Group 5        |
| ----------------- | ------------------- | -------------------- | ------------------ | -------------- |
| Lakshmi Javadekar | Brooke Hamilton     | Chakradhar Kotamraju | Nicole James       | Allen Jones    |
| Sylvain Niles     | Mario Hewardt       | Jonathan Smith       | Nithya Subramanian | Aman Singh     |
| Will Smith        | Reshma Abdul Rahim  | Karishma Chawla      | Shruthi Kumar      | Daniel Gerlag  |
|                   | Vishwanath Hiremath | Yetkin Timocin       | Will Tsai          | Nandita Valsan |
|                   |                     |                      |                    | Ruokun Niu     |

Each group needs a few roles. You will need to organize yourselves in your group.

* Platform engineer (everyone)
* Developer (only one person at certain times)
* Presenter (one person who will present your finding at the end)

## Timing

| Time           | Activity                                                     |
| -------------- | ------------------------------------------------------------ |
| 1:00 – 1:15 PM | Plenary – Activity overview and Q&A                          |
| 1:15 – 1:30 PT | Breakout – Read CableCo background and platform requirements |
| 1:30 – 3:00 PT | Breakout – Implement your PoC                                |
| 3:00 – 3:30 PT | Plenary – Radius Customer Advisory Board                     |

## Objectives

Today's activity has two objectives:

1. Put ourselves in the shoes of a platform engineer at a large enterprise and learn about how they are organized, there technical constraints, and their overall challenges and requirements.
2. Implement a proof of concept using Radius as a first-time user would. 

## Deliverables

There are three deliverables for this activity:

### 1. Proof of concept implementation

At a high level, this proof of concept will demonstrate our ability to build an application-centric internal developer platform using Radius and our existing Kubernetes and CI/CD infrastructure. The scope includes:

* Installation and configuration of Radius
* Setup of a shared environment on-premises and in AWS
* Modeling of at least two common application resources
* Developer documentation for the two application resources
* Configuration of a developer workstation to deploy to shared environments

Out of scope capabilities include:

* Compiling the sample application and building the container image
* Deploying the application locally
* Configuring the CI/CD pipeline to deploy to a test environment
* Identity and access management

### 2. Deployment of a sample application 

The developer in your group should radify the [WordPress and MySQL on Kubernetes sample application](https://github.com/kubernetes/examples/tree/master/mysql-wordpress-pd) and deploy it to each environment.

### 3. Feedback 

You should capture feature requests along the way which would be important if you were building a full IDP within CableCo. You will need a stack ranked list of feature requests you feel are the highest priority for CableCo after completing the proof of concept.

At 3:00 PT, we will hold the Radius Customer Advisory Board. Your group's secretary will be expected to present five minutes on:

* What are your platform engineering team's top challenges (overall, not just with Radius)?
* What benefits does Radius provide your company?
* What challenges did you face building an IDP using Radius?
* Provide a stack ranked list of feature requests for your platform engineering team
* How likely would you recommend Radius to another platform engineering team (0 Not at al likely – 10 Extremely likely)

At the end of the activity, submit your feedback using this form: [Radius Customer Advisory Board feedback form](https://forms.office.com/r/emEQ23NuHv)

## Activity Guidelines

1. **No customizations** – Remember that you are a platform engineer at CableCo, not a member of the Radius team. Platform engineers at CableCo don't have the time or expertise to submit code changes to Radius. You can submit issues or feature requests. 
2. **Follow the documentation** – Try your best to set aside what you know about Radius and follow the documentation. When you install Radius, follow the installation guide installing Radius manually, not from one of your own scripts. When you create a recipe, follow the how-to guide.
3. **Prioritize requirements** – You will not be able to implement all of the requirements due to time limitations and Radius capabilities. Prioritize implementing the ones you believe are the highest priority to CableCo.

## Links

* [CableCo Background and Organization](background.md)
  * **Tip:** This is a background document. Feel free to skim for a general understanding, but definitely study it later because this is a very real-world example of a large enterprise. There isn't anything here that you must know to complete the activity.
* [CableCo IDP Proof of Concept Requirements](requirements.md)
* [WordPress and MySQLon Kubernetes sample application](https://github.com/kubernetes/examples/tree/master/mysql-wordpress-pd) 
* [Radius Customer Advisory Board feedback form](https://forms.office.com/r/emEQ23NuHv)

## Need Help?

Ask Zach. His role today is a distinguished engineer at CableCo so he can answer any questions you have about CableCo.

### Tips

**Cluster Type** – There are three levels of complexity. Choose your own adventure, but just choose one: (1) local kind or k3d cluster; (2) EKS cluster; (3) EKS cluster using RDS for the database

**EKS Auto** – Not recommended. For some reason, the Karpenter node provisioner is not very responsive in EKS Auto. It's usually very responsive when running on the local cluster.

**StorageClass on EKS** – EKS does not have a default StorageClass so any volume you may create probably will not provision. You can set a default StorageClass with this command:

```bash
kubectl patch storageclass gp2 -p '{"metadata": {"annotations":{"storageclass.kubernetes.io/is-default-class":"true"}}}'
```

**EKS Pod Identity Agent** – Not recommended. This add-on is not needed for the activity and causes conflicts with the Gateway resource. The EKS Pod Identity Agent reserved the node port 80 which Contour also uses. So Contour will never get scheduled since the node port is in use on every node.

## Example Solution

If you want to cruise through, you can read the [example solution here](example-solution.md). But what's the fun in that?    `¯\_(ツ)_/¯`
