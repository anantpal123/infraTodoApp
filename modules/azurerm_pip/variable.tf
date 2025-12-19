variable "pips" {
    type=map(object({
        pip_name =string
        location =string
        rg_name  =string
        allocation_method =string
        idle_timeout_in_minutes =number
        tags =map(string)
        
    }))
  
}