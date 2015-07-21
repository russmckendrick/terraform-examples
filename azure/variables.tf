variable "azure_settings_file" {
    default = "settings.publishsettings"
}

variable "ssh_key_thumbprint" {
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