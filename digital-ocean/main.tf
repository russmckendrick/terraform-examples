provider "digitalocean" {
    token = "${var.do_token}"
}

resource "digitalocean_droplet" "basic-server" {
    image = "centos-7-0-x64"
    name = "${var.server_name}"
    region = "nyc2"
    size = "512mb"
    ssh_keys = [
        "${var.ssh_fingerprint}"
    ]

    connection {
        user = "root"
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

