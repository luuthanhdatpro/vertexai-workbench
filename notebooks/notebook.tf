terraform {
  backend "gcs" {
    bucket  = "tfstate-bucket-1102"
    prefix  = "notebook/"
  }
}
provider "google" {
  project     = var.project
  region      = var.region
}

data "google_compute_network" "workbench_network" {
  name    = var.vpc_network_name
}

data "google_compute_subnetwork" "workbench_subnetwork" {
  name    = "thanhliu-vertex-subnet"
  region  = var.region
}

resource "google_workbench_instance" "instance" {
    count    = var.isDeleted ? 0 : 1
    name     = "${replace(var.instance_owner, "@thanhliu.site", "")}-${var.instance_name}"
    location = var.zone

    gce_setup {
        machine_type = var.machine_type

        disable_public_ip = false

        boot_disk {
          disk_size_gb  = var.boot_disk_size_gb
          disk_type = var.boot_disk_type
        }

        network_interfaces {
          network = data.google_compute_network.workbench_network.id
          subnet = data.google_compute_subnetwork.workbench_subnetwork.id
          nic_type = "GVNIC"
        }

        metadata = {
          terraform = "true"
        }

        enable_ip_forwarding = false


    }

    disable_proxy_access = "false"

    instance_owners  = [var.instance_owner]

    desired_state = "ACTIVE"

}

