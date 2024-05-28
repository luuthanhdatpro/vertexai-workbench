# Common Variables

variable "project" {
  description = "Your GCP Project ID"
  type        = string
  default = "thanhliu-proj"
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

variable "tfstate_prefix" {
  description = "Prefix of state file in GCS bucket"
  type        = string
}
# Notebooks Variables

variable "service_accounts" {
  description = "The service account that serves as an identity for the VM instance."
  type        = string
  default     = ""
}

variable "instance_name" {
  description = "The name of this workbench instance."
  type        = string
  default     = "notebook"
}

variable "instance_owner" {
  description = "The owner of this instance after creation."
  type        = string
}

variable "machine_type" {
  description = "The Notebook Instance's machine type"
  type        = string
  default     = "e1-standard-2"
}

variable "boot_disk_type" {
  description = "Boot disk type for notebook instances. Possible values are DISK_TYPE_UNSPECIFIED, PD_STANDARD, PD_SSD and PD_BALANCED"
  type        = string
  default     = "PD_STANDARD"
}

variable "boot_disk_size_gb" {
  description = "The size of the boot disk in GB attached to notebook instances, up to a maximum of 64 TB. The minimum recommended value is 100GB."
  type        = number
  default     = 100
}

variable "data_disk_type" {
  description = "Data disk type for notebook instances. Possible values are DISK_TYPE_UNSPECIFIED, PD_STANDARD, PD_SSD and PD_BALANCED"
  type        = string
  default     = "PD_STANDARD"
}

variable "data_disk_size_gb" {
  description = "The size of the data disk in GB attached to notebook instances, up to a maximum of 64 TB. You can choose the size of the data disk based on how big your notebooks and data are."
  type        = number
  default     = 100
}

variable "accelerator_type" {
  description = "Type of accelerator. Possible values are ACCELERATOR_TYPE_UNSPECIFIED, NVIDIA_TESLA_K80, NVIDIA_TESLA_P100, NVIDIA_TESLA_V100, NVIDIA_TESLA_P4, NVIDIA_TESLA_T4, NVIDIA_TESLA_T4_VWS, NVIDIA_TESLA_P100_VWS, NVIDIA_TESLA_P4_VWS, NVIDIA_TESLA_A100, TPU_V2, and TPU_V3"
  type        = string
  default     = "NVIDIA_TESLA_P100"
}

variable "accelerator_core_count" {
  description = "Count cores of accelerator."
  type        = number
  default     = 1
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

