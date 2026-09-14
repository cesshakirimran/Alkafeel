output "sites" {
  description = "What got built, per site."
  value = {
    for code, site in module.site : code => {
      resource_group = site.resource_group_name
      key_vault      = site.key_vault_name
      ot_subnet_id   = site.ot_subnet_id
      idmz_subnet_id = site.idmz_subnet_id
    }
  }
}
