variable "nutanix_username" {
  description = "Nutanix Prism Central username"
  type        = string
  sensitive   = true
}

variable "nutanix_password" {
  description = "Nutanix Prism Central password"
  type        = string
  sensitive   = true
}

variable "nutanix_endpoint" {
  description = "Prism Central IP address or DNS name"
  type        = string
}

variable "nutanix_port" {
  description = "Prism Central API port"
  type        = number
  default     = 9440
}

variable "nutanix_insecure" {
  description = "Set true if Prism Central uses a self-signed certificate"
  type        = bool
  default     = true
}

variable "cluster_name" {
  description = "Nutanix cluster name"
  type        = string
  default     = "nutanix-cluster01"
}

variable "subnet_name" {
  description = "Nutanix subnet name"
  type        = string
}

variable "image_name" {
  description = "Ubuntu 24.04 image name in Nutanix Image Service"
  type        = string
}

variable "admin_username" {
  description = "Linux admin username created by cloud-init"
  type        = string
}

variable "admin_ssh_public_key" {
  description = "SSH public key for the Linux admin user"
  type        = string
}


variable "admin_password" {
  description = "Linux admin password created by cloud-init"
  type        = string
}

variable "vm_name" {
  description = "Name of the virtual machine"
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