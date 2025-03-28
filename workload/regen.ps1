az login --identity
$Version = az keyvault secret show --name "translatorsecret" --vault-name "KartiKV" --query "id" -o tsv
 
az keyvault secret delete --id $Version
az keyvault secret purge --id $Version
 
az keyvault secret set --name "translatorsecret" --vault-name "KartiKV" --value $(az cognitiveservices account keys regenerate --name "ktranslator" --resource-group "Kartik-RG" --key-name "key1" --query "key1" -o tsv)
 
az cognitiveservices account keys regenerate --name "ktranslator" --resource-group "Kartik-RG" --key-name "key2" --query "key2" -o tsv