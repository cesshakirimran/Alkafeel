sites = {
  hsc-bdr = {
    location      = "westeurope"
    site_type     = "home-shop-center"
    address_space = "10.40.0.0/16"
    ot_subnet     = "10.40.10.0/24"
    idmz_subnet   = "10.40.20.0/24"
  }

  dc-zwd = {
    location      = "westeurope"
    site_type     = "distribution-center"
    address_space = "10.41.0.0/16"
    ot_subnet     = "10.41.10.0/24"
    idmz_subnet   = "10.41.20.0/24"
  }
}
