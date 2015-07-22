variable "pvt_key" {
	description = "Path to your private key"
	default = "~/.ssh/id_rsa"
}

variable "do_token" {
	description = "Your Digital Ocean API token"
	default = ""
}

variable "do_ssh_fingerprint" {
	description = "The fingerprint of your Digital Ocean SSH Key"
	default = ""
}

variable "server_name" {
	description = "What do you want to tag / name your servers as?"
    default = "server"
}

variable "azure_settings_file" {
    default = "settings.publishsettings"
}

variable "azure_ssh_key_thumbprint" {
	description = "The fingerprint of your Azure SSH Key"
	default = ""
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

variable "aws_access_key" {
	description = "Your AWS Access Key"
	default = ""
}

variable "aws_secret_key" {
	description = "Your AWS Secret Key"
	default = ""
}

variable "aws_subnet_id" {
	description = "Which AWS Subnet to launch instance in?"
	default = ""
}

variable "aws_vpc" {
	description = "Which AWS VPC to launch instance in?"
	default = ""
}

variable "aws_key_name" {
	description = "Which Key to launch your instance with?"
	default = ""
}

variable "aws_hosted_zone_id" {
	description = "Which Zone file to add A Record to?"
	default = ""
}

variable "fqdn" {
	description = "What sub-domain to add?"
	default = ""
}