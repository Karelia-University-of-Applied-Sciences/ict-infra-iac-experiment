terraform {
  required_version = ">= 1.6.0"

  required_providers {
    nutanix = {
      source  = "nutanix/nutanix"
      version = "~> 2.4"
    }
  }
}

provider "nutanix" {
  username = var.nutanix_username
  password = var.nutanix_password
  endpoint = var.nutanix_endpoint
  port     = var.nutanix_port
  insecure = var.nutanix_insecure
}

data "nutanix_cluster" "cluster" {
  name = var.cluster_name
}

data "nutanix_subnet" "subnet" {
  subnet_name = var.subnet_name
}

data "nutanix_image" "ubuntu2404" {
  image_name = var.image_name
}

module "ubuntu_test_01" {
  source = "../../modules/nutanix-vm"

  vm_name = var.vm_name

  cluster_uuid = data.nutanix_cluster.cluster.id
  subnet_uuid  = data.nutanix_subnet.subnet.id
  image_uuid   = data.nutanix_image.ubuntu2404.id

  vm_cpu_sockets      = var.vm_cpu_sockets
  vm_vcpus_per_socket = var.vm_vcpus_per_socket
  vm_memory_mib       = var.vm_memory_mib

  admin_username       = var.admin_username
  admin_ssh_public_key = var.admin_ssh_public_key
  admin_password       = var.admin_password
}