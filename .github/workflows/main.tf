terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0"
    }
  }
}

provider "docker" {}

variable "server_name" {
  description = "Name of the server"
  type        = string
}

resource "docker_container" "test_server" {
  name  = var.server_name
  image = "nginx:latest"

  ports {
    internal = 80
    external = 8080
  }
}

output "container_name" {
  value = docker_container.test_server.name
}
