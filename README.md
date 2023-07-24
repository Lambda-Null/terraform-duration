# Terraform Duration

Provides a uniform way of converting different forms of a time duration.

```terraform
module "duration" {
  source = "git@github.com:Lambda-Null/terraform-duration.git"
  duration = [10, "days"]
}

output "hours" {
  value = module.duration.hours
}
```

For the purposes of this module, months are all 30 days and years are all 365 days. Obviously this isn't perfect, but if you find you need that nuance feel free to submit a PR with the more sophisticated code.

To verify behavior when making changes, the subdirectory `tests` is a terraform module that validates all input/output unit combinations. You can execute those tests by running `sh test.sh`.

<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

No providers.

## Modules

No modules.

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_duration"></a> [duration](#input\_duration) | The desired duration in the format [amount, "unit"], most common units of time are valid in both singular and plural forms | `tuple([number, string])` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_days"></a> [days](#output\_days) | duration in days |
| <a name="output_hours"></a> [hours](#output\_hours) | duration in hours |
| <a name="output_minutes"></a> [minutes](#output\_minutes) | duration in minutes |
| <a name="output_months"></a> [months](#output\_months) | duration in months |
| <a name="output_seconds"></a> [seconds](#output\_seconds) | duration in seconds |
| <a name="output_weeks"></a> [weeks](#output\_weeks) | duration in weeks |
| <a name="output_years"></a> [years](#output\_years) | duration in years |
<!-- END_TF_DOCS -->
