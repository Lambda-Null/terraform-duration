resource "random_integer" "weeks" {
  min = 1
  max = 30
}

module "weeks" {
  source   = "../"
  duration = [resource.random_integer.weeks.result, "weeks"]
}

module "singular_week" {
  source   = "../"
  duration = [resource.random_integer.weeks.result, "week"]
}

output "singular_week" {
  value = module.singular_week.weeks
  precondition {
    condition     = module.weeks.weeks == module.singular_week.weeks
    error_message = "singular version doesn't match"
  }
}

output "years_from_weeks" {
  value = module.weeks.years
  precondition {
    condition     = module.weeks.years == resource.random_integer.weeks.result * 7 / 365
    error_message = "number of years did not match"
  }
}

output "months_from_weeks" {
  value = module.weeks.months
  precondition {
    condition     = module.weeks.months == resource.random_integer.weeks.result * 7 / 30
    error_message = "number of months did not match"
  }
}

output "weeks_from_weeks" {
  value = module.weeks.weeks
  precondition {
    condition     = module.weeks.weeks == resource.random_integer.weeks.result
    error_message = "number of weeks did not match"
  }
}

output "days_from_weeks" {
  value = module.weeks.days
  precondition {
    condition     = module.weeks.days == resource.random_integer.weeks.result * 7
    error_message = "number of days did not match"
  }
}

output "hours_from_weeks" {
  value = module.weeks.hours
  precondition {
    condition     = module.weeks.hours == resource.random_integer.weeks.result * 7 * 24
    error_message = "number of hours did not match"
  }
}

output "minutes_from_weeks" {
  value = module.weeks.minutes
  precondition {
    condition     = module.weeks.minutes == resource.random_integer.weeks.result * 7 * 24 * 60
    error_message = "number of minutes did not match"
  }
}

output "seconds_from_weeks" {
  value = module.weeks.seconds
  precondition {
    condition     = module.weeks.seconds == resource.random_integer.weeks.result * 7 * 24 * 60 * 60
    error_message = "number of seconds did not match"
  }
}
