variable "azure_settings_file" {
    default = "settings.publishsettings"
}

variable "ssh_key_thumbprint" {
	default = ""
}

variable "pvt_key" {
	description = "Path to your private key"
	default = "~/.ssh/id_rsa"
}

variable "hosted_service" {
	description = "Which hosted service would you like to launch your VM in?"
	default = ""
}

variable "storage_service" {
	description = "Which storeage would you like to store your VM in?"
	default = ""
}

variable "azure_username" {
	description = "What username would you like to create on your VM?"
	default = "azureuser"
}

