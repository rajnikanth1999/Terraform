variable "region" {
    type = string
    description = "For region"
    default = "ap-south-1"
}
variable "vpc_cidr" {
    type = string
    description = "For VPC Cidr range"
    default = "192.168.0.0/16"
}
variable "vpc_name_tag" {
    type = string
    description = "For vpc name tags"
    default = "Ntier"
}
variable "subnet_cidr" {
    type = list(string)
    description = "For cidr subnet pass list of string"
    default = [ "192.168.0.0/24", "192.168.1.0/24", "192.168.2.0/24", "192.168.3.0/24", "192.168.4.0/24", "192.168.5.0/24" ]
}
variable "subnet_tags" {
    type = list(string)
    description = "For subnet name tags"
    default = [ "web1" , "web2" , "app1", "app2" , "db1" , "db2"]
}
variable "subnet_regions" {
    type = list(string)
    description = "For subnet regions"
    default = [ "ap-south-1a" , "ap-south-1b", "ap-south-1a" , "ap-south-1b", "ap-south-1a", "ap-south-1b"]
}
variable "tag" {
    type = string
    description = "For common tags"
    default = "N-Tier"
}
# variable "route_name" {
#     type = list(string)
#     description = "For public route name"
#     default = ["public route", "private route"]
# }