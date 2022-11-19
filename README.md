# Terraform Sample
## Azure Resource
This includes of the following resources:
- Resource group
- Virtual network
- Network interface
- Network security group


## SystemConfiguration
![SystemConfiguration](/img/SystemConfiguration.svg)

## Instructions
Make sure have the [Azure CLI](https://learn.microsoft.com/ja-jp/cli/azure/install-azure-cli) and [Terraform](https://www.terraform.io/downloads)

1. Update terraform.tfvars with your desired values.

2. Run the following command.

```bash:bash
terraform init
terraform plan
terraform apply
```

## Notes
- The deployment was tested on windows.
