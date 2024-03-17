provider "aws" {
  region = "us-east-1"
}

resource "aws_db_instance" "FourSix" {
  allocated_storage    = 20
  storage_type         = "gp2"
  engine               = "sqlserver-se"
  engine_version       = "15.00.2070.41.v1"
  instance_class       = "db.t2.micro"
  name                 = "FourSix"
  username             = "sa"
  password             = "SenhaDoBanco(123)"
}