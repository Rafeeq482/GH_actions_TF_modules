provider "aws" {
  region = "ap-south-1"
}

module "ec2_instance" {
  source             = "./modules/ec2"
  ami                = "ami-0e35ddab05955cf57" 
  instance_type      = "t3.micro"
  key_name           = "SNS"
  subnet_id          = "subnet-06cdf6a7520a97aee"
  security_group_ids = ["sg-0f06a82ac5865d1b8"]
  tags = {
    Name = "rds-mysql"
  }
}

# module "s3_bucket" {
#   source            = "./modules/s3_bucket"
#   bucket_name       = "bombay-saphire-123"
#   enable_versioning = true
#   enable_encryption = true

#   tags = {
#     Environment = "dev"
#     Project     = "s3-module-demo"
#   }
# }


module "vpc" {
  source             = "./modules/vpc"
  vpc_cidr           = "10.1.0.0/16"
  public_subnets     = ["10.1.1.0/24", "10.1.2.0/24"]
  private_subnets    = ["10.1.101.0/24", "10.1.102.0/24"]
  availability_zones = ["ap-south-1a", "ap-south-1b"]
}

# module "db_subnet_group" {
#   source      = "./modules/db_subnet_group"
#   name        = "my-db-subnet-group"
#   description = "Subnet group for RDS"

#   subnet_ids = [
#   "subnet-0be48a5104a8719db", "subnet-0c2ef04047ae31018"]



#   tags = {
#     Name        = "my-db-subnet-group"
#     Environment = "production"
#     Team        = "devops"
#     Project     = "rds-mysql"
#   }
# }

# module "rds" {
#   source = "./modules/rds"

#   db_subnet_group_name = module.db_subnet_group.db_subnet_group_name

#   identifier             = "mydb-instance"
#   allocated_storage      = 20
#   engine                 = "mysql"
#   engine_version         = "8.0"
#   instance_class         = "db.t3.micro"
#   db_name                = "mydatabase"
#   username               = "admin"
#   password               = "krishna123" # sensitive input
#   parameter_group_name   = "default.mysql8.0"
#   publicly_accessible    = false
#   vpc_security_group_ids = ["sg-01d6725cda2d2e40d"]

#   multi_az     = false
#   storage_type = "gp2"
# }

