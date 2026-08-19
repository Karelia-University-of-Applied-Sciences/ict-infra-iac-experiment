output "vm_name" {
  description = "Name of the created VM"
  value       = nutanix_virtual_machine.this.name
}

output "vm_uuid" {
  description = "UUID of the created VM"
  value       = nutanix_virtual_machine.this.id
}

output "vm_ip_address" {
  description = "Primary IP address of the VM"
  value       = try(nutanix_virtual_machine.this.nic_list_status[0].ip_endpoint_list[0].ip, null)
}
