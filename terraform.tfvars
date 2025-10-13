# Required - Update with your values
project_id   = "promising-balm-470808-m6"

# Optional - Override defaults as needed
instance_name = "my-simple-vm"
zone         = "us-central1-a"
region       = "us-central1"

# Uncomment and modify below to override other defaults
# machine_type = "e2-small"
# disk_size    = 30
# disk_type    = "pd-ssd"

# Custom labels
labels = {
  environment = "development"
  project     = "demo"
  owner       = "devops-team"
}

# Custom firewall ports
firewall_ports = ["22", "80", "443", "8080"]