variable "vpc_cidr" {}

variable "public_subnets" {
  type = list(string)

}
variable "private_subnets" {
  
}
variable "instance_type" {

}
variable "azs" {
  description = "List of Availability Zones"
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b", "us-east-1c"]
}