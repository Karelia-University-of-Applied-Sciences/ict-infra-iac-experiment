variable "vm_name" {
  description = "Name of the virtual machine"
  type        = string
}

variable "cluster_uuid" {
  description = "Nutanix cluster UUID"
  type        = string
}

variable "subnet_uuid" {
  description = "Nutanix subnet UUID"
  type        = string
}

variable "image_uuid" {
  description = "Nutanix image UUID used as the VM boot disk"
  type        = string
}

variable "vm_cpu_sockets" {
  description = "Number of CPU sockets"
  type        = number
  default     = 1
}

variable "vm_vcpus_per_socket" {
  description = "Number of vCPUs per socket"
  type        = number
  default     = 2
}

variable "vm_memory_mib" {
  description = "Memory size in MiB"
  type        = number
  default     = 4096
}

variable "admin_username" {
  description = "Linux admin username created by cloud-init"
  type        = string
  default     = "serveradmin"
}

variable "admin_ssh_public_key" {
  description = "SSH public key for the Linux admin user"
  type        = string
}

variable "admin_password" {
  description = "Linux admin password created by cloud-init"
  type        = string
  sensitive   = true
}

variable "packages" {
  description = "Packages installed by cloud-init"
  type        = list(string)

  default = [
    "qemu-guest-agent",
    "openssh-server",
    "curl",
    "vim",
    "git"
  ]
}