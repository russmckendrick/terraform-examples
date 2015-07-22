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

variable "pvt_key" {
	description = "Path to your private key"
	default = "~/.ssh/id_rsa"
}

variable "server_name" {
	description = "What do you want to tag / name your servers as?"
    default = "server"
}