resource "google_workbench_instance" "instance" {
    name = var.instance_name
    location = var.zone

    gce_setup {
        machine_type = var.machine_type // cant be e2 because of accelerator
        accelerator_configs {
            type         = var.accelerator_type
            core_count   = var.accelerator_core_count
        }

    # shielded_instance_config {
    #   enable_secure_boot = true
    #   enable_vtpm = true
    #   enable_integrity_monitoring = true
    # }

        disable_public_ip = false

        service_accounts {
          email = var.service_accounts
        }

        boot_disk {
          disk_size_gb  = var.boot_disk_size_gb
          disk_type = var.boot_disk_type
        }

        data_disks {
          disk_size_gb  = var.data_disk_size_gb
          disk_type = var.data_disk_type
        }

        network_interfaces {
          network = google_compute_network.my_network.id
          subnet = google_compute_subnetwork.my_subnetwork.id
          nic_type = "GVNIC"
        }

        metadata = {
          terraform = "true"
        }

        enable_ip_forwarding = false

        # tags = ["abc", "def"]

    }

    disable_proxy_access = "true"

    instance_owners  = [var.instance_owner]

    labels = {
        k = "val"
    }

    desired_state = "ACTIVE"

}

