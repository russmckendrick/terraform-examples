provider "azure" {
    settings_file = "${var.azure_settings_file}"
}

resource "azure_instance" "basic-server" {
    name = "russ-terraform-test"
    hosted_service_name = "${var.hosted_service}"
    image = "OpenLogic 7.1"
    size = "Basic_A1"
    storage_service_name = "${var.storage_service}"
    location = "West Europe"
    username = "${var.azure_username}"
    ssh_key_thumbprint = "${var.ssh_key_thumbprint}"

    endpoint {
        name = "SSH"
        protocol = "tcp"
        public_port = 22
        private_port = 22
    }

    endpoint {
        name = "WEB"
        protocol = "tcp"
        public_port = 80
        private_port = 80
    }

    connection {
        user = "${var.azure_username}"
        type = "ssh"
        key_file = "${var.pvt_key}"
        timeout = "2m"
        agent = false
    }

    provisioner "file" {
        source = "script.sh"
        destination = "/tmp/script.sh"
    }

    provisioner "remote-exec" {
        inline = ["bash /tmp/script.sh"]
    }

}