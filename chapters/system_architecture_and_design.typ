= System Architecture and Design
This chapter presents the architecture and design of the One-Click Deployment system, detailing the system overview, architectural components including backend and frontend, database design, and security considerations that underpin the system's effectiveness and efficiency in deploying open-source software (OSS).

== System Overview
The following diagram shows how and what the One-Click operator manages.

- In #text(red)[red] you see everything responsible for the frontend / pocketbase backend. 
- In #text(blue)[blue] you see everything which handles Kubernetes natively. 
- In #text(green)[green] you see what the One-Click operator manages and controls.

Every Kubernetes resource will get created and managed within a Kubernetes namespace named with the *project ID*

#figure(
  image("../figures/system-architecture-and-design.png", width: 80%),
  caption: "System Architecture and Design"
)

#pagebreak()

The architecture of the solution is designed to operate within a Kubernetes ecosystem, focusing on simplicity and manageability for deploying containers. Here is a high-level view of its main components:
- *Frontend Component*: Developed with Svelte, the frontend provides the user interface. Its primary role is to facilitate user interaction and input, which it relays to the backend for processing.
- *Backend System*: The backend, powered by Pocketbase, acts as the central processing unit. It interprets requests from the frontend, managing the necessary API calls and interactions within the Kubernetes environment.
- *Kubernetes Cluster Interaction*: The backend is responsible for orchestrating various elements within the Kubernetes cluster. A key function includes the creation and management of namespaces, segregating projects to maintain orderly and isolated operational environments.
- *Custom Resource Management (Rollouts)*: Rollouts, defined as Custom Resource Definitions (CRDs) within Kubernetes, are managed by the backend. These are central to the deployment and operational processes, serving as bespoke objects tailored to the system's requirements.
- *One-Click Kubernetes Operator*: This component simplifies interactions with Kubernetes. It automates the handling of several Kubernetes native objects and processes, including deployments, scaling, and resource allocation. The operator is crucial for streamlining complex tasks and ensuring efficient system operations.
- *System Scalability*: The architecture is designed with scalability in mind, using Kubernetes' capabilities to handle a range of workloads and adapting as necessary for different project sizes and requirements.
This architecture aims to streamline the deployment process for OSS containers, offering an efficient and manageable system that leverages the strengths of Kubernetes, Svelte and Pocketbase.

#pagebreak()

== Architecture Design
The system architecture is modular, comprising distinct backend and frontend components, and is built on a microservices architecture principle to ensure scalability, maintainability, and ease of updates.

=== Backend Architecture
The One-Click system leverages the open-source backend platform Pocketbase  to manage authentication, data storage, and serving the frontend interface. In the release process, Pocketbase and frontend code are compiled together into a single container image, which is then pushed to the Github container registry, streamlining the deployment process.

Pocketbase's flexibility allows for the extension of its capabilities with custom Golang code. This feature is utilized to listen for specific events, upon which custom logic is executed, including making Kubernetes API calls and managing the Kubernetes resources initiated through the frontend interface. The project's code, demonstrating these integrations, can be accessed at https://github.com/janlauber/one-click/tree/main/pocketbase.

==== Authentication
Using JWT tokens, Pocketbase handles authentication processes efficiently. Upon receiving user credentials, the backend verifies them and returns a JWT token for successful authentications. This token is then stored in the local storage by the frontend and used for subsequent requests to the backend.

The system also supports authentication through various providers, including Google, GitHub, and Microsoft, with the frontend dynamically displaying login options based on the enabled providers in Pocketbase.

#pagebreak()

==== Database UML
The system's database structure is visualized using the PocketBaseUML tool, providing a clear representation of the data model and relationships.

#figure(
  image("../figures/pocketbase-uml.png", width: 100%),
  caption: "Database UML"
)

==== Custom Endpoints
Pocketbase's capability to create custom endpoints is extensively utilized to facilitate frontend interactions. These custom endpoints, defined in the *main.go* file, support various operations, from serving the frontend and backend to fetching rollout metrics and managing Kubernetes resources.
Each endpoint enforces JWT authentication to ensure secure access, except for the websocket endpoints, which are designed for real-time updates and logs.

==== Environment Variables
A set of environment variables is defined to configure the system's operation, such as specifying local deployment settings and configuring the auto-update feature's checking frequency.

=== Frontend Architecture
The frontend of the One-Click Deployment system is thoughtfully designed to offer a dynamic, user-friendly interface, allowing for an intuitive experience in managing open-source software deployment processes. Built on SvelteKit and augmented with TypeScript, it employs Tailwind CSS for styling and incorporates Flowbite-Svelte for UI components. The frontend leverages the Pocketbase JavaScript SDK for seamless backend interaction. Notably, the frontend's entire codebase—comprising JavaScript, HTML, and CSS—is compiled into optimized static files. These static assets are then served in conjunction with the Pocketbase backend within the same container, highlighting the system's streamlined deployment strategy.

==== SveteKit
Utilizing SvelteKit as the frontend framework enables the One-Click Deployment system to harness Svelte's reactivity and SvelteKit's versatility for building sophisticated web applications. SvelteKit's support for server-side rendering, static site generation, and single-page applications ensures that the frontend is fast, responsive, and accessible across all devices and network conditions.

==== TypeScript
TypeScript brings type safety to the development process, enhancing code reliability and maintainability. It helps in identifying and preventing potential issues early in the development cycle, facilitating easier code management and contributing to a more robust application.

==== Tailwind CSS and Flowbite-Svelte
The combination of Tailwind CSS's utility-first approach with Flowbite-Svelte's component library enables rapid, customizable UI development. This setup allows for the quick implementation of a visually appealing and responsive design that aligns with current web standards.

==== Pocketbase JavaScript SDK
The frontend extensively uses the Pocketbase JavaScript SDK to communicate with the backend efficiently. This SDK simplifies making API requests, managing authentication, and performing CRUD operations, ensuring that the frontend and backend interactions are smooth and secure.

==== Compiled Static Assets
A key feature of the system's frontend architecture is the compilation of its codebase into static assets. This process transforms the JavaScript, HTML, and CSS into highly optimized files that are ready for deployment. These compiled static assets are then served alongside the Pocketbase backend within the same container. This approach ensures that the deployment of the frontend is not only efficient but also simplifies the overall system architecture by bundling both frontend and backend together.

This method of serving compiled static assets alongside the backend within the same container streamlines the deployment and hosting process, eliminating the need for separate setups for the frontend and backend. It encapsulates the essence of operational efficiency and ease of use, key principles that guide the design and implementation of the One-Click Deployment system. If needed, the frontend could also get separated from the backend and hosted independently.

== Security Considerations
Security is a paramount concern in the system's design, incorporating best practices to safeguard user data and deployed applications.
- *Authentication and Authorization*: Implements secure authentication mechanisms, such as OAuth2, and role-based access control (RBAC) to ensure that users can only access and manage their projects.
- *Data Encryption*: Data at rest in the database and data in transit between the client and server are encrypted using industry-standard encryption algorithms. This is also a key feature of Pocketbase.
- *Regular Updates and Patch Management*: The system architecture is designed to facilitate easy updates and patches, ensuring that all components remain secure against known vulnerabilities.
- *Secure Development Practices*: Adheres to secure coding practices and regular security audits to preemptively address potential security issues.
