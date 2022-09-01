output "publicipname" {
  description = "To return the id of the public ip address"
  value       = azurerm_public_ip.publicip.name
  sensitive   = false
}

#output "publicipid" {
 # description = "To return the id of the public ip address"
  
  #value       = azurerm_public_ip.publicip.publicipid
  #sensitive   = false
#}



