= Introduction

#set quote(block: true)

#quote(attribution: [*Kelsey Hightower*, Tweet from Nov 27, 2017])[
  Kubernetes is a platform for building platforms. It's a better place to start; not the endgame.
]

Deploying and managing open-source software (OSS) has become increasingly complex, especially with the rise of Kubernetes, a powerful but often challenging tool for container orchestration. This thesis introduces the One-Click Deployment system, designed to make Kubernetes more accessible and straightforward for users of all technical backgrounds. The system has been developed under constant iteration and is available in a first fully functional version. It has even experienced commercial production use at the time of this writing.

== Background and Context
Open-source software is a cornerstone of modern technology, driving innovation and providing essential tools for building robust systems. However, the complexity of deploying and managing these tools can be a significant barrier, particularly with Kubernetes. While Kubernetes offers powerful features for container management, its steep learning curve can be intimidating.

=== Concrete Example
Imagine a developer who has built a data visualization tool using the open-source framework Streamlit #footnote[https://streamlit.io/] or a complex automation workflow using Node-RED #footnote[https://nodered.org/]. Initially, the developer considers deploying the application using Docker Compose, which involves creating and managing a docker-compose.yml file. However, this approach requires configuring a virtual machine (VM) and deciding on a cloud host or on-premise setup. The developer must also implement an SSL reverse proxy and consider vertical scaling and automatic updates every time a new Docker image is published.

Faced with these challenges, the developer might turn to Kubernetes for its built-in solutions to these problems. Kubernetes provides tools for container orchestration, scaling, and managing configurations. However, the user soon realizes the difficulty of managing the deployment through numerous YAML files required for Kubernetes resources, such as deployments, services, ingress controllers, and more. This is where the One-Click Deployment system comes in, streamlining the deployment process and abstracting the complexity involved. \ \
*Challenges*
- *Complexity*: Kubernetes requires a deep understanding of its concepts and resources, making it challenging for beginners.
- *Configuration*: Managing YAML files for Kubernetes resources can be error-prone and time-consuming.
- *Scalability*: Ensuring that the deployment can scale horizontally and vertically requires additional configurations.
- *Security*: Implementing secure deployments with SSL certificates can be complex.
- *Maintenance*: Keeping the deployment up-to-date with the latest versions of the software and Kubernetes resources can be a manual process.

The One-Click Deployment project aims to democratize Kubernetes by simplifying its deployment and management processes, making these advanced capabilities available to everyone, from beginners to experienced developers. The system centralizes configuration and follows the principle of *"convention over configuration"* #footnote[https://en.wikipedia.org/wiki/Convention_over_configuration],  allowing users to deploy and manage applications with minimal effort.

#pagebreak()

== Problem Statement
The deployment and management of OSS using Kubernetes involve numerous challenges. These include setting up environments, managing dependencies, and ensuring security and scalability. These tasks often require specialized knowledge, which can limit the use of Kubernetes to larger organizations with dedicated resources. Smaller teams and individual developers may find these complexities overwhelming, hindering their ability to leverage the full potential of Kubernetes. \ \
*Concretely, the challenges include:*
- *Complex Deployment Process*: The manual configuration of Kubernetes resources can be complex and error-prone.
- *Limited Accessibility*: Kubernetes is often perceived as difficult to learn and use, limiting its adoption.
- *Scalability Management*: Ensuring that deployments can scale efficiently requires additional configurations.
- *Security Maintenance*: Implementing secure deployments with SSL certificates and encryption can be challenging.
- *Operational Complexity*: Keeping deployments up-to-date with the latest software versions and Kubernetes resources can be time-consuming.

*Requirement by the End-User:*
- *Simplicity*: Users need an easy-to-use interface that abstracts away the complexities of Kubernetes.
- *Efficiency*: Deployments should be quick and efficient, allowing users to focus on building applications.
- *Reliability*: Deployments should be reliable, scalable, and secure without requiring manual intervention.
- *Customization*: Users should have the flexibility to customize deployment configurations based on their requirements.
- *Documentation*: Detailed documentation and support should be available to guide users through the deployment process.

The goal of One-Click System is to address these challenges by providing a solution that centralizes configuration and follows the principle of "convention over configuration." This approach reduces the need for users to understand the Complex details of Kubernetes and allows them to deploy and manage applications with minimal effort. By encapsulating Kubernetes’ strengths within a user-friendly interface, the One-Click Deployment system simplifies deployment, scaling, and management processes, making these advanced capabilities accessible to a broader audience.

== Objectives of the Study
The main objectives of this study are to design, develop, and evaluate the One-Click Deployment system, focusing on:
- Simplifying the Kubernetes deployment process to fewer steps and less manual configuration.
- Enabling easy management and scaling of OSS deployments within a Kubernetes ecosystem.
- Assessing the impact of the One-Click Deployment system on the adoption and utilization of Kubernetes.
- Collecting feedback from users to refine and enhance the system's features continuously.
- Identifying opportunities for future research and development in Kubernetes deployment and management.
