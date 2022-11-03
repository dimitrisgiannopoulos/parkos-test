# Coding challenge

The purpose of this test is to assess your DevOps, Cloud (Native), Kubernetes and Containerization (Docker) skills and 
the ability to migrate different microservices to the cloud. It also tests your ability to read specifications and your
problem-solving skills.

- You have max 4h of time.

## Evaluation criteria

- Containerization (Docker) skills
- Kubernetes skills
- Microservices understanding
- Usage of best practises
- Reusability 
- Problem solving skills
- Ability to read specs

## Cloud platform for microservices

Parkos is moving to Microservices and we want to standardize our infrastructure to enable various independent teams to 
continuously deliver their applications to the various environments (preview, test, staging, production). 
We are following the Cloud Native strategy and are defaulting on Kubernetes as our (cloud-agnostic) runtime platform.


## Your assignment: Kubernetes ready application

You are asked by one of the teams that is working on the example NodeJS microservice to optimize 
and improve their Docker builds. The current process for the developers is to run NodeJS on their local development 
systems and copy the build output into the image.

After optimizing the Docker build process, you have to prepare the manifest files so the application can be deployed to each of our kubernetes 
clusters. The kubernetes clusters are running with an NGINX ingress controller.

All microservices are deployed in their own application namespace, for this project the namespace is ‘example’.

### Requirements

- The npm build process should happen in the image build process and not on the developers machine
- Smallest image size possible (no unnecessary build dependencies, artifacts)
- readinessProbe and livenessProbe on /
- Capable/configurable to run in testing, staging and production
    - flexibility using Helm, Kustomize, jsonnet, yq or any other template
    - different hostname for each environment
    - different $VERSION env variable per deployment
    - use secrets where needed (for this assignment it's fine to commit them)


### Bonus section
- Documentation
- Docker compose file for developers
- Dedicated health check endpoint on /healthz


### Environment
This code repository doesn't include an easy-to-use development environment and there is no running Kubernetes cluster for you to use.

### Useful hints and instructions
- The node app runs in the container with supervisord which is suboptimal
- The container also runs nginx but that's already a IngressController in the cluster this is probably redundant and against containerization best practises
- The kubernetes health checks might fail due to the application running on 127.0.0.1 and not accepting traffic on the pod’s ip which is used by the health checks.
