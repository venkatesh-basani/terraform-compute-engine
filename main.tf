# Configure Google Cloud Provider
provider "google" {
  project = var.project_id
  region  = var.region
  zone    = var.zone
}

# Create Compute Engine instance
resource "google_compute_instance" "simple_vm" {
  name         = var.instance_name
  machine_type = var.machine_type
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = var.image
      size  = var.disk_size
      type  = var.disk_type
    }
  }

  network_interface {
    network = "default"

    access_config {
      # Include this section to give the VM an external IP address
    }
  }

  # Optional: Add a startup script
  metadata_startup_script = var.startup_script

  tags = var.instance_tags

  labels = var.labels
}

# Create firewall rules
resource "google_compute_firewall" "http" {
  name    = "allow-http-${var.instance_name}"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = var.firewall_ports
  }

  source_ranges = var.firewall_source_ranges
  target_tags   = var.instance_tags
}