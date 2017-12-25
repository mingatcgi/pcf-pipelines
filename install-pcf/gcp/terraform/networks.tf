resource "google_compute_network" "pcf-virt-net" {
  name = "${var.prefix}-virt-net"
  auto_create_subnetworks = "false"
}

// Ops Manager & Jumpbox
resource "google_compute_subnetwork" "subnet-ops-manager" {
  name          = "${var.prefix}-subnet-infrastructure-${var.gcp_region}"
  //ip_cidr_range = "192.168.101.0/26"
  ip_cidr_range = "${var.opsman_subnet_cidr}"
  network       = "${google_compute_network.pcf-virt-net.self_link}"
}

// ERT
resource "google_compute_subnetwork" "subnet-ert" {
  name          = "${var.prefix}-subnet-ert-${var.gcp_region}"
  //ip_cidr_range = "192.168.16.0/22"
  ip_cidr_range = "${var.ert_subnet_cidr}"
  network       = "${google_compute_network.pcf-virt-net.self_link}"
}

// Services Tile
resource "google_compute_subnetwork" "subnet-services-1" {
  name          = "${var.prefix}-subnet-services-1-${var.gcp_region}"
  //ip_cidr_range = "192.168.20.0/22"
  ip_cidr_range = "${var.service_subnet_cidr}"
  network       = "${google_compute_network.pcf-virt-net.self_link}"
}

// Dynamic Services Tile
resource "google_compute_subnetwork" "subnet-dynamic-services-1" {
  name          = "${var.prefix}-subnet-dynamic-services-1-${var.gcp_region}"
  //ip_cidr_range = "192.168.24.0/22"
  ip_cidr_range = "${var.dynamic_service_subnet_cidr}"
  network       = "${google_compute_network.pcf-virt-net.self_link}"
}
