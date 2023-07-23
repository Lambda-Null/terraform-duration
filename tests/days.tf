resource "random_integer" "days" {
  min = 1
  max = 30
}

module "duration" {
  source   = "../../"
  duration = [resource.random_integer.days.result, "days"]
}

module "singular" {
  source   = "../../"
  duration = [resource.random_integer.days.result, "day"]
}

output "singular" {
  value = module.singular.days
  precondition {
    condition     = module.duration.days == module.singular.days
    error_message = "singular version doesn't match"
  }
}

output "months" {
  value = module.duration.months
  precondition {
    condition     = module.duration.months == resource.random_integer.days.result / 30
    error_message = "number of months did not match"
  }
}

output "weeks" {
  value = module.duration.weeks
  precondition {
    condition     = module.duration.weeks == resource.random_integer.days.result / 7
    error_message = "number of weeks did not match"
  }
}

output "days" {
  value = module.duration.days
  precondition {
    condition     = module.duration.days == resource.random_integer.days.result
    error_message = "number of days did not match"
  }
}

output "hours" {
  value = module.duration.hours
  precondition {
    condition     = module.duration.hours == resource.random_integer.days.result * 24
    error_message = "number of hours did not match"
  }
}

output "minutes" {
  value = module.duration.minutes
  precondition {
    condition     = module.duration.minutes == resource.random_integer.days.result * 24 * 60
    error_message = "number of minutes did not match"
  }
}

output "seconds" {
  value = module.duration.seconds
  precondition {
    condition     = module.duration.seconds == resource.random_integer.days.result * 24 * 60 * 60
    error_message = "number of seconds did not match"
  }
}
