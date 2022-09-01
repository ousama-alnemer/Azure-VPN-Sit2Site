output "_publicipname" {
  description = "To return the id of the public ip address"
  value       = azurerm_public_ip.ip_configuration.publicipname.name
  sensitive   = false
}