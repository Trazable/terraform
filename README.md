# Terraform

Terraform tool to use infrastructure as Code.

## Terraform CI deployments

This project allows manage a cloud project with the terraform tool and treat the infrastructure as code, creating a immutable infrastructure and versioning the changes.

The main.tf contains the minimun necessary infrastructure to configure a project, the backend of the terraform state are established with prefix to allow manage differents environments.

If you wanna use terraform in local use it with docker with the same version of the gitlab-ci.yml.

Command: docker run -it -v $PWD:$PWD -w $PWD hashicorp/terraform:{same_version_gitlab} (command)

## Trazable Terraform Modules

All the code are imported from the trazable github [Github-Trazable-Modules](https://github.com/Narfware/Terraform-Trazable-Modules)

## Getting Started

Terraform is executed in the CI with the configuration that are defined in the gitlab-ci.yml, if you want execute terraform locally (EXCEPTIONAL TEST)
you should run terraform with docker with the version specified in the runner of gitlab.

## Google cloud platform connection requirements

* Create service account with project editor permissions.

* Download the service account json file and move it into the project folder.

## Terraform CLI

* terraform init: Init terraform project reading the main.tf file
* terraform plan: Pre-visualization of the actions to the infrastructure including (Changes,creations...)
* terraform apply: Apply the configuration configured in the main.tf file
* terraform -target [resource_name] [operation], example: terraform -target google_compute_instance.instance_name destroy
* terraform validate: Terraform syntax validation.

## Built With

* [Terraform](https://www.terraform.io/docs/index.html) - Terraform Documentation

## Extra information

To create a resource dependencies you can use the resource names like variables in other resources, doing this, terraform knows that these resources has a dependency of the resource's name used, other way is using [depends_on] = [resource_name]  

* [Read more about explicit and implicit dependencies](https://learn.hashicorp.com/terraform/getting-started/dependencies#implicit-and-explicit-dependencies)

You can specify variables in the variables.tf file, also you can define a default value, if a default value does not exist, terraform cli will ask for those values.
