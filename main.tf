# BACKEND CONFIGURATION
terraform { 
  backend "remote" {} 
}

# PROVIDER CONFIGURATION
provider "google" {
  credentials = file(var.google_file_account_location)
  project     = var.google_project_id
  region      = var.google_region
  zone        = var.google_zone
}

# PROJECT CONFIGURATION APIS
module "initial_apis" {
  source = "github.com/Trazable/Terraform-Trazable-Modules/modules/google/apis/initial-config-apis"

  google_project_id = var.google_project_id
}

# DEFAULT APP ENGINE APPLICATION
module "app_engine" {
  source = "github.com/Trazable/Terraform-Trazable-Modules/modules/google/app-engine"

  google_project_id  = var.google_project_id
  zip_location       = var.zip_location
  google_region      = var.google_region
  google_location    = var.google_location

  dependencies       = [module.initial_apis.depended_on]
}

# BUCKET(S)
module "bucket" {
  source = "github.com/Trazable/Terraform-Trazable-Modules/modules/google/buckets/bucket"

  google_project_id = var.google_project_id
  google_region     = var.google_region
  bucket_name       = var.storage_bucket_name
}

# KMS RING
module "kms_ring" {
  source = "github.com/Trazable/Terraform-Trazable-Modules/modules/google/kms/kms-ring"

  google_project_id = var.google_project_id
  kms_ring_name     = var.kms_ring_name
  google_region     = var.google_region
  
  dependencies      = [module.initial_apis.depended_on]
}

# KMS KEYS WITH THE KMS_RING PATH
module "kms_key" {
  source = "github.com/Trazable/Terraform-Trazable-Modules/modules/google/kms/kms-key"

  kms_key_name      = var.kms_key_name
  # OUTPUT.TF KMS_RING_PATH 
  kms_key_ring_name = module.kms_ring.kms_ring_path
}
