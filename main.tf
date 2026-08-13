resource "aws_budgets_budget_action" "budgets_budget_actions" {
  for_each = var.budgets_budget_actions

  action_type        = each.value.action_type
  approval_model     = each.value.approval_model
  budget_name        = each.value.budget_name
  execution_role_arn = each.value.execution_role_arn
  notification_type  = each.value.notification_type
  account_id         = each.value.account_id
  tags               = each.value.tags
  tags_all           = each.value.tags_all

  action_threshold {
    action_threshold_type  = each.value.action_threshold.action_threshold_type
    action_threshold_value = each.value.action_threshold.action_threshold_value
  }

  definition {
    dynamic "iam_action_definition" {
      for_each = each.value.definition.iam_action_definition != null ? [each.value.definition.iam_action_definition] : []
      content {
        groups     = iam_action_definition.value.groups
        policy_arn = iam_action_definition.value.policy_arn
        roles      = iam_action_definition.value.roles
        users      = iam_action_definition.value.users
      }
    }
    dynamic "scp_action_definition" {
      for_each = each.value.definition.scp_action_definition != null ? [each.value.definition.scp_action_definition] : []
      content {
        policy_id  = scp_action_definition.value.policy_id
        target_ids = scp_action_definition.value.target_ids
      }
    }
    dynamic "ssm_action_definition" {
      for_each = each.value.definition.ssm_action_definition != null ? [each.value.definition.ssm_action_definition] : []
      content {
        action_sub_type = ssm_action_definition.value.action_sub_type
        instance_ids    = ssm_action_definition.value.instance_ids
        region          = ssm_action_definition.value.region
      }
    }
  }

  dynamic "subscriber" {
    for_each = each.value.subscriber
    content {
      address           = subscriber.value.address
      subscription_type = subscriber.value.subscription_type
    }
  }
}

