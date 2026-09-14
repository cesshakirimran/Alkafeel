variable "sites" {
  description = "Every site AH runs, keyed by short site code. Adding a site = adding an entry here."

  type = map(object({
    location      = string
    site_type     = string
    address_space = string
    ot_subnet     = string
    idmz_subnet   = string
  }))
}

variable "common_tags" {
  description = "Tags applied to everything, so cost and ownership are attributable."
  type        = map(string)
  default = {
    managed_by = "terraform"
    programme  = "ot-secure-ring"
  }
}
