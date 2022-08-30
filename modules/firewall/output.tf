output "_firewallname" {
  description = "To return the name of the virtual network"
  value       = azurerm_firewall.firewall.name
  sensitive   = false
}