resource "random_integer" "days" {
  min = 1
  max = 30
}

module "days" {
  source   = "../"
  duration = [resource.random_integer.days.result, "days"]
}

module "singular_day" {
  source   = "../"
  duration = [resource.random_integer.days.result, "day"]
}

output "singular_day" {
  value = module.singular_day.days
  precondition {
    condition     = module.days.days == module.singular_day.days
    error_message = "singular version doesn't match"
  }
}

output "years_from_days" {
  value = module.days.years
  precondition {
    condition     = module.days.years == resource.random_integer.days.result / 365
    error_message = "number of years did not match"
  }
}

output "months_from_days" {
  value = module.days.months
  precondition {
    condition     = module.days.months == resource.random_integer.days.result / 30
    error_message = "number of months did not match"
  }
}

output "weeks_from_days" {
  value = module.days.weeks
  precondition {
    condition     = module.days.weeks == resource.random_integer.days.result / 7
    error_message = "number of weeks did not match"
  }
}

output "days_from_days" {
  value = module.days.days
  precondition {
    condition     = module.days.days == resource.random_integer.days.result
    error_message = "number of days did not match"
  }
}

output "hours_from_days" {
  value = module.days.hours
  precondition {
    condition     = module.days.hours == resource.random_integer.days.result * 24
    error_message = "number of hours did not match"
  }
}

output "minutes_from_days" {
  value = module.days.minutes
  precondition {
    condition     = module.days.minutes == resource.random_integer.days.result * 24 * 60
    error_message = "number of minutes did not match"
  }
}

output "seconds_from_days" {
  value = module.days.seconds
  precondition {
    condition     = module.days.seconds == resource.random_integer.days.result * 24 * 60 * 60
    error_message = "number of seconds did not match"
  }
}
