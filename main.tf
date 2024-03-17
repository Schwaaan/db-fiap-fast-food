terraform {
  required_version = ">= 0.12"
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_db_instance" "fourSixInstance" {
  allocated_storage    = 20
  storage_type         = "gp2"
  engine               = "sqlserver-se"
  engine_version       = "16.00.4105.2.v1"
  instance_class       = "db.t3.micro"
  identifier           = "foursix"
  username             = "sa"
  password             = "SenhaDoBanco(123)"
}
