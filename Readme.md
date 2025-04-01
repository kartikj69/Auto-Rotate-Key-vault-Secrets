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
- **Azure Logic App**: Serverless workflow that handles the key rotation process
- **RBAC Permissions**: Ensures the Logic App has proper access to both services

## Components
- **Translator Module**: Provisions Azure Cognitive Services Text Translation service
- **Key Vault Module**: Sets up Azure Key Vault with RBAC authorization
- **Secret Module**: Manages the storage of secrets in Key Vault
- **Logic App Module**: Configures the Azure Logic App workflow with triggers and actions
- **Permissions Module**: Handles RBAC role assignments for secure access

## Prerequisites
- Azure subscription (with Owner access, and Key Vault Administrator)
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
1. The Logic App runs on a recurrence trigger (hourly by default)
2. The workflow:
   - Uses HTTP actions with managed identity authentication
   - Regenerates the primary key for the Translator service
   - Parses the JSON response to extract the new key
   - Deletes the old secret from Key Vault
   - Waits for a delay to ensure deletion is complete
   - Purges the deleted secret from Key Vault
   - Adds the new key as a secret to Key Vault

## Configuration
Key configuration parameters in `terraform.tfvars`:
- `logicapp_name`: Name of the Logic App workflow
- `logicapp_schedule`: Controls when key rotation occurs (frequency, interval, timezone)
- `secret_name`: Name of the secret in Key Vault

## Security Considerations
- System-assigned managed identities are used for authentication
- RBAC is implemented using the principle of least privilege
- Key Vault is configured with RBAC authorization
- Previous versions of secrets are properly purged

## Customization
To adapt this solution for other Azure AI services:
1. Modify the URI and body parameters in `modules/logicapp/locals.tf` to target your specific service
2. Update the RBAC roles in `locals.tf` to match the requirements of your service
3. Adjust the schedule parameters to meet your security policy requirements

## Contributing
Contributions to improve this solution are welcome. Please follow standard pull request processes to submit changes.

## License
[Specify your license information here]