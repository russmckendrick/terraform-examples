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

    provisioner "file" {
        source = "script.sh"
        destination = "/tmp/script.sh"
    }

    provisioner "remote-exec" {
        inline = ["bash /tmp/script.sh"]
    }
}

