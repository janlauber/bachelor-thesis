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

The user interface of the One-Click Deployment system is developed using Svelte, a modern web framework that simplifies frontend development and enhances user experience. The frontend interface serves as the primary interaction point for users, allowing them to define and manage deployment projects easily.

The frontend codebase is structured to provide a dynamic and intuitive user experience, with components designed to facilitate project creation, application deployment, and configuration. The frontend interacts with the backend through RESTful APIs with the Pocketbase Javascript SDK @PocketbaseJssdk2024, enabling seamless communication between the user interface and the backend system. The frontend leverages Tailwind CSS @TailwindCSSRapidly2020 for styling and Flowbite-Svelte @FlowbiteSvelteUI for UI components, ensuring a consistent and visually appealing design.

With SvelteKit as the frontend framework, the One-Click Deployment system benefits from Svelte's reactivity and SvelteKit's versatility, enabling the development of fast, responsive, and accessible web applications. TypeScript is used to enhance code reliability and maintainability, providing type safety and early error detection during development.



== Integration Strategies

Integration plays a critical role in the operational efficiency of the One-Click Deployment platform. The system integrates with existing CI/CD pipelines to automate the deployment and testing processes. This integration is facilitated through APIs and webhooks, which connect the One-Click Deployment system with tools like Jenkins, GitLab CI, and GitHub Actions.

These integration strategies enhance the platform's flexibility and adaptability, making it suitable for various operational environments and user requirements.
