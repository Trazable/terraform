# PROJECT VARIABLES
variable "google_organisation_id" {
  type    = string
  default = "trazable.io"
}

variable "google_location" {
  type    = string
  default = "europe-west"
}

variable "google_project_id" {
  type    = string
  default = ""
}

variable "google_region" {
  type    = string
  default = "europe-west1"
}

variable "google_zone" {
  type    = string
  default = "europe-west1-b"
}

variable "google_file_account_location" {
  type    = string
  default = "./google_service_account.json"
}

# RESOURCE VARIABLES
variable "zip_location" {
  type    = string
  default = "hello-world.zip"
}

variable "service_accounts" {
  type    = list
  default = []
}

variable "google_api_service" {
  type    = list
  default = []
}

variable "kms_ring_name" {
  type    = list
  default = []
}

variable "kms_key_name" {
  type    = list
  default = []
}

variable "storage_bucket_name" {
  type    = list
  default = []
}

variable "storage_bucket_object_name" {
  type    = list
  default = []
}
