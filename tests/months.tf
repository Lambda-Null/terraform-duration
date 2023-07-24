resource "random_integer" "months" {
  min = 1
  max = 30
}

module "months" {
  source   = "../"
  duration = [resource.random_integer.months.result, "months"]
}

module "singular_month" {
  source   = "../"
  duration = [resource.random_integer.months.result, "month"]
}

output "singular_month" {
  value = module.singular_month.months
  precondition {
    condition     = module.months.months == module.singular_month.months
    error_message = "singular version doesn't match"
  }
}

output "years_from_months" {
  value = module.months.years
  precondition {
    condition     = module.months.years == resource.random_integer.months.result * 30 / 365
    error_message = "number of years did not match"
  }
}

output "months_from_months" {
  value = module.months.months
  precondition {
    condition     = module.months.months == resource.random_integer.months.result
    error_message = "number of months did not match"
  }
}

output "weeks_from_months" {
  value = module.months.weeks
  precondition {
    condition     = module.months.weeks == resource.random_integer.months.result * 30 / 7
    error_message = "number of weeks did not match"
  }
}

output "days_from_months" {
  value = module.months.days
  precondition {
    condition     = module.months.days == resource.random_integer.months.result * 30
    error_message = "number of days did not match"
  }
}

output "hours_from_months" {
  value = module.months.hours
  precondition {
    condition     = module.months.hours == resource.random_integer.months.result * 30 * 24
    error_message = "number of hours did not match"
  }
}

output "minutes_from_months" {
  value = module.months.minutes
  precondition {
    condition     = module.months.minutes == resource.random_integer.months.result * 30 * 24 * 60
    error_message = "number of minutes did not match"
  }
}

output "seconds_from_months" {
  value = module.months.seconds
  precondition {
    condition     = module.months.seconds == resource.random_integer.months.result * 30 * 24 * 60 * 60
    error_message = "number of seconds did not match"
  }
}
