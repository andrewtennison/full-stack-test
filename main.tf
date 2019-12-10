/*
* main.tf
*/

provider "google" {}

module "cloudfunctions-http" {
  source  = "google-terraform-modules/cloudfunctions-http/google"
  version = "1.12.0"
  # A path to the data you want to upload
  local_path = ""
  # The name of the containing bucket
  bucket_name = ""
  # Name of a JavaScript function that will be executed when the Google Cloud Function is triggered
  function_entry_point = ""
  # A user-defined name of the function. Function names must be unique globally
  function_name = ""
}

module "dns-managed-zone" {
  source  = "Eimert/dns-managed-zone/google"
  version = "0.0.3"
  # The DNS zone that is pointing to Google' nameservers (if any). A.k.a. Google' DNS SOA (start of authority). Required suffix: . (dot). See README.md with example for creating resource google_dns_managed_zone.
  dns_zone = ""
  # Descriptive name for dns_zone. See README.md with example for creating resource google_dns_managed_zone.
  dns_name = ""
}

module "kubernetes-engine" {
  source  = "google-terraform-modules/kubernetes-engine/google"
  version = "1.19.1"
  # Global parameters
  general = ""
  # Kubernetes master parameters to initialize
  master = ""
}

module "secret" {
  source  = "terraform-google-modules/secret/google"
  version = "0.1.0"
  # The name of the secret to fetch
  secret = ""
  # The environment to fetch secrets for
  env = ""
  # The application to fetch secrets for
  application_name = ""
  # The path to the GCP credentials
  credentials_file_path = ""
}

module "cloud-datastore" {
  source  = "terraform-google-modules/cloud-datastore/google"
  version = "1.0.0"
  # Service account json auth path
  credentials = ""
  # The project id
  project = ""
  # The contents of a index.yaml file, to apply indexes from
  indexes = ""
}

module "cloud-dns" {
  source  = "terraform-google-modules/cloud-dns/google"
  version = "3.0.0"
  # Zone domain, must end with a period.
  domain = ""
  # Project id for the zone.
  project_id = ""
  # Zone name, must be unique within the project.
  name = ""
}

module "vpn" {
  source  = "terraform-google-modules/vpn/google"
  version = "1.2.0"
  # The ID of the project where this VPC will be created
  project_id = ""
  # IP address of remote-peer/gateway
  peer_ips = []
  # The name of VPC being created
  network = ""
  # The region in which you want to create the VPN gateway
  region = ""
}

module "kubernetes-engine" {
  source  = "terraform-google-modules/kubernetes-engine/google"
  version = "6.1.1"
  # The _name_ of the secondary subnet ip range to use for pods
  ip_range_pods = ""
  # The name of the cluster (required)
  name = ""
  # The _name_ of the secondary subnet range to use for services
  ip_range_services = ""
  # The VPC network to host the cluster in (required)
  network = ""
  # The region to host the cluster in (optional if zonal cluster / required if regional)
  region = ""
  # The project ID to host the cluster in (required)
  project_id = ""
  # The subnetwork to host the cluster in (required)
  subnetwork = ""
}

module "cloud-storage" {
  source  = "terraform-google-modules/cloud-storage/google"
  version = "1.2.0"
  # Prefix used to generate the bucket name.
  prefix = ""
  # Bucket name suffixes.
  names = []
  # Bucket project id.
  project_id = ""
}
