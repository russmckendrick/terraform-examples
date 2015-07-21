provider "aws" {
    access_key = "${var.aws_access_key}"
    secret_key = "${var.aws_secret_key}"
    region = "us-east-1"
}

resource "aws_instance" "web" {

    ami = "ami-96a818fe"
    instance_type = "t2.micro"
    subnet_id = "${var.aws_subnet_id }"
    security_groups = [ "${aws_security_group.web.id}", "${aws_security_group.ssh.id}", "${aws_security_group.all_outgoing.id}"]
    key_name = "${var.aws_key_name}"

    connection {
        user = "centos"
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

resource "aws_security_group" "web" {
  name = "web"
  description = "Allow all web traffic"
  vpc_id = "${var.aws_vpc}"

  ingress {
      from_port = 80
      to_port = 80
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name = "web"
  }
}

resource "aws_security_group" "ssh" {
  name = "ssh"
  description = "Allow all ssh traffic"
  vpc_id = "${var.aws_vpc}"

  ingress {
      from_port = 22
      to_port = 22
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name = "ssh"
  }
}

resource "aws_security_group" "all_outgoing" {
  name = "all_outgoing"
  description = "Allow all outgoing traffic"
  vpc_id = "${var.aws_vpc}"

  egress {
      from_port = 0
      to_port = 0
      protocol = "-1"
      cidr_blocks = ["0.0.0.0/0"]
  }

    tags {
    Name = "all_outgoing"
  }

}