variable "container_name" {
  description = "Name des Docker Containers"
  type        = string
  default     = "my-flex-nginx-container"
}

variable "external_port" {
  description = "Externer Port für den Nginx Container"
  type        = number
  default     = 8080

  validation {
    condition     = var.external_port > 1024 && var.external_port < 65535
    error_message = "Der externe Port muss zwischen 1024 und 65535 liegen."
  }
}

variable "nginx_html_content" {
  description = "HTML Inhalt für die Nginx index.html Seite"
  type        = string
  default     = "<h1>Hello from Terraform!</h1><p>Dieser Container wurde mit Terraform erstellt.</p>"
}