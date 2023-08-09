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

resource "google_container_node_pool" "primary_pool" {
  name       = "default-pool-gke"
  cluster    = google_container_cluster.gke_cluster.name
  location   = google_container_cluster.gke_cluster.location
  node_count = 3

  autoscaling {
    min_node_count = 2
    max_node_count = 5
  }


  node_config {
    machine_type = "n1-standard-1"
    disk_size_gb = 100
    #location     = "europe-west1-b"
  }
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
