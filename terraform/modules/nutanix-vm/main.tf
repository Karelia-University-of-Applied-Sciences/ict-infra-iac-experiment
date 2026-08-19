terraform {
  required_providers {
    nutanix = {
      source  = "nutanix/nutanix"
      version = "~> 2.4"
    }
  }
}

locals {
  cloud_init_user_data = templatefile("${path.module}/cloud-init.yml.tftpl", {
    hostname             = var.vm_name
    admin_username       = var.admin_username
    admin_ssh_public_key = var.admin_ssh_public_key
    admin_password       = var.admin_password
    packages             = var.packages
  })
}

resource "nutanix_virtual_machine" "this" {
  name                 = var.vm_name
  cluster_uuid         = var.cluster_uuid
  num_sockets          = var.vm_cpu_sockets
  num_vcpus_per_socket = var.vm_vcpus_per_socket
  memory_size_mib      = var.vm_memory_mib

  nic_list {
    subnet_uuid = var.subnet_uuid
  }

  disk_list {
    data_source_reference = {
      kind = "image"
      uuid = var.image_uuid
    }

    device_properties {
      device_type = "DISK"

      disk_address = {
        device_index = 0
        adapter_type = "SCSI"
      }
    }
  }

  guest_customization_cloud_init_user_data = base64encode(local.cloud_init_user_data)
}
