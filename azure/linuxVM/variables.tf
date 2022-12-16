#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*
# Linux VM - Variables
#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*

# Service Principal Variables

variable "client_id" {
     description =   "Client ID (APP ID) of the application"
     type        =   string
      default     =   "edef04e2-c2cb-4db9-b50c-245c86f851fb"
 }

variable "client_secret" {
     description =   "Client Secret (Password) of the application"
     type        =   string
      default     =   "GJp8Q~4ufHwvmKSNjyTi.wC4XUy7njnsbEZAbang"
 }

variable "subscription_id" {
     description =   "Subscription ID"
     type        =   string
      default     =   "0444f5bd-f158-45de-9a56-190ccc7ee8c3"
 }

variable "tenant_id" {
     description =   "Tenant ID"
     type        =   string
      default     =   "069ca8c2-34f8-4786-940a-96d33e8cf1f3"
 }

# Prefix and Tags

variable "prefix" {
    description =   "Prefix to append to all resource names"
    type        =   string
    default     =   "tf"
}

variable "tags" {
    description =   "Resouce tags"
    type        =   map(string)
    default     =   {
        "author"        =   "Vamsi"
        "deployed_with" =   "Terraform"
    }
}

# Resource Group

variable "location" {
    description =   "Location of the resource group"
    type        =   string
    default     =   "East US"
}

# Vnet and Subnet

variable "vnet_address_range" {
    description =   "IP Range of the virtual network"
    type        =   string
    default     =   "10.0.0.0/16"
}

variable "subnet_address_range" {
    description =   "IP Range of the virtual network"
    type        =   string
    default     =   "10.0.1.0/24"
}

# Public IP and NIC Allocation Method

variable "allocation_method" {
    description =   "Allocation method for Public IP Address and NIC Private ip address"
    type        =   list(string)
    default     =   ["Static", "Dynamic"]
}


# VM 

variable "virtual_machine_size" {
    description =   "Size of the VM"
    type        =   string
    default     =   "Standard_B1s"
}

variable "computer_name" {
    description =   "Computer name"
    type        =   string
    default     =   "Linuxvm"
}

variable "admin_username" {
    description =   "Username to login to the VM"
    type        =   string
    default     =   "linuxadmin"
}

variable "admin_password" {
    description =   "Password to login to the VM"
    type        =   string
    default     =   "P@$$w0rD2020*"
}

variable "os_disk_caching" {
    default     =       "ReadWrite"
}

variable "os_disk_storage_account_type" {
    default     =       "StandardSSD_LRS"
}

variable "os_disk_size_gb" {
    default     =       64
}

variable "publisher" {
    default     =       "Canonical"
}

variable "offer" {
    default     =       "UbuntuServer"
}

variable "sku" {
    default     =       "16.04-LTS"
}

variable "vm_image_version" {
    default     =       "latest"
}
