# Default Route (Global)
resource "google_compute_route" "app1_route" {
  name           = "app1-route"
  dest_range     = "0.0.0.0/0"
  network        = google_compute_network.app1.name
  next_hop_gateway = "default-internet-gateway"
}

# Router and NAT for Europe West 2
resource "google_compute_router" "app1_router_eu" {
  name    = "app1-router-eu"
  region  = "europe-west2"
  network = google_compute_network.app1.name
}

resource "google_compute_router_nat" "app1_nat_eu" {
  name                               = "app1-nat-eu"
  router                             = google_compute_router.app1_router_eu.name
  region                             = google_compute_router.app1_router_eu.region
  nat_ip_allocate_option             = "AUTO_ONLY"
  source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"
}

# Router and NAT for US West 1
resource "google_compute_router" "app1_router_us" {
  name    = "app1-router-us"
  region  = "us-west1"
  network = google_compute_network.app1.name
}

resource "google_compute_router_nat" "app1_nat_us" {
  name                               = "app1-nat-us"
  router                             = google_compute_router.app1_router_us.name
  region                             = google_compute_router.app1_router_us.region
  nat_ip_allocate_option             = "AUTO_ONLY"
  source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"
}

# Router and NAT for Asia Northeast 3
resource "google_compute_router" "app1_router_asia" {
  name    = "app1-router-asia"
  region  = "asia-northeast3"
  network = google_compute_network.app1.name
}

resource "google_compute_router_nat" "app1_nat_asia" {
  name                               = "app1-nat-asia"
  router                             = google_compute_router.app1_router_asia.name
  region                             = google_compute_router.app1_router_asia.region
  nat_ip_allocate_option             = "AUTO_ONLY"
  source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"
}

