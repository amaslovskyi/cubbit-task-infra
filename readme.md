# Terraform Infrastructure Setup

This repository contains Terraform configurations to set up AWS infrastructure using a modular approach. The setup includes EC2 instances, VPC, and security groups.

## Repository Structure

.
├── modules/
│   ├── ec2/
│   ├── net/
│   └── sec/
├── prod/
├── staging/
└── README.md

## Prerequisites

1. [Terraform](https://www.terraform.io/downloads.html) installed (version 0.12.0 or later)
2. AWS CLI configured with appropriate credentials
3. A Terraform Cloud account (for remote backend)

## Setup Instructions

### 1. Clone the Repository

```bash
git clone <repository-url>
cd <repository-name>
```

### 2. Configure Terraform Cloud (Optional)

If you're using Terraform Cloud as your backend:

1. Create an organization in Terraform Cloud if you haven't already.
2. Create a new workspace named `staging-cubbit-task-infra/prod-cubbit-task-infra` (or update the name in the configuration).
3. Configure your Terraform Cloud API token:

```bash
terraform login
```

### 4. Set Up Variables in tfcloud (Optional)

- `region`
- `AWS_ACCESS_KEY_I`
- `AWS_SECRET_ACCESS_KEY`
- `public_key`

### 4. Initialize Terraform

Navigate to either the prod/ or staging/ directory, depending on which environment you want to set up:

```bash
cd staging  # or cd prod
terraform init
```

## Modules

The `modules/` directory contains reusable Terraform modules:

`ec2/:` EC2 instance configurations
`net/:` Networking configurations (VPC, subnets, etc.)
`sec/:` Security group configurations

### Notes

After apply infrastructure to cloud retrieve `k8s config` and `node ip` for further integration with git app repo:

```bash
cat /etc/rancher/k3s/k3s.yaml
cat "/etc/rancher/k3s/k3s.yaml" | base64
```
