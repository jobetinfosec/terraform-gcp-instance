// Configure the Google Cloud provider
provider "google" {
 credentials = file("<CREDENTIALS_FILE>.json")
 project     = "<PROJECT_ID>"
 region      = "<REGION>"
}

// Terraform plugin for creating random ids
resource "random_id" "instance_id" {
 byte_length = 8
}

// A single Compute Engine instance
resource "google_compute_instance" "default" {
 name         = "gcp-vm-${random_id.instance_id.hex}"
 machine_type = "f1-micro"
 zone         = "<ZONE>"

 boot_disk {
   initialize_params {
     image = "debian-cloud/debian-10"
   }
 }

 network_interface {
   network = "default"

   access_config {
     // Include this section to give the VM an external ip address
   }
 }

metadata = {
   ssh-keys = "<USER_NAME>:${file("~/.ssh/<KEY_NAME>.pub")}"
 }

}

// A variable for extracting the external IP address of the instance
 output "ip" {
 value = google_compute_instance.default.network_interface.0.access_config.0.nat_ip
}
