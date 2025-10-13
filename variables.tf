# Required variables
variable "project_id" {
  description = "promising-balm-470808-m6"
  type        = string
  validation {
    condition     = length(var.project_id) > 0
    error_message = "Project ID cannot be empty."
  }
}

# Optional variables with defaults
variable "instance_name" {
  description = "Name of the Compute Engine instance"
  type        = string
  default     = "simple-vm"
}

variable "machine_type" {
  description = "Machine type for the instance"
  type        = string
  default     = "e2-micro"
}

variable "zone" {
  description = "Zone where the instance will be created"
  type        = string
  default     = "us-central1-a"
}

variable "region" {
  description = "Region where the instance will be created"
  type        = string
  default     = "us-central1"
}

variable "image" {
  description = "Boot image for the instance"
  type        = string
  default     = "ubuntu-os-cloud/ubuntu-2204-lts"
}

variable "disk_size" {
  description = "Boot disk size in GB"
  type        = number
  default     = 20
}

variable "disk_type" {
  description = "Boot disk type"
  type        = string
  default     = "pd-standard"
}

variable "startup_script" {
  description = "Startup script to run on instance initialization"
  type        = string
  default     = <<-EOF
    #!/bin/bash
    apt-get update
    apt-get install -y nginx
    systemctl start nginx
    systemctl enable nginx
  EOF
}

variable "instance_tags" {
  description = "Network tags for the instance"
  type        = list(string)
  default     = ["http-server", "https-server", "ssh"]
}

variable "firewall_ports" {
  description = "Ports to open in firewall rules"
  type        = list(string)
  default     = ["22", "80", "443"]
}

variable "firewall_source_ranges" {
  description = "Source IP ranges for firewall rules"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "labels" {
  description = "Labels to apply to the instance"
  type        = map(string)
  default = {
    environment = "dev"
    terraform   = "true"
  }
}