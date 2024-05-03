resource "google_compute_instance" "public_instance_1" {
  depends_on   = [google_compute_subnetwork.public_subnet_1]
  name         = "europe-west2-instance-public-a"
  machine_type = "e2-medium"
  zone         = "europe-west2-a"

  boot_disk {
    initialize_params {
      image = "projects/debian-cloud/global/images/family/debian-11"
    }
  }

  network_interface {
    network    = google_compute_network.app1.name
    subnetwork = google_compute_subnetwork.public_subnet_1.name
    access_config {
      // Empty block to assign a public IP
    }
  }

  metadata = {
    startup-script = file("${path.module}/startup-script.sh")
  }

  service_account {
    scopes = ["cloud-platform"]
  }

  tags = ["app1-sg01-http"]

  labels = {
    name = "europe-west2-public-a"
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "google_compute_instance" "public_instance_2" {
  depends_on   = [google_compute_subnetwork.public_subnet_2]
  name         = "us-west1-instance-public-b"
  machine_type = "e2-medium"
  zone         = "us-west1-b"

  boot_disk {
    initialize_params {
      image = "projects/debian-cloud/global/images/family/debian-11"
    }
  }

  network_interface {
    network    = google_compute_network.app1.name
    subnetwork = google_compute_subnetwork.public_subnet_2.name
    access_config {
      // Empty block to assign a public IP
    }
  }

  metadata = {
    startup-script = file("${path.module}/startup-script.sh")
  }

  service_account {
    scopes = ["cloud-platform"]
  }

  tags = ["app1-sg01-http"]

  labels = {
    name = "us-west1-public-b"
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "google_compute_instance" "public_instance_3" {
  depends_on   = [google_compute_subnetwork.public_subnet_3]
  name         = "asia-northeast3-instance-public-c"
  machine_type = "e2-medium"
  zone         = "asia-northeast3-c"

  boot_disk {
    initialize_params {
      image = "projects/debian-cloud/global/images/family/debian-11"
    }
  }

  network_interface {
    network    = google_compute_network.app1.name
    subnetwork = google_compute_subnetwork.public_subnet_3.name
    access_config {
      // Empty block to assign a public IP
    }
  }

  metadata = {
    startup-script = file("${path.module}/startup-script.sh")
  }

  service_account {
    scopes = ["cloud-platform"]
  }

  tags = ["app1-sg01-http"]

  labels = {
    name = "asia-northeast3-public-c"
  }

  lifecycle {
    create_before_destroy = true
  }
}

