variable "pvt_key" {
	description = "Path to your private key"
	default = "~/.ssh/id_rsa"
}

variable "server_name" {
	description = "What do you want to tag / name your servers as?"
    default = "server"
}

variable "openstack_username" {
    default = ""
}

variable "openstack_password" {
    default = ""
}

variable "openstack_tenant_name" {
    default = ""
}

variable "openstack_auth_url" {
    default = ""
}

variable "openstack_image_name" {
    default = ""
}

variable "openstack_flavor_name" {
    default = ""
}

variable "openstack_key_pair" {
    default = ""
}

variable "openstack_floating_ip" {
    default = ""
}