output "instance_public_ips" {
  value = {
    "europe-west2-public-a"    = "http://${google_compute_instance.public_instance_1.network_interface[0].access_config[0].nat_ip}"
    "us-west1-public-b"        = "http://${google_compute_instance.public_instance_2.network_interface[0].access_config[0].nat_ip}"
    "asia-northeast3-public-c" = "http://${google_compute_instance.public_instance_3.network_interface[0].access_config[0].nat_ip}"
  }
  description = "List of HTTP URLs for public IP addresses assigned to the instances."
}
