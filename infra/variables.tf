variable "project" {
  description = "Your GCP Project ID"
  type        = string
  default     = "thanhliu-proj"
}

variable "zone" {
  description = "The GCP Zone for Vertex Notebook User-Managed Instances"
  type        = string
  default     = "asia-east1-a"
}

variable "region" {
  description = "The GCP region for the GCS bucket and Artifact Registry"
  type        = string
  default     = "asia-east1"
}

# VPC Network Variables

variable "vpc_network_name" {
  description = "The name of your VPC Network"
  type        = string
  default     = "thanhliu"
}

variable "subnet_ip_cidr_range" {
  description = "The name of your VPC Subnetwork"
  type        = string
  default     = "10.0.0.0/21"
}
