# Setting up Gromox k8s Cluster

  The instructions for setting up Gromox on a k8s cluster. 
  **Note: this is not secure nor highly available and should not be used in production environments. It is for testing purposes**

* Set up a k8s cluster. You can install [Kind](https://kind.sigs.k8s.io/docs/user/quick-start/#installation) or [Minikube](https://minikube.sigs.k8s.io/docs/start/)
  * This setup was tested using [Kind](https://kind.sigs.k8s.io/docs/user/quick-start/#installation)

* Run the setup file. 
  ```
  ./setup.sh 
  ```

* Grommunio web is available by running the following command:
  ```
  kubectl port-forward service/gromox-service 5050:443 --address 0.0.0.0
  ```
  Then access the GUI with `https://<your ip>:5050/web/`

* Grommunio admin is available by running the following command (for now, it will be resolved in the soon):
  ```
  kubectl port-forward service/gromox-service 5000:8443 --address 0.0.0.0
  ```
  Then access the GUI with `https://<your ip>:5000/web/`
