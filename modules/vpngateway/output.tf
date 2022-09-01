output "_publicipname" {
  description = "To return the name of the virtual network"
  value       = azurerm_virtual_network_gateway.publicipname.name
  sensitive   = false
}