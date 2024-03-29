terraform {
  required_version = ">= 1.0.0"
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_elasticache_parameter_group" "redis3" {
  name        = "redis-custom-parameters1"
  family      = "redis6.x"  
  description = "Custom Redis parameters"

  parameter {
    name  = "timeout"
    value = "20"
  }
}

resource "aws_security_group" "rds_sqlserver_security_group8" {
  name        = "rds_sqlserver_security_group8"
  description = "Security group for RDS SQL Server instance"

  ingress {
    from_port   = 1433 
    to_port     = 1433
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "rds_sqlserver_security_group8"
  }

  lifecycle {
    create_before_destroy = true
  }

}

#resource "aws_db_instance" "fourSixInstance" {
#  allocated_storage    = 20
#  storage_type         = "gp2"
#  engine               = "sqlserver-ex"
#  engine_version       = "15.00.4153.1.v1"
#  instance_class       = "db.t3.micro"
#  identifier           = "foursix"
#  username             = "sa"
#  license_model        = "license-included"
#  password             = "SenhaDoBanco(123)"
#  publicly_accessible  = true
#  vpc_security_group_ids = [aws_security_group.rds_sqlserver_security_group1.id]
#}

resource "aws_elasticache_cluster" "example_redis" {
  cluster_id           = "example-redis-cluster"
  engine               = "redis"
  node_type            = "cache.t2.micro"
  num_cache_nodes      = 1
  engine_version       = "6.x"
  parameter_group_name = aws_elasticache_parameter_group.redis3.name
  port                 = 6379
  security_group_ids   = [aws_security_group.rds_sqlserver_security_group8.id]
}