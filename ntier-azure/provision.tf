resource "null_resource" "apache" {
  triggers = {
    trigger = var.trigger
  }
  provisioner "remote-exec" {
    inline = [
        "sudo apt update",
        "sudo apt install apache2 -y"
    ]
    connection {
    host = azurerm_public_ip.publicip.ip_address
    password = var.web_pass
    user = var.web_user
    }
  }
  depends_on = [
    azurerm_virtual_machine.app
  ]
}