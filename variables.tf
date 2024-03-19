variable "prefix" {
  type        = string
  description = "Project Name, prefix of the resources name ex. 'prefix'-rg for the resource group"
}

variable "location" {
  type        = string
  default     = "East US"
  description = "Location"
}

variable "user" {
  type        = string
  default     = "admin"
  description = "Vm Username"
}

variable "password" {
  type        = string
  default     = "Password1234!"
  description = "Vm Password, the user and the password will be used for the ssh connection"
}