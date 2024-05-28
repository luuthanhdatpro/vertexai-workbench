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
    name     = "${var.instance_name}-${replace(var.instance_owner, "@thanhliu.site")}"
    location = var.zone

    gce_setup {
        machine_type = var.machine_type // cant be e2 because of accelerator
        # accelerator_configs {
        #     type         = var.accelerator_type
        #     core_count   = var.accelerator_core_count
        # }

    # shielded_instance_config {
    #   enable_secure_boot = true
    #   enable_vtpm = true
    #   enable_integrity_monitoring = true
    # }

        disable_public_ip = false

        # service_accounts {
        #   email = var.service_accounts
        # }

        boot_disk {
          disk_size_gb  = var.boot_disk_size_gb
          disk_type = var.boot_disk_type
        }

        # data_disks {
        #   disk_size_gb  = var.data_disk_size_gb
        #   disk_type = var.data_disk_type
        # }

        network_interfaces {
          network = data.google_compute_network.workbench_network.id
          subnet = data.google_compute_subnetwork.workbench_subnetwork.id
          nic_type = "GVNIC"
        }

        metadata = {
          terraform = "true"
        }

        enable_ip_forwarding = false

        # tags = ["abc", "def"]

    }

    disable_proxy_access = "false"

    instance_owners  = [var.instance_owner]

    labels = {
        k = "val"
    }

    desired_state = "ACTIVE"

}

