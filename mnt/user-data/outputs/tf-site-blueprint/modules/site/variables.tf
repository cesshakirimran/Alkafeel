variable "site_code" {
  description = "Short site identifier, e.g. hsc-bdr."
  type        = string

  validation {
    condition     = can(regex("^[a-z]{2,3}-[a-z]{3}$", var.site_code))
    error_message = "Site code must look like hsc-bdr or dc-zwd."
  }
}

variable "location" {
  type = string
}

variable "site_type" {
  type = string

  validation {
    condition     = contains(["distribution-center", "home-shop-center", "store"], var.site_type)
    error_message = "Unknown site type."
  }
}

variable "address_space" {
  type = string
}

variable "ot_subnet" {
  type = string
}

variable "idmz_subnet" {
  type = string
}

variable "tags" {
  type    = map(string)
  default = {}
}
