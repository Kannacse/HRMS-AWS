# HRMS-AWS

Production-level Human Resource Management System (HRMS) deployed on Amazon Web Services (AWS). This is a comprehensive, scalable solution for managing HR operations with infrastructure-as-code (IaC) approach.

##  Table of Contents

- [Overview](#overview)
- [Project Structure](#project-structure)
- [Technology Stack](#technology-stack)
- [Prerequisites](#prerequisites)
- [Getting Started](#getting-started)
  - [Local Development](#local-development)
  - [Infrastructure Setup](#infrastructure-setup)
  - [Database Setup](#database-setup)
- [Deployment](#deployment)
- [Architecture](#architecture)
- [Features](#features)
- [Contributing](#contributing)
- [License](#license)

##  Overview

HRMS-AWS is a full-stack Human Resource Management System designed for enterprise-level deployment on AWS. It provides comprehensive HR functionalities including employee management, attendance tracking, leave management, expense management, and more.

### Key Highlights
-  **Scalable Infrastructure** - Auto-scaling groups and load balancing
-  **Secure** - Multi-layer security with WAF, Security Groups, and IAM roles
-  **Cloud-Native** - Built with Terraform and containerized components
-  **High Availability** - RDS Multi-AZ, Auto-scaling, Health checks
-  **Monitoring** - CloudWatch integration and alerting

## 📁 Project Structure

```
HRMS-AWS/
├── Backend/                          # Node.js backend application
│   ├── hrms_feb_node/               # Main backend service
│   └── backend.zip                  # Compressed backup
├── frontend/                         # Flutter mobile application
│   └── hrms_feb_flutter/            # Mobile app source
├── Infra/                           # Terraform Infrastructure-as-Code
│   ├── modules/                     # Reusable Terraform modules
│   │   ├── alb/                     # Application Load Balancer
│   │   ├── asg/                     # Auto Scaling Group
│   │   ├── iam/                     # Identity & Access Management
│   │   ├── monitoring/              # CloudWatch Monitoring
│   │   ├── rds/                     # Relational Database Service
│   │   ├── route53/                 # DNS Management
│   │   ├── s3/                      # Simple Storage Service
│   │   ├── security/                # Security Groups & ACLs
│   │   ├── vpc/                     # Virtual Private Cloud
│   │   └── waf/                     # Web Application Firewall
│   ├── main.tf                      # Main Terraform configuration
│   ├── provider.tf                  # AWS Provider configuration
│   ├── variables.tf                 # Variable definitions
│   ├── outputs.tf                   # Output definitions
│   ├── locals.tf                    # Local variable definitions
│   ├── backend.tf                   # Terraform backend configuration
│   ├── versions.tf                  # Terraform version requirements
│   └── package.json                 # Node.js dependencies (if any)
├── database/                        # Database schema and dumps
│   └── Dump20260218/               # Database backup files
│       └── hrms_02_02_2026_*.sql   # Individual table dumps
├── locals.tf                        # Root local variables
├── versions.tf                      # Root version requirements
├── terraform.tfvars                 # Terraform variables (DO NOT commit secrets)
├── manage.sh                        # Utility script for management
└── README.md                        # This file
```

##  Technology Stack

### Backend
- **Runtime**: Node.js
- **Framework**: Express.js (typical for Node.js HRMS apps)
- **Database**: MySQL/MariaDB
- **ORM**: Sequelize or TypeORM
- **Authentication**: JWT

### Frontend
- **Framework**: Flutter
- **Language**: Dart
- **Platform**: iOS & Android cross-platform mobile app

### Infrastructure
- **IaC Tool**: Terraform
- **Cloud Provider**: Amazon Web Services (AWS)
- **Compute**: EC2 instances with Auto Scaling
- **Load Balancing**: Application Load Balancer (ALB)
- **Database**: AWS RDS (Multi-AZ)
- **Storage**: Amazon S3
- **Security**: WAF, Security Groups, IAM roles
- **Monitoring**: CloudWatch

##  Prerequisites

### Required
- AWS Account with appropriate permissions
- Terraform >= v1.0
- AWS CLI v2
- Git

### For Local Development
- **Backend**: Node.js v16+ and npm/yarn
- **Frontend**: Flutter SDK, Android Studio/Xcode
- **Database**: MySQL 8.0+ or MariaDB

### AWS Credentials
Configure your AWS credentials using one of these methods:
```bash
# Method 1: AWS CLI configuration
aws configure

# Method 2: Environment variables
export AWS_ACCESS_KEY_ID="your_access_key"
export AWS_SECRET_ACCESS_KEY="your_secret_key"
export AWS_DEFAULT_REGION="ap-south-1"
```

##  Getting Started

### Local Development

#### Backend Setup
```bash
cd Backend/hrms_feb_node
npm install
npm run dev
```

#### Frontend Setup
```bash
cd frontend/hrms_feb_flutter
flutter pub get
flutter run
```

### Infrastructure Setup

#### Initialize Terraform
```bash
cd Infra
terraform init
```

#### Plan Infrastructure Deployment
```bash
terraform plan -out=tfplan
```

**Review the plan carefully** before applying to ensure only desired resources will be created.

#### Apply Infrastructure
```bash
terraform apply tfplan
```

This will provision:
- VPC with public/private subnets
- Application Load Balancer
- Auto Scaling Group with EC2 instances
- RDS database cluster
- S3 buckets for storage
- Security groups and network ACLs
- IAM roles and policies
- WAF rules
- CloudWatch monitoring

### Database Setup

#### Restore from Backup
```bash
# Connect to RDS instance
mysql -h <rds-endpoint> -u <username> -p <database_name>

# Import SQL dumps
mysql -h <rds-endpoint> -u <username> -p <database_name> < database/Dump20260218/hrms_02_02_2026_*.sql
```

#### Run Migrations (if applicable)
```bash
cd Backend/hrms_feb_node
npm run migrate
```

##  Deployment

### Automated Deployment via Terraform
All infrastructure provisioning is automated through Terraform:

```bash
# From Infra directory
cd Infra
terraform apply
```

### Manual Update of Existing Stack
```bash
# Plan changes first
terraform plan

# Apply specific updates
terraform apply
```

### Destroying Resources (Caution!)
```bash
# This will delete ALL provisioned AWS resources
cd Infra
terraform destroy
```

 **WARNING**: This operation is irreversible and will delete all resources including databases.

##  Architecture

### High-Level Architecture

```
Internet
   ↓
WAF (Security)
   ↓
ALB (Load Balancer)
   ↓
[ASG] EC2 Instances (Auto Scaling)
   ├── Backend Service (Node.js)
   ├── API Endpoints
   └── Business Logic
   ↓
RDS (Multi-AZ Database)
   ├── MySQL/MariaDB
   └── Automated Backups
   ↓
S3 (File Storage)
   └── Attachments & Assets
```

### Security Layers
1. **WAF Layer** - Protects against DDoS and SQL injection
2. **Security Groups** - Network-level access control
3. **IAM Roles** - Application-level permissions
4. **Encryption** - At transit (TLS) and at rest (RDS encryption)

## Features

### HR Management
- Employee Directory
- Attendance Tracking
- Leave Management
- Probation Management
- Performance Reviews
- Employee Feedback

### Finance
- Expense Management
- Travel Expense Processing
- CTC Management
- Income Tax Computation
- Advance & Settlement

### Assets
- Asset Tracking
- Asset Categories
- Asset History
- Asset Attachments

### Additional
- Client Rate Management
- Project Assignment
- Educational Records
- BGV Verification
- Notifications
- Gamification (Fun Points & Games)

##  Management

Use the provided management script for common operations:

```bash
./manage.sh
```

##  Configuration

### Terraform Variables
Edit `terraform.tfvars` to customize:
- AWS region
- Instance types
- Database passwords
- VPC CIDR blocks
- Environment tags

### Application Configuration
Configure environment-specific settings in backend and frontend config files.

##  Monitoring & Logs

###CloudWatch Dashboards
Access your monitoring dashboard in AWS Console:
- CloudWatch → Dashboards
- Monitor CPU, Memory, Network, Request counts

### Application Logs
Logs are aggregated in CloudWatch Logs:
```bash
aws logs tail /aws/ecs/hrms-service --follow
```

##  Contributing

1. Clone the repository
2. Create a feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

##  Best Practices

- **Always plan before applying**: Run `terraform plan` to review changes
- **Use state locks**: Enable remote backend with state lock support
- **Version control**: Never commit sensitive data (use `.gitignore`)
- **Backup database**: Regular automated backups are configured
- **Monitor costs**: Monitor AWS billing to avoid unexpected charges
- **Update regularly**: Keep dependencies and AMIs updated

##  Troubleshooting

### Terraform Issues
```bash
# Refresh state
terraform refresh

# Check for drift
terraform plan

# Debug with verbose logging
TF_LOG=DEBUG terraform apply
```

### Database Connection Issues
```bash
# Test RDS connectivity
telnet <rds-endpoint> 3306

# Check security groups
aws ec2 describe-security-groups --group-ids <sg-id>
```

### Application Issues
Check logs in CloudWatch and application logs directory.

##  Support

For issues or questions:
1. Check the troubleshooting section
2. Review CloudWatch logs
3. Check Terraform state for drift
4. Review AWS Console resource details

##  License

This project is proprietary and confidential. All rights reserved.

---

**Last Updated**: February 18, 2026  
**Current Version**: Production  
**Status**: Active
