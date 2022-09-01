output "publicipname" {
  description = "To return the id of the public ip address"
  value       = azurerm_public_ip.publicip.name
  sensitive   = false
}
