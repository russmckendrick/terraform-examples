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
    ssh_key_thumbprint = "${var.ssh_key_thumbprint}"

    endpoint {
        name = "SSH"
        protocol = "tcp"
        public_port = 22
        private_port = 22
    }

    connection {
        user = "azureuser"
        type = "ssh"
        key_file = "${var.pvt_key}"
        timeout = "2m"
        agent = false
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