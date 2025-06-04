output "container_name_output" {
  description = "Name des erstellten Docker Containers"
  value       = docker_container.simple_nginx_container.name
}

output "container_external_port" {
  description = "Externer Port des Docker Containers"
  value       = var.external_port
}

output "html_content_used" {
  description = "Verwendeter HTML Inhalt"
  value       = var.nginx_html_content
  sensitive   = false
}

output "container_url" {
  description = "URL zum Erreichen des Containers"
  value       = "http://localhost:${var.external_port}"
}