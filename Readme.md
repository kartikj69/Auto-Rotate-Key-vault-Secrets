# Auto-Rotate-Key-vault-Secrets

## Overview
This Terraform solution automates the rotation of AI API keys (specifically Azure Translator API keys), storing them securely in Azure Key Vault while managing previous versions of the secrets to maintain compliance and security.

## Use Case
Many organizations using AI services need to regularly rotate API keys as a security best practice. This solution automates that process by:
1. Regenerating AI service keys on a scheduled basis
2. Securely storing the new keys in Azure Key Vault
3. Removing previous versions of the secrets to maintain compliance
4. Managing all infrastructure as code with Terraform

## Architecture
The solution consists of:
- **Azure Cognitive Services (Translator)**: AI service that provides translation capabilities
- **Azure Key Vault**: Secure secret storage for the API keys
- **Azure Automation Account**: Runs scheduled PowerShell scripts to rotate keys
- **RBAC Permissions**: Ensures the automation account has proper access to both services

## Components
- **Translator Module**: Provisions Azure Cognitive Services Text Translation service
- **Key Vault Module**: Sets up Azure Key Vault with RBAC authorization
- **Secret Module**: Manages the storage of secrets in Key Vault
- **Automation Account Module**: Configures the Azure Automation Account, runbook, and schedule
- **Permissions Module**: Handles RBAC role assignments for secure access

## Prerequisites
- Azure subscription (with Owner access, and Key Vault Admiistrator)
- Terraform (v0.14+)
- Azure CLI (for authentication)
- Proper permissions to create resources in Azure

## Deployment
1. Clone this repository
2. Navigate to the `workload` directory
3. Update the `terraform.tfvars` file with your specific values
4. Run the following commands:
    ```bash
    terraform init
    terraform plan -out main.tfplan
    terraform apply main.tfplan
    ```

## How It Works
1. The Automation Account runs a PowerShell script on a scheduled basis (hourly by default)
2. The script:
    - Logs in using managed identity
    - Retrieves the current secret from Key Vault
    - Regenerates the primary key for the Translator service
    - Deletes and purges the old secret from Key Vault
    - Stores the new key in Key Vault
    - Additionally regenerates the secondary key (for high availability)

## Configuration
Key configuration parameters in `terraform.tfvars`:
- `sku_name`: Tier of the Automation Account
- `schedule`: Controls when key rotation occurs (frequency, interval, timezone)
- `runbook`: Defines the PowerShell script execution environment

## Security Considerations
- System-assigned managed identities are used for authentication
- RBAC is implemented using the principle of least privilege
- Key Vault is configured with RBAC authorization
- Previous versions of secrets are properly purged

## Customization
To adapt this solution for other Azure AI services:
1. Modify the script in `regen.ps1` to target your specific service
2. Update the RBAC roles in `locals.tf` to match the requirements of your service
3. Adjust the schedule parameters to meet your security policy requirements