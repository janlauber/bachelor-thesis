= Implementation

== Development Environment Setup

The development of the One-Click Deployment system necessitates a specifically configured environment to support the technologies used. This setup includes a Kubernetes cluster, which is central to deploying and managing containerized applications. Developers need to install Docker to containerize the application, ensuring consistent operation across different environments. The backend development leverages Go, requiring a Go environment setup, while the frontend uses Node.js and SvelteKit, necessitating the installation of Node.js and the appropriate npm packages. \
The development environment setup involves:
- A Kubernetes cluster either locally via Minikube or as a Managed Service at Natron Tech AG @NatronTechAG.
- Docker installation for building and managing containers.
- Node.js and npm to handle various frontend dependencies and build processes.
- Go environment for backend development, set to the appropriate version to ensure compatibility with all dependencies and libraries used.

These tools and setups form the backbone of the development infrastructure, providing a robust platform for building, testing, and deploying the system components efficiently.

Generally, the development environment are described in detail in the corresponding *README* files of the respective repositories.

== Core Functionality Implementation

=== Deployment Module (Kubernetes Operator)

The Kubernetes Operator within the One-Click Deployment platform acts as a core component, designed to simplify the management of deployments within the Kubernetes ecosystem. It automates the process of deploying, updating, and maintaining containerized applications. Using Custom Resource Definitions (CRDs), the operator allows users to define their applications in a declarative manner. \

The development of this module involved using the Operator SDK @OperatorSDK, which provides tools and libraries to build Kubernetes operators in Go. This SDK facilitates the monitoring of resource states within the cluster, handling events such as creation, update, and deletion of resources.

In the #emph("controllers") directory of the #emph("one-click-operator repository") @lauberJanlauberOneclickoperator2024 on GitHub, the core functionality of the operator is implemented. This includes the reconciliation loop, which continuously monitors the state of resources and ensures that the desired state is maintained. The operator interacts with the Kubernetes API to create and manage resources, such as Deployments, Services, and ConfigMaps, based on the user-defined specifications. \

The *rollout_controller.go* @OneclickoperatorControllersRollout_controller is the primary controller responsible for managing Rollout resources.
The following code snippets illustrate the core functionality of the deployment module:

```go
// RolloutReconciler reconciles a Rollout object
func (r *RolloutReconciler) Reconcile(ctx context.Context, req ctrl.Request) (ctrl.Result, error) {
	log := log.FromContext(ctx)

	// Fetch the Rollout instance
	var rollout oneclickiov1alpha1.Rollout
	if err := r.Get(ctx, req.NamespacedName, &rollout); err != nil {
		if errors.IsNotFound(err) {
			// Object not found
			log.Info("Rollout resource not found.")
			return ctrl.Result{}, nil
		}
		// Error reading the object - requeue the request.
		log.Error(err, "Failed to get Rollout.")
		return ctrl.Result{}, err
	}

	// Reconcile ServiceAccount
	if err := r.reconcileServiceAccount(ctx, &rollout); err != nil {
		log.Error(err, "Failed to reconcile ServiceAccount.")
		return ctrl.Result{}, err
	}

	// Reconcile PVCs, Secrets, Deployment, Service, Ingress, HPA
  [...]

	// Update status of the Rollout
	if err := r.updateStatus(ctx, &rollout); err != nil {
		if errors.IsConflict(err) {
			log.Info("Conflict while updating status. Retrying.")
			return ctrl.Result{Requeue: true}, nil
		}
		log.Error(err, "Failed to update status.")
		return ctrl.Result{}, err
	}

	return ctrl.Result{}, nil
}

// SetupWithManager sets up the controller with the Manager. This will tell the manager to start the controller when the Manager is started.
func (r *RolloutReconciler) SetupWithManager(mgr ctrl.Manager) error {
	return ctrl.NewControllerManagedBy(mgr).
		For(&oneclickiov1alpha1.Rollout{}).
		Owns(&appsv1.Deployment{}).
		Owns(&corev1.Service{}).
		Owns(&networkingv1.Ingress{}).
		Owns(&corev1.Secret{}).
		Owns(&corev1.PersistentVolumeClaim{}).
		Owns(&autoscalingv2.HorizontalPodAutoscaler{}).
		Owns(&corev1.ServiceAccount{}).
		Complete(r)
}
```

The reconciliation loop continuously monitors the state of Rollout resources, ensuring that the desired state is maintained. The controller reconciles various resources, such as ServiceAccounts, PVCs, Secrets, Deployments, Services, Ingress, and HPAs, based on the user-defined specifications. The *SetupWithManager* function sets up the controller with the Manager, instructing the manager to start the controller when the Manager is started.

The deployment module is a critical component of the One-Click Deployment system, automating the deployment and management of containerized applications within the Kubernetes environment. The operator simplifies complex tasks, streamlining the deployment process and ensuring efficient system operations.

#pagebreak()

=== Backend Implementation

The backend of the One-Click Deployment system is built using Pocketbase, an open-source platform that simplifies backend development and deployment. The backend system handles user authentication, data storage, and interactions with the Kubernetes cluster. The backend codebase is written in Go, leveraging the flexibility and performance of the language to manage the system's core functionalities.

The backend interacts with the Kubernetes API to creates and manages the logical resources required to deploy the Rollout objects, which then trigger the Kubernetes Operator to handle the deployment process. The backend also manages user authentication, ensuring secure access to the system's functionalities.

The backend codebase is structured to handle various API endpoints, each responsible for specific operations, such as user authentication, project creation, and Rollout management. The backend interacts with the frontend through RESTful APIs, processing requests and returning appropriate responses based on the system's state and user input.

The following code snippet of the *main.go* @OneclickPocketbaseMain demonstrates the implementation of a backend API endpoint for creating a new project:

```go
[...]
func main() {
	// Initialize the Pocketbase app
	app := pocketbase.New()

	[...]

	// Listen for incommint requests to create a new rollout and trigger the rollout creation process in the Kubernetes cluster
	app.OnRecordBeforeCreateRequest().Add(func(e *core.RecordCreateEvent) error {
		switch e.Collection.Name {
		case "rollouts":
			return controller.HandleRolloutCreate(e, app)
		}
		return nil
	})

	[...]
}
```

The code snippet demonstrates the event handling mechanism in Pocketbase, where the backend listens for incoming requests to create a new Rollout object. Upon receiving the request, the backend triggers the Rollout creation process in the Kubernetes cluster, initiating the deployment of the specified application.

The backend implementation is designed to provide a robust and efficient foundation for the One-Click Deployment system, enabling seamless interactions between the frontend, backend, and Kubernetes environment.

=== User Interface Implementation

The user interface of the One-Click Deployment system is developed using Svelte @Svelte, a modern web framework that simplifies frontend development and enhances user experience. The frontend interface serves as the primary interaction point for users, allowing them to define and manage deployment projects easily.

The frontend codebase is structured to provide a dynamic and intuitive user experience, with components designed to facilitate project creation, application deployment, and configuration. The frontend interacts with the backend through RESTful APIs with the Pocketbase Javascript SDK @PocketbaseJssdk2024, enabling seamless communication between the user interface and the backend system. The frontend leverages Tailwind CSS @TailwindCSSRapidly2020 for styling and Flowbite-Svelte @FlowbiteSvelteUI for UI components, ensuring a consistent and visually appealing design.

With SvelteKit as the frontend framework, the One-Click Deployment system benefits from Svelte's reactivity and SvelteKit's versatility, enabling the development of fast, responsive, and accessible web applications. TypeScript is used to enhance code reliability and maintainability, providing type safety and early error detection during development.

#pagebreak()

==== Screenshots

The user interface of the One-Click Deployment system features a clean and intuitive design, allowing users to create projects, manage deployments, and configure application settings easily. The following screenshots showcase the key components of the user interface.

The following screenshots illustrates the user interface of the One-Click Deployment system, showcasing the current state of the system:

#figure(
  image("../figures/projects-overview.png", width: 80%),
  caption: "One-Click Deployment System Projects Overview"
)

The user interface provides a clean and intuitive design, allowing users to create new projects, sort by tags, see the last rollout time, and the ID which is the name of the Kubernetes namespace.

The following screenshot illustrates the deployments overview, showcasing the list of deployments within a project:

#figure(
  image("../figures/deployments-overview.png", width: 80%),
  caption: "One-Click Deployment System Deployments Overview"
)

The deployments overview provides detailed information about each deployment, including the deployment name, status, url (if configured), the last rollout time, number of replicas, and current deployed docker image.

#pagebreak()

Each deployment needs a blueprint to be created. The blueprint is a configuration template for the deployment. The user can create a new blueprint or select an existing one. The blueprint contains the deployment configuration which are the same as the Rollout CRD.

#figure(
  image("../figures/blueprints.png", width: 80%),
  caption: "One-Click Deployment System Blueprints"
)

When selecting or creating a new deployment within a project, users will land on the deployment overview page, as shown in the following screenshot:

#figure(
  image("../figures/deployment-overview.png", width: 80%),
  caption: "One-Click Deployment System Streamlit Deployment Overview"
)

The deployment overview page displays high level information and stats about the deployment configuration, such as amount of rollouts, instances, interfaces, volumes, environment variables, secret variables and the current docker image. There is also real time CPU and memory usage monitoring.

#pagebreak()

The map shows real time Kubernetes resources generated by the deployment, such as pods, services, ingresses, and persistent volume claims etc.

#figure(
  image("../figures/map.png", width: 75%),
  caption: "One-Click Deployment System Map"
)

Each item can also get selected to show more detailed information about the resource (e.g. logs, events, yaml configuration).

#figure(
  image("../figures/map-drawer.png", width: 75%),
  caption: "One-Click Deployment System Map Drawer"
)

#pagebreak()

Each time something gets changed in the deployment configuration, a new rollout gets triggered. In the rollouts table the user can see his old rollouts and the current one. He can also rollback to a previous rollout. This functionality is like a snapshot of the deployment configuration at a specific time.

#figure(
  image("../figures/rollouts.png", width: 80%),
  caption: "One-Click Deployment System Rollouts Table"
)

When selecting an old rollout to rollback, the user can see the differences between the current and the selected rollout.

#figure(
	image("../figures/rollouts-diff.png", width: 80%),
	caption: "One-Click Deployment System Diff"
)

#pagebreak()

The core of each deployment if of course the container image which gets deployed. The user can see the current deployed image and can also do some advanced automation like auto-updating the image on a specific schedule, policy and sorting.

#figure(
	image("../figures/image.png", width: 75%),
	caption: "One-Click Deployment System Container Image"
)

The system provides horizonal and vertical scaling of the deployment. The user can adjust the amount of replicas and the resource requests and limits of the deployment.

#figure(
	image("../figures/scale.png", width: 75%),
	caption: "One-Click Deployment System Scaling"
)

To ensure the connectivity of the deployed application, the system provides a networking section where the user can configure interfaces. An interface is just a Kubernetes service which then can also get exposed via an ingress configuration.

#figure(
	image("../figures/network.png", width: 75%),
	caption: "One-Click Deployment System Networking"
)

With volumes the user can configure persistent storage for the deployment. The only things the user has to do is to set a name, the size, the mount path and the storage class.

#figure(
	image("../figures/volumes.png", width: 75%),
	caption: "One-Click Deployment System Volumes"
)

#pagebreak()

For the environment variables the user can split them into normal and secret variables. The secret variables are stored in Kubernetes secrets.

#figure(
	image("../figures/volumes.png", width: 75%),
	caption: "One-Click Deployment System Environment Variables"
)

In the deployment settings the user can change it's name or avatar. He can also use the advanced editing mode to edit the CRD of the deployment directly. It's also possible to create new blueprint out of the current deployment configuration. The blueprint can then be used to create new deployments with the same configuration. The user can also delete the deployment.

#figure(
	image("../figures/deployment-settings.png", width: 75%),
	caption: "One-Click Deployment System Deployment Settings"
)

#pagebreak()

== Integration Strategies

Integration plays a critical role in the operational efficiency of the One-Click Deployment platform. The system integrates with existing CI/CD pipelines to automate the deployment and testing processes. This integration is facilitated through APIs and webhooks, which connect the One-Click Deployment system with tools like Jenkins, GitLab CI, and GitHub Actions.

These integration strategies enhance the platform's flexibility and adaptability, making it suitable for various operational environments and user requirements.

== Project Management
To manage the development process efficiently, we used GitHub Projects, which provided a straightforward Kanban board for tracking progress. This tool was instrumental in organizing tasks, collecting feature requests, and prioritizing work based on user feedback and identified requirements. The use of GitHub Projects facilitated a clear and transparent workflow, enabling team members to collaborate effectively and stay aligned on project goals.

- *Kanban Board*: The Kanban board in GitHub Projects allowed us to visualize the development process, track the status of tasks, and manage the flow of work. Features and tasks were categorized into columns such as "To Do," "In Progress," "Review," and "Done," providing a clear overview of the project's progress.
- *Feature Collection*: Based on user feedback and requirements analysis, features were collected and added to the backlog. This ensured that user needs were continuously integrated into the development cycle, leading to a more user-centered product.
- *Prioritization*: Tasks were prioritized according to their importance and impact, ensuring that critical features and fixes were addressed promptly. This approach helped maintain a focus on delivering high-value functionality in each iteration.

By leveraging GitHub Projects as a project management tool, we were able to streamline the development process, enhance collaboration among team members, and deliver a user-friendly and robust One-Click Deployment system.
Also the use of GitHub Issues and Pull Requests was essential for tracking bugs, feature requests, and code changes, ensuring a structured and organized development process with a clear transparency for all users and contributors.