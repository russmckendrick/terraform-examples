# Configure the Azure Provider
provider "azure" {
    settings_file = "${var.azure_settings_file}"
}

resource "azure_hosted_service" "terraform-service" {
    name = "russ-terraform-service"
    location = "West Europe"
    ephemeral_contents = false
    description = "Hosted service created by Terraform."
    label = "russ-tf-hs-01"
}

resource "azure_instance" "basic-server" {
    name = "russ-terraform-test"
    hosted_service_name = "${azure_hosted_service.terraform-service.name}"
    image = "OpenLogic 7.1"
    size = "Basic_A1"
    storage_service_name = "russstoreage"
    location = "West Europe"
    username = "azureuser"
    password = "z69rVZfH"

    endpoint {
        name = "SSH"
        protocol = "tcp"
        public_port = 22
        private_port = 22
    }
}

provider "digitalocean" {
    token = "${var.do_token}"
}

resource "digitalocean_droplet" "basic-server" {
    image = "centos-7-0-x64"
    name = "web-1"
    region = "nyc2"
    size = "512mb"
    ssh_keys = [ 49382 ]
}