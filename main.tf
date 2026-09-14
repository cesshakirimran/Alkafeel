# One module call per site. for_each is what turns a one-off deployment into
# a blueprint: the module is written once, instantiated N times.
module "site" {
  source   = "./mnt/user-data/outputs/tf-site-blueprint/modules/site"
  for_each = var.sites

  site_code     = each.key
  location      = each.value.location
  site_type     = each.value.site_type
  address_space = each.value.address_space
  ot_subnet     = each.value.ot_subnet
  idmz_subnet   = each.value.idmz_subnet
  tags          = var.common_tags
}
