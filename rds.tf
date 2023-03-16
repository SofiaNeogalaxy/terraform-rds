provider "aws" {
  region = "us-east-1"
}

provider "aws" {
  region = "us-west-2"
  alias  = "replica"
}

resource "aws_db_instance" "dbexample" {
  allocated_storage    = 10
  db_name              = "mydb"
  engine               = "postgres"
  engine_version       = "5.7"
  instance_class       = "db.t2.micro"
  username             = var.db_username
  password             = var.db_password
  parameter_group_name = "default.mysql5.7"
  skip_final_snapshot  = true
  backup_retention_period = 7
}

resource "aws_kms_key" "kmsexample" {
  description = "Encryption key for automated backups"
  provider = aws.replica
}

resource "aws_db_instance_automated_backups_replication" "examplereplication" {
  source_db_instance_arn = aws_db_instance.dbexample.arn
  kms_key_id             = aws_kms_key.kmsexample.arn
  provider = aws.replica
}