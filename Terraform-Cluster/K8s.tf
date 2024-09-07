# Provider configuration for Google Cloud Platform:
provider "google" {
  project = "kubernetes-assignment-428919"
  region = "us-central1"
}

# Resource configuration for Google Cloud Cluster:
resource "google_container_cluster" "k8s_cluster" {
  name = "k8s-assignment"
  location = "us-central1-c"
  initial_node_count = 1

  node_config {
    machine_type = "e2-medium"
    disk_size_gb = 10
    disk_type = "pd-standard"
    image_type = "COS_CONTAINERD"
  }
}

# Resource configuration for Persistent Volume Disk:
resource "google_compute_disk" "persistent_disk" {
  name = "k8s-volume"
  type = "pd-standard"
  zone = "us-central1-c" 
  size = 10
}