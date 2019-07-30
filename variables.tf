
variable "app_ip_address" {
  type = "list"
}


variable "app_private_ssh_key" {

}

variable "bastion_ip_address" {

}


variable "bastion_private_ssh_key" {

}


variable "infra_ip_address" {
  type = "list"
}


variable "infra_private_ssh_key" {

}

variable "master_ip_address" {
  type = "list"
}


variable "master_private_ssh_key" {

}

variable "storage_ip_address" {
  type = "list"
}


variable "storage_private_ssh_key" {

}

variable "rhn_username"{

}

variable "rhn_password"{

}

variable "rhn_poolid"{

}

variable "ssh_username" {
    default = "root"
}

variable "bastion" {type = "map"}
variable "master"  {type = "map"}
variable "infra"   {type = "map"}
variable "worker"  {type = "map"}
variable "storage" {type = "map"}
variable "dependencies" {
    type = "list"
    default = []
}
