# terraform
VPC with EC2


This repository contains Terraform code that provisions AWS infrastructure according to the following requirements:

## Problem Statement

Provision a Virtual Private Cloud (VPC) with both public and private subnets distributed across multiple availability zones. Then, deploy an EC2 instance in one of the public subnets that will later host a hypothetical NGINX server running on port 80. The instance must be reachable over HTTP via its public IP.

## Requirements

- Create a VPC with CIDR block `10.0.0.0/16`
- Create **three public subnets** across **different availability zones**
- Create **three private subnets** across **different availability zones**
- Instances in public subnets must have internet access via an Internet Gateway
- Instances in private subnets must not have direct internet access
- Deploy an **EC2 instance** in one of the public subnets
- Allow inbound HTTP (port 80) access to the instance


## File Structure

```text
.
├── provider.tf             # AWS provider configuration
├── variables.tf            # Input variables
├── vpc.tf                  # VPC and Internet Gateway
├── subnets.tf              # Public and private subnets
├── routes.tf               # Route tables and associations
├── security_groups.tf      # Security group for HTTP access
├── ec2.tf                  # EC2 instance configuration
├── outputs.tf              # Output values
├── main.tf                 # Entry point
└── .gitignore              # Terraform state ignore rules