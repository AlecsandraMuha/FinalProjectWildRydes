Assessment Definition


This assessment tests Cloud & DevOps skills, focusing on GCP, Git, Ansible, Docker, Kubernetes, Terraform, and Jenkins. General Requirements 
• Implement a Continuous Integration / Continuous Deployment (CI/CD) pipeline using Jenkins (or cloud build/cloud deploy from GCP, or Github/GitLab for the CI/CD part
).
• Use Git for version control, keeping the codebase in a publicly accessible repository.
• Provision and manage infrastructure using Terraform, complying with best practices (you can use existing modules).
• Employ Ansible for configuration management. • Containerize applications using Docker and manage them with Kubernetes (GKE).
• Ensure security measures are implemented where appropriate. What Has to be Created (Mandatory) Infrastructure Provisioning 
• Provision a Google Kubernetes Engine (GKE) cluster with a configurable number of nodes (between 2 and 5) using Terraform. 
• Automatically deploy a Dockerized web application in the GKE cluster. 
• Implement autoscaling based on CPU usage (pod scaling).
• Set up a Cloud SQL database in GCP with automated backups. CI/CD Pipeline 
• Implement a Jenkins CI/CD pipeline for the web application. 
• Automate the build and deployment process using Jenkins or the chosen tool, integrating with Git. 
• Implement within the CI/CD pipeline (ex: unit testing, integration testing etc). 
• Use Ansible for deployment scripts. Networking and Security 
• Configure VPC Network, Subnets, Firewall Rules, and HTTP(S) Load Balancers for GCP infrastructure.
• Implement secure communication between the web application and the database using SSL/TLS. Monitoring and Logging 
• Set up Cloud Monitoring for monitoring and alerting. (or use prometheus/grafana, any working monitoring solution)
• Aggregate logs from the GKE cluster and store them in Google Cloud Storage (GCS). Challenges 
• Ensure high availability and fault tolerance. • Implement proper error handling and validation in the Terraform scripts.
• Develop clear and comprehensive documentation. Deliverables Codebase The codebase must be made available in a public Git repository and must contain:
• Terraform code (*.tf files). • Dockerfile(s) for the web application. • Ansible playbooks. • Jenkins pipeline configuration.
• A README file detailing the architecture, components, and how to run the project.
Assessment Demo You will be required to present your solution in a follow-up call. 
The demonstration must include: • A walk-through of the code and architecture.
• Deployment of the web application using the CI/CD pipeline.
• A demo showing the functionality of the web application, autoscaling in action, and monitoring and alerting setup with Cloud Monitoring.

Internship project
Setps:

Infrastructure i. terraform file containing provider(google), cluster(my-gke-cluster), database(my-database) ii. created deployment.yaml, service.yaml and autoscale.yaml (kubernetes)
CI/CD i. created pipeline with git, that takes the jenkinsfile from the configured git repository ii. the jenkinsfile contains the following stages: Checkout, Build, Tag and Tests )
Networking i. Created a vpc network using terraform ii. Created subnets iii. Created a firewall rule
Deploy with Ansible i. Made a playbook and a Dockerfile which installed Ansible
