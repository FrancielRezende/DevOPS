variable "filename" {
    default     = "/temp/pets_var.txt"
    type        = string
    description = "Local where the file will be created"
}
variable "content" {
    default = "We love pets and vars!!"  
}
variable file-content {
  type      = map
  default   = {
    "content1" = "We love pets"
    "content2" = "We love pets and vars!"
    "content3" = "We love pets and var maps!"
  }
}
variable "prefix" {
    default = "Mr"  
}
variable "prefix_set" {
    default     = ["Mr", "Mrs", "Sir"]
    type        = set(string)
    description = "Sets cannot have duplicated values"

}
variable "prefix_list" {
    default     = ["Mr", "Mrs", "Sir", "Sir"]
    type        = list(string)
    description = "Lists can have duplicated values"
}
variable "prefix_tuple" {
    type        = tuple([string, number, bool])
    default     = [ "value", 0, false ]
    description = "Tuples can use multipe types of values"
}
variable "separator" {
    default = "." 
}
variable "length" {
    default = "2"  
}