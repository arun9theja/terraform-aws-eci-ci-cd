variable "environment" {
  description = "The name of your environment (development, staging or production)."
}

variable "product_domain" {
  default = "eci"
  description = "Your product domain, default to be \"eci\"."
}

variable "service_name" {
  description = "The name of your service, which is used to name your Fargate service, for example, ecibpms."
}
