output "budgets_budget_actions_id" {
  description = "Map of id values across all budgets_budget_actions, keyed the same as var.budgets_budget_actions"
  value       = { for k, v in aws_budgets_budget_action.budgets_budget_actions : k => v.id if v.id != null && length(v.id) > 0 }
}
output "budgets_budget_actions_account_id" {
  description = "Map of account_id values across all budgets_budget_actions, keyed the same as var.budgets_budget_actions"
  value       = { for k, v in aws_budgets_budget_action.budgets_budget_actions : k => v.account_id if v.account_id != null && length(v.account_id) > 0 }
}
output "budgets_budget_actions_action_id" {
  description = "Map of action_id values across all budgets_budget_actions, keyed the same as var.budgets_budget_actions"
  value       = { for k, v in aws_budgets_budget_action.budgets_budget_actions : k => v.action_id if v.action_id != null && length(v.action_id) > 0 }
}
output "budgets_budget_actions_action_threshold" {
  description = "Map of action_threshold values across all budgets_budget_actions, keyed the same as var.budgets_budget_actions"
  value       = { for k, v in aws_budgets_budget_action.budgets_budget_actions : k => one(v.action_threshold) if v.action_threshold != null && length(v.action_threshold) > 0 }
}
output "budgets_budget_actions_action_type" {
  description = "Map of action_type values across all budgets_budget_actions, keyed the same as var.budgets_budget_actions"
  value       = { for k, v in aws_budgets_budget_action.budgets_budget_actions : k => v.action_type if v.action_type != null && length(v.action_type) > 0 }
}
output "budgets_budget_actions_approval_model" {
  description = "Map of approval_model values across all budgets_budget_actions, keyed the same as var.budgets_budget_actions"
  value       = { for k, v in aws_budgets_budget_action.budgets_budget_actions : k => v.approval_model if v.approval_model != null && length(v.approval_model) > 0 }
}
output "budgets_budget_actions_arn" {
  description = "Map of arn values across all budgets_budget_actions, keyed the same as var.budgets_budget_actions"
  value       = { for k, v in aws_budgets_budget_action.budgets_budget_actions : k => v.arn if v.arn != null && length(v.arn) > 0 }
}
output "budgets_budget_actions_budget_name" {
  description = "Map of budget_name values across all budgets_budget_actions, keyed the same as var.budgets_budget_actions"
  value       = { for k, v in aws_budgets_budget_action.budgets_budget_actions : k => v.budget_name if v.budget_name != null && length(v.budget_name) > 0 }
}
output "budgets_budget_actions_definition" {
  description = "Map of definition values across all budgets_budget_actions, keyed the same as var.budgets_budget_actions"
  value       = { for k, v in aws_budgets_budget_action.budgets_budget_actions : k => one(v.definition) if v.definition != null && length(v.definition) > 0 }
}
output "budgets_budget_actions_execution_role_arn" {
  description = "Map of execution_role_arn values across all budgets_budget_actions, keyed the same as var.budgets_budget_actions"
  value       = { for k, v in aws_budgets_budget_action.budgets_budget_actions : k => v.execution_role_arn if v.execution_role_arn != null && length(v.execution_role_arn) > 0 }
}
output "budgets_budget_actions_notification_type" {
  description = "Map of notification_type values across all budgets_budget_actions, keyed the same as var.budgets_budget_actions"
  value       = { for k, v in aws_budgets_budget_action.budgets_budget_actions : k => v.notification_type if v.notification_type != null && length(v.notification_type) > 0 }
}
output "budgets_budget_actions_status" {
  description = "Map of status values across all budgets_budget_actions, keyed the same as var.budgets_budget_actions"
  value       = { for k, v in aws_budgets_budget_action.budgets_budget_actions : k => v.status if v.status != null && length(v.status) > 0 }
}
output "budgets_budget_actions_subscriber" {
  description = "Map of subscriber values across all budgets_budget_actions, keyed the same as var.budgets_budget_actions"
  value       = { for k, v in aws_budgets_budget_action.budgets_budget_actions : k => v.subscriber if v.subscriber != null && length(v.subscriber) > 0 }
}
output "budgets_budget_actions_tags" {
  description = "Map of tags values across all budgets_budget_actions, keyed the same as var.budgets_budget_actions"
  value       = { for k, v in aws_budgets_budget_action.budgets_budget_actions : k => v.tags if v.tags != null && length(v.tags) > 0 }
}
output "budgets_budget_actions_tags_all" {
  description = "Map of tags_all values across all budgets_budget_actions, keyed the same as var.budgets_budget_actions"
  value       = { for k, v in aws_budgets_budget_action.budgets_budget_actions : k => v.tags_all if v.tags_all != null && length(v.tags_all) > 0 }
}

