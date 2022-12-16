#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#
#*                 Root Module                         *#
#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#

# Service Principal Variables

variable "client_id" {
    description =   "Client ID (APP ID) of the application"
    type        =   string
    default     =  "edef04e2-c2cb-4db9-b50c-245c86f851fb"
}

variable "client_secret" {
    description =   "Client Secret (Password) of the application"
    type        =   string
    default     =  "GJp8Q~4ufHwvmKSNjyTi.wC4XUy7njnsbEZAbang"
}

variable "subscription_id" {
    description =   "Subscription ID"
    type        =   string
    default     =  "0444f5bd-f158-45de-9a56-190ccc7ee8c3"
}

variable "tenant_id" {
    description =   "Tenant ID"
    type        =   string
    default     =  "069ca8c2-34f8-4786-940a-96d33e8cf1f3"
}