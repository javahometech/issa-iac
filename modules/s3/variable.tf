variable "bucket_name" {
  default     = "my-s3-custom-bucket"
  type        = string
  description = "choose unique bucket name"
}


variable "enabled" {
  default     = true
  type        = bool
  description = "whether to versioning enabled or not"
}

variable "create" {
  description = "Whether to create this resource or not?"
  type        = bool
  default     = true
}

variable "acl" {
  description = "select canned ACL that applies to bucket and object or only to bucket"
  type        = string
  default     = "private"
}

variable "tags" {
  description = "A map of tags to assign to the object."
  type        = map(string)
  default     = {}
}

variable "storage_class" {
  description = "Specify the desired Storage Class for the object"
  type        = string
  default     = "STANDRAD_IA"
}


variable "lifecycle_enabled" {
  default     = true
  type        = bool
  description = "whether to life_cycle_rule to be enabled or not"
}

variable "days" {
  default     = 30
  type        = number
  description = "specify the no.of days after the object that has to move from one storage to other strage class"
}

variable "days_after_above_transition" {
  default     = 60
  type        = number
  description = "specify the no.of days after the object that has to move from one storage to other strage class"
}

variable "storage_class_afterend_of_aboveperiod" {
  description = "Specify the desired Storage Class for the object"
  type        = string
  default     = "GLACIER"
}