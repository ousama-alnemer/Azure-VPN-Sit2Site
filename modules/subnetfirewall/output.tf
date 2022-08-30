output "_subnetid" {
  description = "To return the id of the subnet"
  value       = azurerm_subnet.subnetfirewall.id
  sensitive   = false
}