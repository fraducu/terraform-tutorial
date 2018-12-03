variable "key_name" {
  default = "radu-personal-aws"
}

variable "pvt_key" {
  default = "/Users/Radu/.ssh/radu-personal-aws.pem"
}

variable "us-east-zones" {
  default = ["us-east-1a", "us-east-1b"]
}

variable "sg-id" {
  default = "sg-347f3174"
}

variable "number_instances" {
  default = "1"
}

variable "region" {
  default = "us-east-1"
}
