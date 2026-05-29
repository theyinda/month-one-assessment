# TechCorp AWS Infrastructure

## Prerequisites
- AWS CLI configured with valid credentials
- Terraform v1.3+
- An AWS Key Pair

## Deployment Steps
1. Clone this repository
2. cd terraform-assessment
3. cp terraform.tfvars.example terraform.tfvars
4. Fill in your values in terraform.tfvars
5. Run: terraform init
6. Run: terraform plan
7. Run: terraform apply

## Outputs
- VPC ID
- Load Balancer DNS name
- Bastion public IP

## Cleanup
To destroy all resources:
terraform destroy
