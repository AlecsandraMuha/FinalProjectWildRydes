provider "google" {
  credentials = file("./credentials.json")
  project     = "intrepid-period-395206"
  region      = "europe-west1"
}
resource "google_container_cluster" "gke_cluster" {
  name               = "my-gke-cluster"
  location           = "europe-west1-b"
  initial_node_count = 2
}

resource "google_sql_database_instance" "my_database" {
  name             = "my-database"
  database_version = "MYSQL_8_0"
  region           = "europe-west1"

  settings {
    tier = "db-f1-micro"
    backup_configuration {
      enabled = true
    }
  }
   deletion_protection = false
}
# Define VPC Network
resource "google_compute_network" "my_network" {
  name = "my-network-project"
}

# Define Subnets
resource "google_compute_subnetwork" "frontend_subnet" {
  name          = "frontend-subnet"
  region        = "europe-west1"
  ip_cidr_range = "10.0.1.0/24"
  network       = google_compute_network.my_network.self_link
}

resource "google_compute_subnetwork" "backend_subnet" {
  name          = "backend-subnet"
  region        = "europe-west1"
  ip_cidr_range = "10.0.2.0/24"
  network       = google_compute_network.my_network.self_link
}

# Define Firewall Rules
resource "google_compute_firewall" "allow_http" {
  name    = "allow-http"
  network = google_compute_network.my_network.self_link

  allow {
    protocol = "tcp"
    ports    = ["80", "443"]
  }

  source_ranges = ["0.0.0.0/0"]
}
# Define Google Cloud Storage bucket
resource "google_storage_bucket" "my_bucket" {
  name = "website2-bucket1"
  location = "europe-west1"
}
resource "google_compute_backend_bucket" "my_backend_bucket_project" {
  name        = "my-backend-bucket-project"
  bucket_name = google_storage_bucket.my_bucket.name
}

resource "google_compute_url_map" "my_url_map" {
  name    = "my-url-map"
  default_service = google_compute_backend_bucket.my_backend_bucket_project.self_link
}
resource "google_compute_target_http_proxy" "my_target_http_proxy" {
  name    = "my-target-http-proxy"
  url_map = google_compute_url_map.my_url_map.self_link
}

resource "google_compute_global_forwarding_rule" "my_forwarding_rule" {
  name       = "my-forwarding-rule"
  target     = google_compute_target_http_proxy.my_target_http_proxy.self_link
  port_range = "80"
 
}

resource "google_sql_ssl_cert" "my_ssl_cert" {
  instance = google_sql_database_instance.my_database.name
  common_name = "my-client-cert" # Give a suitable name
  #cert = file("./server-ca.pem")
}
