module "main" {
  for_each = var.tools
  source   = "./module"
}