output "vpc_id" {
  description = "ID of the VPC"
  value       = aws_vpc.main.id
}

output "vpc_details" {
  description = "VPC Details"
  value = {
    id         = aws_vpc.main.id
    cidr_block = aws_vpc.main.cidr_block
    region     = "eu-central-1"
  }
}

output "instance_details" {
  description = "EC2 Instance Details"
  value = {
    id         = aws_instance.web.id
    public_ip  = aws_instance.web.public_ip
    private_ip = aws_instance.web.private_ip
    ami        = aws_instance.web.ami
    type       = aws_instance.web.instance_type
  }
}

output "security_group_details" {
  description = "Security Group Details"
  value = {
    id   = aws_security_group.web.id
    name = aws_security_group.web.name
    vpc_id = aws_security_group.web.vpc_id
  }
}

output "aws_cli_commands" {
  description = "AWS CLI commands to check resources"
  value = {
    vpc_command = "aws ec2 describe-vpcs --vpc-ids ${aws_vpc.main.id} --region eu-central-1"
    instance_command = "aws ec2 describe-instances --instance-ids ${aws_instance.web.id} --region eu-central-1"
    sg_command = "aws ec2 describe-security-groups --group-ids ${aws_security_group.web.id} --region eu-central-1"
  }
}