az login --identity
$Version = az keyvault secret show --name "<secret-name>" --vault-name "<kvname>" --query "id" -o tsv
 
az keyvault secret delete --id $Version
az keyvault secret purge --id $Version
 
az keyvault secret set --name "<secret-name>" --vault-name "<kvname>" --value $(az cognitiveservices account keys regenerate --name "<AI-name>" --resource-group "<rg-name>" --key-name "key1" --query "key1" -o tsv)
 
az cognitiveservices account keys regenerate --name "<AI-name>" --resource-group "<rg-name>" --key-name "key2" --query "key2" -o tsv