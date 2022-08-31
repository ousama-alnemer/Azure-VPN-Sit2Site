output "_subnetid" {
  description = "To return the id of the subnet"
  value       = azurerm_subnet.subnetvpngateway.id
  sensitive   = false
}