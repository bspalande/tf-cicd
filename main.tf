#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#
#*                 Root Module                         *#
#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#

# Terraform Block

terraform {
    required_providers  {
        azurerm =   {
            source  =   "hashicorp/azurerm"
        }
    }
}

# Provider Block

provider "azurerm" {
    version         =   "~> 2.0"
    client_id       =   "edef04e2-c2cb-4db9-b50c-245c86f851fb"
    client_secret   =   "GJp8Q~4ufHwvmKSNjyTi.wC4XUy7njnsbEZAbang"
    subscription_id =   "0444f5bd-f158-45de-9a56-190ccc7ee8c3"
    tenant_id       =   "069ca8c2-34f8-4786-940a-96d33e8cf1f3"
    
    features {}
}




provider "azuread" {
    version         =   ">= 0.11"
    client_id       =   "edef04e2-c2cb-4db9-b50c-245c86f851fb"
    client_secret   =   "GJp8Q~4ufHwvmKSNjyTi.wC4XUy7njnsbEZAbang"
    tenant_id       =   "069ca8c2-34f8-4786-940a-96d33e8cf1f3"
    alias           =   "ad"
}


// module "windows-server" {
//     source  =   "./azure/WindowsServer2019"
// }

// module "winvm" {
//     source =    "./azure/Windows10-ExistingInfra"
// }



// module "aks" {
//     source    =     "./azure/aks"
//     env       =     "dev"
// }



// module "customrole" {
//     source  =   "./azure/custom-roles"
// }

// module "provisioners" {
//     source  =   "./azure/provisioners-example"
// }

// module "linuxvm" {
//     source  =   "./azure/linuxVM"
// }

