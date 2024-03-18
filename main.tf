terraform {
  required_version = ">= 0.12"
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_security_group" "rds_sqlserver_security_group" {
  name        = "rds_sqlserver_security_group"
  description = "Security group for RDS SQL Server instance"

  ingress {
    from_port   = 1433 
    to_port     = 1433
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "rds_sqlserver_security_group"
  }
}

resource "aws_db_instance" "fourSixInstance" {
  allocated_storage    = 20
  storage_type         = "gp2"
  engine               = "sqlserver-ex"
  engine_version       = "15.00.4153.1.v1"
  instance_class       = "db.t3.micro"
  identifier           = "foursix"
  username             = "sa"
  license_model        = "license-included"
  password             = "SenhaDoBanco(123)"
  publicly_accessible  = true
  vpc_security_group_ids = [aws_security_group.rds_sqlserver_security_group.id]
}

