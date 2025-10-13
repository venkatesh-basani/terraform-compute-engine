output "instance_ip" {
  description = "Public IP address of the instance"
  value       = google_compute_instance.simple_vm.network_interface[0].access_config[0].nat_ip
}

output "instance_name" {
  description = "Name of the created instance"
  value       = google_compute_instance.simple_vm.name
}

output "instance_zone" {
  description = "Zone where the instance is running"
  value       = google_compute_instance.simple_vm.zone
}

output "instance_url" {
  description = "URL to access the instance"
  value       = "http://${google_compute_instance.simple_vm.network_interface[0].access_config[0].nat_ip}"
}

output "ssh_command" {
  description = "SSH command to connect to the instance"
  value       = "gcloud compute ssh ${google_compute_instance.simple_vm.name} --zone ${google_compute_instance.simple_vm.zone}"
}