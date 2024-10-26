variable "settings" {
    type = object({
      name = string
      location = string
      tags = optional(map(string))
    })
 
}