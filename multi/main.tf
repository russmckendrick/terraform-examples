provider "azure" {
    settings_file = "${var.azure_settings_file}"
}

resource "azure_instance" "basic-server" {
    name = "${var.server_name}"
    hosted_service_name = "${azure_hosted_service.terraform-service.name}"
    image = "OpenLogic 7.1"
    size = "Basic_A1"
    storage_service_name = "${var.azure_store}"
    location = "West Europe"
    username = "azureuser"
    password = "${var.azure_password}"
    endpoint {
        name = "SSH"
        protocol = "tcp"
        public_port = 22
        private_port = 22
    }
    provisioner "remote-exec" {
    inline = [
        "sudo yum -y install epel-release",
        "sudo yum -y update",
        "sudo yum -y install nginx",
        "sudo systemctl start nginx"
    ]
    }
}

provider "digitalocean" {
    token = "${var.do_token}"
}

resource "digitalocean_droplet" "basic-server" {
    image = "centos-7-0-x64"
    name = "${var.server_name}"
    region = "nyc2"
    size = "512mb"
    ssh_keys = [ 49382, 985457 ]
    connection {
        key_file = "${var.do_ssh_private_key_file}"
    }
    provisioner "remote-exec" {
    inline = [
        "sudo yum -y install epel-release",
        "sudo yum -y update",
        "sudo yum -y install nginx",
        "sudo systemctl start nginx"
    ]
    }
}

