= Methodology
This section details how the One-Click Deployment system was developed, focusing on the research design, development approach, and the tools and technologies used. By adopting a structured and comprehensive methodology, we aimed to address the complex challenges of OSS deployment effectively.

== Research Design
To understand the OSS deployment landscape and evaluate our system's effectiveness, we used a combination of different research methods:

- *Current Landscape Analysis*: We began by analyzing the current landscape of OSS deployment. This involved looking at existing tools, technologies, and methods used in the industry to identify common challenges and gaps.
- *Case Studies*: We examined several OSS projects to understand their deployment processes. These case studies provided insights into the practical issues faced during deployment and the solutions adopted to overcome them.
- *Prototype Evaluation*: A prototype of the One-Click Deployment system was created and tested by users. Feedback from these sessions was crucial in assessing the system's usability, effectiveness, and overall user satisfaction, guiding further development.

== Development Approach
The development of the One-Click Deployment system followed an iterative and agile methodology, which allowed us to be flexible and responsive to user feedback:

- *Requirement Analysis*: Initial requirements were gathered based on our analysis of the current landscape and feedback from the case studies. These requirements helped shape the design and development of the system.
- *Prototype Development*: We developed a minimum viable product (MVP) to showcase the core functionalities of the One-Click Deployment system. This MVP was essential for initial user testing and feedback.
- *Iterative Development and Testing*: The system underwent multiple iterations of development and testing. After each iteration, user feedback was collected and used to refine features, improve usability, and add new functionalities.
- *User-Centered Design*: Throughout the development process, a user-centered design approach was adopted. Regular user testing sessions and feedback loops ensured that the system was intuitive and met user needs.

== Tools and Technologies Used
The development of the One-Click Deployment system utilized a range of tools and technologies, selected for their efficiency, robustness, and compatibility with OSS deployment requirements.
- *Kubernetes #footnote[https://kubernetes.io/]*: As the backbone of the system, Kubernetes was used for orchestrating container deployment, scaling, and management.
- *Docker #footnote[https://docker.com]*: Docker was employed for containerizing applications, ensuring consistency across different deployment environments.
- *Operator SDK #footnote[https://sdk.operatorframework.io/]*: The Operator SDK facilitated the development of the Kubernetes operator, a key component of the system that automates the deployment and management processes.
- *Svelte #footnote[https://svelte.dev/] and Pocketbase #footnote[https://pocketbase.io]*: The frontend of the system was developed using Svelte, a modern framework for building web applications, while Pocketbase served as the backend database and API server.
- *Git #footnote[https://git-scm.com/] and GitHub #footnote[https://git-scm.com/]Hub*: Git was used for version control, with GitHub hosting the project's code repository and facilitating collaboration among developers.
- *CI/CD Tools*: Continuous Integration and Continuous Deployment were achieved using tools like GitHub Actions, automating the testing and deployment of code changes.
By leveraging these tools and technologies, the One-Click Deployment system aims to provide a simplified, efficient, and scalable solution for OSS deployment, addressing the identified challenges and gaps in the current ecosystem.

#pagebreak()

== Open Source Availability

The One-Click Deployment system is completely open source and is available under the Apache 2.0 #footnote[https://apache.org/licenses/LICENSE-2.0] license. The source code can be accessed through the following GitHub repositories:

- *One-Click Kubernetes Operator*: #link("https://github.com/janlauber/one-click-operator")
- *One-Click Main Application*: #link("https://github.com/janlauber/one-click")
- *One-Click Documentation*: #link("https://github.com/janlauber/one-click-docs")

By leveraging these tools and technologies, and making the system open source, we aim to provide a robust, efficient, and accessible solution for OSS deployment. This system simplifies the deployment process, making it accessible to a broader audience and addressing the key challenges identified in our research.
