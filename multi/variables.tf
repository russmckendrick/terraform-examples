variable "azure_settings_file" {
	description = "Path to your Azure Settings file"
    default = "settings.publishsettings"
}

variable "do_token" {
	description = "Your Digital Ocean API token"
    default = ""
}

variable "do_ssh_private_key_file" {
	description = "Path to your Private Key file for accessing Digtial Ocean"
    default = "~/.ssh/id_rsa"
}

variable "azure_password" {
	description = "Password for the Azure Virtual Machine"
    default = "z69rVZfH"
}

variable "azure_store" {
	description = "Name of the Azure Storeage Pool"
    default = "russstoreage"
}

variable "server_name" {
	description = "What do you want to tag / name your servers as?"
    default = "MyAwesomeTerraformServer"
}