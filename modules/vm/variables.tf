variable "prefix" {
  type        = string
  description = "Name Function"
}

variable "subnet-id" {
  type        = string
  description = "Subnet ID"
}

variable "location" {
  type        = string
  default     = "West Europe"
  description = "Location"
}

variable "user" {
  type        = string
  default     = "admin"
  description = "Admin user"
}

variable "password" {
  type        = string
  default     = "Password1234!"
  description = "Admin password"
}