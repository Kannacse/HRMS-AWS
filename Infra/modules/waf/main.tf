resource "aws_wafv2_web_acl" "waf" {

  name  = var.name
  scope = "REGIONAL"

  default_action {
    allow {}
  }

  ###################################################
  # AWS Managed Common Rule Set
  ###################################################

  rule {

    name = "AWSManagedCommonRuleSet"

    priority = 1

    override_action {
      none {}
    }

    statement {

      managed_rule_group_statement {

        vendor_name = "AWS"

        name = "AWSManagedRulesCommonRuleSet"

      }

    }

    visibility_config {

      cloudwatch_metrics_enabled = true

      metric_name = "CommonRules"

      sampled_requests_enabled = true

    }

  }

  ###################################################
  # Visibility
  ###################################################

  visibility_config {

    cloudwatch_metrics_enabled = true

    metric_name = "HRMS-WAF"

    sampled_requests_enabled = true

  }

  tags = {

    Name = var.name

    Project = "HRMS"

  }

}
