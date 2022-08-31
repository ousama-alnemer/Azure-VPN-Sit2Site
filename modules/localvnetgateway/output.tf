output "_peervnetgetwayname" {
  description = "To return the id of the network interface"
  value       = azurerm_local_network_gateway.localvnetgetway.name
  sensitive   = false
}