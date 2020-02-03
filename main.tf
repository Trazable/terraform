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
