locals {
  dynamic_html_content = "<h1>Hello from Terraform!</h1><p>Container: ${var.container_name}</p><p>Port: ${var.external_port}</p><p>Custom Content: ${var.nginx_html_content}</p>"
}