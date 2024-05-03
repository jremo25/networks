resource "google_compute_network" "app1" {
  name                    = "app1"
  auto_create_subnetworks = false
  routing_mode            = "REGIONAL"
}

resource "google_compute_subnetwork" "public_subnet_1" {
  name                     = "public-subnet-1"
  ip_cidr_range            = "10.32.1.0/24"
  region                   = "europe-west2"
  network                  = google_compute_network.app1.name
  private_ip_google_access = true
}

resource "google_compute_subnetwork" "public_subnet_2" {
  name                     = "public-subnet-2"
  ip_cidr_range            = "192.168.2.0/24"
  region                   = "us-west1"
  network                  = google_compute_network.app1.name
  private_ip_google_access = true
}

resource "google_compute_subnetwork" "public_subnet_3" {
  name                     = "public-subnet-3"
  ip_cidr_range            = "172.20.3.0/24"
  region                   = "asia-northeast3"
  network                  = google_compute_network.app1.name
  private_ip_google_access = true
}
