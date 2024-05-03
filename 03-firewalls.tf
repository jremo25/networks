resource "google_compute_firewall" "app1_sg01_http" {
  name        = "app1-sg01-http"
  description = "Allow HTTP traffic"
  network     = google_compute_network.app1.name
  direction   = "INGRESS"
  priority    = 1000

  allow {
    protocol = "tcp"
    ports    = ["80"]
  }

  source_ranges = ["0.0.0.0/0"]

  target_tags = ["app1-sg01-http"]
}

resource "google_compute_firewall" "app1_sg01_ssh" {
  name        = "app1-sg01-ssh"
  description = "Allow SSH traffic"
  network     = google_compute_network.app1.name
  direction   = "INGRESS"
  priority    = 1000

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = ["0.0.0.0/0"]

  target_tags = ["app1-sg01-ssh"]
}

resource "google_compute_firewall" "app1_sg01_egress" {
  name        = "app1-sg01-egress"
  description = "Allow all egress traffic"
  network     = google_compute_network.app1.name
  direction   = "EGRESS"
  priority    = 1000

  allow {
    protocol = "all"
  }

  destination_ranges = ["0.0.0.0/0"]

  target_tags = ["app1-sg01-egress"]
}
