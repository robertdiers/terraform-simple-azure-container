# Use the Azure Resource Manager Provider
provider "azurerm" {
  version = "~> 1.15"
}

# Create a new Resource Group
resource "azurerm_resource_group" "terraform-example" {
  name     = "terraform-example-resources"
  location = "westeurope"
}

# Create container
resource "azurerm_container_group" "terraform-example-container" {
  name                = "terraform-example-continst"
  location            = azurerm_resource_group.terraform-example.location
  resource_group_name = azurerm_resource_group.terraform-example.name
  ip_address_type     = "public"
  dns_name_label      = "robertdiers-hello-terraform"
  os_type             = "Linux"

  container {
    name   = "terraform-example-hello-world"
    image  = "tutum/hello-world"
    cpu    = "1"
    memory = "1.5"

    ports {
      port     = 80
      protocol = "TCP"
    }
  }

}
