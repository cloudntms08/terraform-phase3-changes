module "data" {
  source         = "./modules/data-mod"
  key_vault_name = "kv-ntms-workshop"
  key_vault_rg   = "kv-ntms-workshop"
  secret_name    = "vm-admin-password"
}

module "network" {
  source             = "./modules/network-mod"
  rg_name            = local.rg_name
  location           = var.location
  vnet_name          = local.vnet_name
  snet_name          = local.snet_name
  vnet_address_space = var.vnet_address_space
  subnet_prefix      = var.subnet_prefix
  common_tags        = local.common_tags
}

module "nsg" {
  source      = "./modules/nsg-mod"
  nsg_name    = local.nsg_name
  location    = var.location
  rg_name     = module.network.rg_name
  subnet_id   = module.network.subnet_id
  common_tags = local.common_tags
}

module "compute" {
  source         = "./modules/compute-mod"
  pip_name       = local.pip_name
  nic_name       = local.nic_name
  vm_name        = local.vm_name
  osdisk_name    = local.osdisk_name
  location       = var.location
  rg_name        = module.network.rg_name
  subnet_id      = module.network.subnet_id
  vm_size        = var.vm_size
  admin_username = var.admin_username
  admin_password = module.data.vm_password
  common_tags    = local.common_tags

  depends_on = [module.nsg]
}
