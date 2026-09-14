# One module call per site. for_each is what turns a one-off deployment into
# a blueprint: the module is written once, instantiated N times.
module "site" {
  source   = "./modules/site"
  for_each = var.sites

  site_code     = each.key
  location      = each.value.location
  site_type     = each.value.site_type
  address_space = each.value.address_space
  ot_subnet     = each.value.ot_subnet
  idmz_subnet   = each.value.idmz_subnet
  tags          = var.common_tags
}

output "sites" {
  description = "What got built, per site."
  value = {
    for code, site in module.site : code => {
      resource_group = site.resource_group_name
      key_vault      = site.key_vault_name
      ot_subnet_id   = site.ot_subnet_id
    }
  }
}
