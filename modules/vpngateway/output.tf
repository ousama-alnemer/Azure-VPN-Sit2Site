output "_vpngateway" {
  description = "To return the name of the virtual network"
  value       = azurerm_virtual_network_gateway.vpngateway.name
  sensitive   = false
}