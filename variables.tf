variable "budgets_budget_actions" {
  description = <<EOT
Map of budgets_budget_actions, attributes below
Required:
    - action_type
    - approval_model
    - budget_name
    - execution_role_arn
    - notification_type
    - action_threshold (block):
        - action_threshold_type (required)
        - action_threshold_value (required)
    - definition (block):
        - iam_action_definition (optional, block):
            - groups (optional)
            - policy_arn (required)
            - roles (optional)
            - users (optional)
        - scp_action_definition (optional, block):
            - policy_id (required)
            - target_ids (required)
        - ssm_action_definition (optional, block):
            - action_sub_type (required)
            - instance_ids (required)
            - region (required)
    - subscriber (block):
        - address (required)
        - subscription_type (required)
Optional:
    - account_id
    - tags
    - tags_all
EOT

  type = map(object({
    action_type        = string
    approval_model     = string
    budget_name        = string
    execution_role_arn = string
    notification_type  = string
    account_id         = optional(string)
    tags               = optional(map(string))
    tags_all           = optional(map(string))
    action_threshold = object({
      action_threshold_type  = string
      action_threshold_value = number
    })
    definition = object({
      iam_action_definition = optional(object({
        groups     = optional(set(string))
        policy_arn = string
        roles      = optional(set(string))
        users      = optional(set(string))
      }))
      scp_action_definition = optional(object({
        policy_id  = string
        target_ids = set(string)
      }))
      ssm_action_definition = optional(object({
        action_sub_type = string
        instance_ids    = set(string)
        region          = string
      }))
    })
    subscriber = list(object({
      address           = string
      subscription_type = string
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.budgets_budget_actions : (
        length(v.subscriber) >= 1 && length(v.subscriber) <= 11
      )
    ])
    error_message = "Each subscriber list must contain between 1 and 11 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.budgets_budget_actions : (
        v.action_threshold.action_threshold_value >= 0 && v.action_threshold.action_threshold_value <= 40000000000
      )
    ])
    error_message = "must be between 0 and 40000000000"
  }
  validation {
    condition = alltrue([
      for k, v in var.budgets_budget_actions : (
        (length(v.budget_name) >= 1 && length(v.budget_name) <= 100) && (can(regex("[^:\\\\]+", v.budget_name)))
      )
    ])
    error_message = "all of: must be between 1 and 100 characters; The ':' and '\\' characters aren't allowed."
  }
  # Note: 10 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

