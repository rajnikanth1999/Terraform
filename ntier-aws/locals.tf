locals {
  app1 = cidrsubnet(var.vpc_cidr,8,0)
}
locals {
  app2 = cidrsubnet(var.vpc_cidr,8,1)
}