variable "do_token" {
	description = "Your Digital Ocean API token"
	default = ""
}

variable "pub_key" {
	description = "Path to your public key"
	default = "~/.ssh/id_rsa.pub"
}

variable "pvt_key" {
	description = "Path to your private key"
	default = "~/.ssh/id_rsa"
}

variable "ssh_fingerprint" {
	description = "The fingerprint of your SSH Key"
	default = ""
}

variable "server_name" {
	description = "What do you want to tag / name your servers as?"
    default = "MyAwesomeTerraformServer"
}