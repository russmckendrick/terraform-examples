provider "openstack" {
    user_name  = "${var.openstack_username}"
    password  = "${var.openstack_password}"
    tenant_name = "${var.openstack_tenant_name}"
    auth_url  = "${var.openstack_auth_url}"
}

resource "openstack_compute_secgroup_v2" "secgroup_1" {
  name = "my_secgroup"
  description = "my security group"
  rule {
    from_port = 22
    to_port = 22
    ip_protocol = "tcp"
    cidr = "0.0.0.0/0"
  }
  rule {
    from_port = 80
    to_port = 80
    ip_protocol = "tcp"
    cidr = "0.0.0.0/0"
  }
}  

resource "openstack_compute_instance_v2" "server" {
  name = "${var.server_name}"
  image_name = "${var.openstack_image_name}"
  flavor_name = "${var.openstack_flavor_name}"
  key_pair = "${var.openstack_key_pair}"
  floating_ip = "${var.openstack_floating_ip}"
  security_groups = [ "${openstack_compute_secgroup_v2.secgroup_1.name}" ]
}