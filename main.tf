resource "datadog_powerpack" "powerpacks" {
  for_each = var.powerpacks

  description = each.value.description
  live_span   = each.value.live_span
  name        = each.value.name
  show_title  = each.value.show_title
  tags        = each.value.tags

  dynamic "layout" {
    for_each = each.value.layout != null ? [each.value.layout] : []
    content {
      height = layout.value.height
      width  = layout.value.width
      x      = layout.value.x
      y      = layout.value.y
    }
  }

  dynamic "template_variables" {
    for_each = each.value.template_variables != null ? each.value.template_variables : []
    content {
      defaults = template_variables.value.defaults
      name     = template_variables.value.name
    }
  }

  dynamic "widget" {
    for_each = each.value.widget != null ? each.value.widget : []
    content {
      dynamic "alert_graph_definition" {
        for_each = widget.value.alert_graph_definition != null ? [widget.value.alert_graph_definition] : []
        content {
          alert_id                  = alert_graph_definition.value.alert_id
          hide_incomplete_cost_data = alert_graph_definition.value.hide_incomplete_cost_data
          live_span                 = alert_graph_definition.value.live_span
          title                     = alert_graph_definition.value.title
          title_align               = alert_graph_definition.value.title_align
          title_size                = alert_graph_definition.value.title_size
          viz_type                  = alert_graph_definition.value.viz_type
        }
      }
      dynamic "alert_value_definition" {
        for_each = widget.value.alert_value_definition != null ? [widget.value.alert_value_definition] : []
        content {
          alert_id    = alert_value_definition.value.alert_id
          description = alert_value_definition.value.description
          precision   = alert_value_definition.value.precision
          text_align  = alert_value_definition.value.text_align
          title       = alert_value_definition.value.title
          title_align = alert_value_definition.value.title_align
          title_size  = alert_value_definition.value.title_size
          unit        = alert_value_definition.value.unit
        }
      }
      dynamic "change_definition" {
        for_each = widget.value.change_definition != null ? [widget.value.change_definition] : []
        content {
          dynamic "custom_link" {
            for_each = change_definition.value.custom_link != null ? change_definition.value.custom_link : []
            content {
              is_hidden      = custom_link.value.is_hidden
              label          = custom_link.value.label
              link           = custom_link.value.link
              override_label = custom_link.value.override_label
            }
          }
          description               = change_definition.value.description
          hide_incomplete_cost_data = change_definition.value.hide_incomplete_cost_data
          live_span                 = change_definition.value.live_span
          dynamic "request" {
            for_each = change_definition.value.request != null ? change_definition.value.request : []
            content {
              dynamic "apm_query" {
                for_each = request.value.apm_query != null ? [request.value.apm_query] : []
                content {
                  dynamic "compute_query" {
                    for_each = apm_query.value.compute_query != null ? [apm_query.value.compute_query] : []
                    content {
                      aggregation = compute_query.value.aggregation
                      facet       = compute_query.value.facet
                      interval    = compute_query.value.interval
                    }
                  }
                  dynamic "group_by" {
                    for_each = apm_query.value.group_by != null ? apm_query.value.group_by : []
                    content {
                      facet = group_by.value.facet
                      limit = group_by.value.limit
                      dynamic "sort_query" {
                        for_each = group_by.value.sort_query != null ? [group_by.value.sort_query] : []
                        content {
                          aggregation = sort_query.value.aggregation
                          facet       = sort_query.value.facet
                          order       = sort_query.value.order
                        }
                      }
                    }
                  }
                  index = apm_query.value.index
                  dynamic "multi_compute" {
                    for_each = apm_query.value.multi_compute != null ? apm_query.value.multi_compute : []
                    content {
                      aggregation = multi_compute.value.aggregation
                      facet       = multi_compute.value.facet
                      interval    = multi_compute.value.interval
                    }
                  }
                  search_query = apm_query.value.search_query
                }
              }
              change_type = request.value.change_type
              compare_to  = request.value.compare_to
              dynamic "formula" {
                for_each = request.value.formula != null ? request.value.formula : []
                content {
                  alias             = formula.value.alias
                  cell_display_mode = formula.value.cell_display_mode
                  dynamic "conditional_formats" {
                    for_each = formula.value.conditional_formats != null ? formula.value.conditional_formats : []
                    content {
                      comparator      = conditional_formats.value.comparator
                      custom_bg_color = conditional_formats.value.custom_bg_color
                      custom_fg_color = conditional_formats.value.custom_fg_color
                      hide_value      = conditional_formats.value.hide_value
                      image_url       = conditional_formats.value.image_url
                      metric          = conditional_formats.value.metric
                      palette         = conditional_formats.value.palette
                      timeframe       = conditional_formats.value.timeframe
                      value           = conditional_formats.value.value
                    }
                  }
                  formula_expression = formula.value.formula_expression
                  dynamic "limit" {
                    for_each = formula.value.limit != null ? [formula.value.limit] : []
                    content {
                      count = limit.value.count
                      order = limit.value.order
                    }
                  }
                  dynamic "number_format" {
                    for_each = formula.value.number_format != null ? [formula.value.number_format] : []
                    content {
                      unit {
                        dynamic "canonical" {
                          for_each = number_format.value.unit.canonical != null ? [number_format.value.unit.canonical] : []
                          content {
                            per_unit_name = canonical.value.per_unit_name
                            unit_name     = canonical.value.unit_name
                          }
                        }
                        dynamic "custom" {
                          for_each = number_format.value.unit.custom != null ? [number_format.value.unit.custom] : []
                          content {
                            label = custom.value.label
                          }
                        }
                      }
                      dynamic "unit_scale" {
                        for_each = number_format.value.unit_scale != null ? [number_format.value.unit_scale] : []
                        content {
                          unit_name = unit_scale.value.unit_name
                        }
                      }
                    }
                  }
                  dynamic "style" {
                    for_each = formula.value.style != null ? [formula.value.style] : []
                    content {
                      palette       = style.value.palette
                      palette_index = style.value.palette_index
                    }
                  }
                }
              }
              increase_good = request.value.increase_good
              dynamic "log_query" {
                for_each = request.value.log_query != null ? [request.value.log_query] : []
                content {
                  dynamic "compute_query" {
                    for_each = log_query.value.compute_query != null ? [log_query.value.compute_query] : []
                    content {
                      aggregation = compute_query.value.aggregation
                      facet       = compute_query.value.facet
                      interval    = compute_query.value.interval
                    }
                  }
                  dynamic "group_by" {
                    for_each = log_query.value.group_by != null ? log_query.value.group_by : []
                    content {
                      facet = group_by.value.facet
                      limit = group_by.value.limit
                      dynamic "sort_query" {
                        for_each = group_by.value.sort_query != null ? [group_by.value.sort_query] : []
                        content {
                          aggregation = sort_query.value.aggregation
                          facet       = sort_query.value.facet
                          order       = sort_query.value.order
                        }
                      }
                    }
                  }
                  index = log_query.value.index
                  dynamic "multi_compute" {
                    for_each = log_query.value.multi_compute != null ? log_query.value.multi_compute : []
                    content {
                      aggregation = multi_compute.value.aggregation
                      facet       = multi_compute.value.facet
                      interval    = multi_compute.value.interval
                    }
                  }
                  search_query = log_query.value.search_query
                }
              }
              order_by  = request.value.order_by
              order_dir = request.value.order_dir
              dynamic "process_query" {
                for_each = request.value.process_query != null ? [request.value.process_query] : []
                content {
                  filter_by = process_query.value.filter_by
                  limit     = process_query.value.limit
                  metric    = process_query.value.metric
                  search_by = process_query.value.search_by
                }
              }
              q = request.value.q
              dynamic "query" {
                for_each = request.value.query != null ? request.value.query : []
                content {
                  dynamic "apm_dependency_stats_query" {
                    for_each = query.value.apm_dependency_stats_query != null ? [query.value.apm_dependency_stats_query] : []
                    content {
                      cross_org_uuids   = apm_dependency_stats_query.value.cross_org_uuids
                      data_source       = apm_dependency_stats_query.value.data_source
                      env               = apm_dependency_stats_query.value.env
                      is_upstream       = apm_dependency_stats_query.value.is_upstream
                      name              = apm_dependency_stats_query.value.name
                      operation_name    = apm_dependency_stats_query.value.operation_name
                      primary_tag_name  = apm_dependency_stats_query.value.primary_tag_name
                      primary_tag_value = apm_dependency_stats_query.value.primary_tag_value
                      resource_name     = apm_dependency_stats_query.value.resource_name
                      service           = apm_dependency_stats_query.value.service
                      stat              = apm_dependency_stats_query.value.stat
                    }
                  }
                  dynamic "apm_resource_stats_query" {
                    for_each = query.value.apm_resource_stats_query != null ? [query.value.apm_resource_stats_query] : []
                    content {
                      cross_org_uuids   = apm_resource_stats_query.value.cross_org_uuids
                      data_source       = apm_resource_stats_query.value.data_source
                      env               = apm_resource_stats_query.value.env
                      group_by          = apm_resource_stats_query.value.group_by
                      name              = apm_resource_stats_query.value.name
                      operation_name    = apm_resource_stats_query.value.operation_name
                      primary_tag_name  = apm_resource_stats_query.value.primary_tag_name
                      primary_tag_value = apm_resource_stats_query.value.primary_tag_value
                      resource_name     = apm_resource_stats_query.value.resource_name
                      service           = apm_resource_stats_query.value.service
                      stat              = apm_resource_stats_query.value.stat
                    }
                  }
                  dynamic "cloud_cost_query" {
                    for_each = query.value.cloud_cost_query != null ? [query.value.cloud_cost_query] : []
                    content {
                      aggregator      = cloud_cost_query.value.aggregator
                      cross_org_uuids = cloud_cost_query.value.cross_org_uuids
                      data_source     = cloud_cost_query.value.data_source
                      name            = cloud_cost_query.value.name
                      query           = cloud_cost_query.value.query
                    }
                  }
                  dynamic "event_query" {
                    for_each = query.value.event_query != null ? [query.value.event_query] : []
                    content {
                      dynamic "compute" {
                        for_each = event_query.value.compute
                        content {
                          aggregation = compute.value.aggregation
                          interval    = compute.value.interval
                          metric      = compute.value.metric
                        }
                      }
                      cross_org_uuids = event_query.value.cross_org_uuids
                      data_source     = event_query.value.data_source
                      dynamic "group_by" {
                        for_each = event_query.value.group_by != null ? event_query.value.group_by : []
                        content {
                          facet = group_by.value.facet
                          limit = group_by.value.limit
                          dynamic "sort" {
                            for_each = group_by.value.sort != null ? [group_by.value.sort] : []
                            content {
                              aggregation = sort.value.aggregation
                              metric      = sort.value.metric
                              order       = sort.value.order
                            }
                          }
                        }
                      }
                      dynamic "group_by_fields" {
                        for_each = event_query.value.group_by_fields != null ? [event_query.value.group_by_fields] : []
                        content {
                          fields = group_by_fields.value.fields
                          limit  = group_by_fields.value.limit
                          dynamic "sort" {
                            for_each = group_by_fields.value.sort != null ? [group_by_fields.value.sort] : []
                            content {
                              aggregation = sort.value.aggregation
                              metric      = sort.value.metric
                              order       = sort.value.order
                            }
                          }
                        }
                      }
                      indexes = event_query.value.indexes
                      name    = event_query.value.name
                      dynamic "search" {
                        for_each = event_query.value.search != null ? [event_query.value.search] : []
                        content {
                          query = search.value.query
                        }
                      }
                      storage = event_query.value.storage
                    }
                  }
                  dynamic "metric_query" {
                    for_each = query.value.metric_query != null ? [query.value.metric_query] : []
                    content {
                      aggregator      = metric_query.value.aggregator
                      cross_org_uuids = metric_query.value.cross_org_uuids
                      data_source     = metric_query.value.data_source
                      name            = metric_query.value.name
                      query           = metric_query.value.query
                      semantic_mode   = metric_query.value.semantic_mode
                    }
                  }
                  dynamic "process_query" {
                    for_each = query.value.process_query != null ? [query.value.process_query] : []
                    content {
                      aggregator        = process_query.value.aggregator
                      cross_org_uuids   = process_query.value.cross_org_uuids
                      data_source       = process_query.value.data_source
                      is_normalized_cpu = process_query.value.is_normalized_cpu
                      limit             = process_query.value.limit
                      metric            = process_query.value.metric
                      name              = process_query.value.name
                      sort              = process_query.value.sort
                      tag_filters       = process_query.value.tag_filters
                      text_filter       = process_query.value.text_filter
                    }
                  }
                  dynamic "slo_query" {
                    for_each = query.value.slo_query != null ? [query.value.slo_query] : []
                    content {
                      additional_query_filters = slo_query.value.additional_query_filters
                      cross_org_uuids          = slo_query.value.cross_org_uuids
                      data_source              = slo_query.value.data_source
                      group_mode               = slo_query.value.group_mode
                      measure                  = slo_query.value.measure
                      name                     = slo_query.value.name
                      slo_id                   = slo_query.value.slo_id
                      slo_query_type           = slo_query.value.slo_query_type
                    }
                  }
                }
              }
              dynamic "rum_query" {
                for_each = request.value.rum_query != null ? [request.value.rum_query] : []
                content {
                  dynamic "compute_query" {
                    for_each = rum_query.value.compute_query != null ? [rum_query.value.compute_query] : []
                    content {
                      aggregation = compute_query.value.aggregation
                      facet       = compute_query.value.facet
                      interval    = compute_query.value.interval
                    }
                  }
                  dynamic "group_by" {
                    for_each = rum_query.value.group_by != null ? rum_query.value.group_by : []
                    content {
                      facet = group_by.value.facet
                      limit = group_by.value.limit
                      dynamic "sort_query" {
                        for_each = group_by.value.sort_query != null ? [group_by.value.sort_query] : []
                        content {
                          aggregation = sort_query.value.aggregation
                          facet       = sort_query.value.facet
                          order       = sort_query.value.order
                        }
                      }
                    }
                  }
                  index = rum_query.value.index
                  dynamic "multi_compute" {
                    for_each = rum_query.value.multi_compute != null ? rum_query.value.multi_compute : []
                    content {
                      aggregation = multi_compute.value.aggregation
                      facet       = multi_compute.value.facet
                      interval    = multi_compute.value.interval
                    }
                  }
                  search_query = rum_query.value.search_query
                }
              }
              dynamic "security_query" {
                for_each = request.value.security_query != null ? [request.value.security_query] : []
                content {
                  dynamic "compute_query" {
                    for_each = security_query.value.compute_query != null ? [security_query.value.compute_query] : []
                    content {
                      aggregation = compute_query.value.aggregation
                      facet       = compute_query.value.facet
                      interval    = compute_query.value.interval
                    }
                  }
                  dynamic "group_by" {
                    for_each = security_query.value.group_by != null ? security_query.value.group_by : []
                    content {
                      facet = group_by.value.facet
                      limit = group_by.value.limit
                      dynamic "sort_query" {
                        for_each = group_by.value.sort_query != null ? [group_by.value.sort_query] : []
                        content {
                          aggregation = sort_query.value.aggregation
                          facet       = sort_query.value.facet
                          order       = sort_query.value.order
                        }
                      }
                    }
                  }
                  index = security_query.value.index
                  dynamic "multi_compute" {
                    for_each = security_query.value.multi_compute != null ? security_query.value.multi_compute : []
                    content {
                      aggregation = multi_compute.value.aggregation
                      facet       = multi_compute.value.facet
                      interval    = multi_compute.value.interval
                    }
                  }
                  search_query = security_query.value.search_query
                }
              }
              show_present = request.value.show_present
            }
          }
          title       = change_definition.value.title
          title_align = change_definition.value.title_align
          title_size  = change_definition.value.title_size
        }
      }
      dynamic "check_status_definition" {
        for_each = widget.value.check_status_definition != null ? [widget.value.check_status_definition] : []
        content {
          check                     = check_status_definition.value.check
          group                     = check_status_definition.value.group
          group_by                  = check_status_definition.value.group_by
          grouping                  = check_status_definition.value.grouping
          hide_incomplete_cost_data = check_status_definition.value.hide_incomplete_cost_data
          live_span                 = check_status_definition.value.live_span
          tags                      = check_status_definition.value.tags
          title                     = check_status_definition.value.title
          title_align               = check_status_definition.value.title_align
          title_size                = check_status_definition.value.title_size
        }
      }
      dynamic "distribution_definition" {
        for_each = widget.value.distribution_definition != null ? [widget.value.distribution_definition] : []
        content {
          description               = distribution_definition.value.description
          hide_incomplete_cost_data = distribution_definition.value.hide_incomplete_cost_data
          legend_size               = distribution_definition.value.legend_size
          live_span                 = distribution_definition.value.live_span
          dynamic "request" {
            for_each = distribution_definition.value.request != null ? distribution_definition.value.request : []
            content {
              dynamic "apm_query" {
                for_each = request.value.apm_query != null ? [request.value.apm_query] : []
                content {
                  dynamic "compute_query" {
                    for_each = apm_query.value.compute_query != null ? [apm_query.value.compute_query] : []
                    content {
                      aggregation = compute_query.value.aggregation
                      facet       = compute_query.value.facet
                      interval    = compute_query.value.interval
                    }
                  }
                  dynamic "group_by" {
                    for_each = apm_query.value.group_by != null ? apm_query.value.group_by : []
                    content {
                      facet = group_by.value.facet
                      limit = group_by.value.limit
                      dynamic "sort_query" {
                        for_each = group_by.value.sort_query != null ? [group_by.value.sort_query] : []
                        content {
                          aggregation = sort_query.value.aggregation
                          facet       = sort_query.value.facet
                          order       = sort_query.value.order
                        }
                      }
                    }
                  }
                  index = apm_query.value.index
                  dynamic "multi_compute" {
                    for_each = apm_query.value.multi_compute != null ? apm_query.value.multi_compute : []
                    content {
                      aggregation = multi_compute.value.aggregation
                      facet       = multi_compute.value.facet
                      interval    = multi_compute.value.interval
                    }
                  }
                  search_query = apm_query.value.search_query
                }
              }
              dynamic "apm_stats_query" {
                for_each = request.value.apm_stats_query != null ? [request.value.apm_stats_query] : []
                content {
                  dynamic "columns" {
                    for_each = apm_stats_query.value.columns != null ? apm_stats_query.value.columns : []
                    content {
                      alias             = columns.value.alias
                      cell_display_mode = columns.value.cell_display_mode
                      name              = columns.value.name
                      order             = columns.value.order
                    }
                  }
                  env         = apm_stats_query.value.env
                  name        = apm_stats_query.value.name
                  primary_tag = apm_stats_query.value.primary_tag
                  resource    = apm_stats_query.value.resource
                  row_type    = apm_stats_query.value.row_type
                  service     = apm_stats_query.value.service
                }
              }
              dynamic "log_query" {
                for_each = request.value.log_query != null ? [request.value.log_query] : []
                content {
                  dynamic "compute_query" {
                    for_each = log_query.value.compute_query != null ? [log_query.value.compute_query] : []
                    content {
                      aggregation = compute_query.value.aggregation
                      facet       = compute_query.value.facet
                      interval    = compute_query.value.interval
                    }
                  }
                  dynamic "group_by" {
                    for_each = log_query.value.group_by != null ? log_query.value.group_by : []
                    content {
                      facet = group_by.value.facet
                      limit = group_by.value.limit
                      dynamic "sort_query" {
                        for_each = group_by.value.sort_query != null ? [group_by.value.sort_query] : []
                        content {
                          aggregation = sort_query.value.aggregation
                          facet       = sort_query.value.facet
                          order       = sort_query.value.order
                        }
                      }
                    }
                  }
                  index = log_query.value.index
                  dynamic "multi_compute" {
                    for_each = log_query.value.multi_compute != null ? log_query.value.multi_compute : []
                    content {
                      aggregation = multi_compute.value.aggregation
                      facet       = multi_compute.value.facet
                      interval    = multi_compute.value.interval
                    }
                  }
                  search_query = log_query.value.search_query
                }
              }
              dynamic "process_query" {
                for_each = request.value.process_query != null ? [request.value.process_query] : []
                content {
                  filter_by = process_query.value.filter_by
                  limit     = process_query.value.limit
                  metric    = process_query.value.metric
                  search_by = process_query.value.search_by
                }
              }
              q = request.value.q
              dynamic "rum_query" {
                for_each = request.value.rum_query != null ? [request.value.rum_query] : []
                content {
                  dynamic "compute_query" {
                    for_each = rum_query.value.compute_query != null ? [rum_query.value.compute_query] : []
                    content {
                      aggregation = compute_query.value.aggregation
                      facet       = compute_query.value.facet
                      interval    = compute_query.value.interval
                    }
                  }
                  dynamic "group_by" {
                    for_each = rum_query.value.group_by != null ? rum_query.value.group_by : []
                    content {
                      facet = group_by.value.facet
                      limit = group_by.value.limit
                      dynamic "sort_query" {
                        for_each = group_by.value.sort_query != null ? [group_by.value.sort_query] : []
                        content {
                          aggregation = sort_query.value.aggregation
                          facet       = sort_query.value.facet
                          order       = sort_query.value.order
                        }
                      }
                    }
                  }
                  index = rum_query.value.index
                  dynamic "multi_compute" {
                    for_each = rum_query.value.multi_compute != null ? rum_query.value.multi_compute : []
                    content {
                      aggregation = multi_compute.value.aggregation
                      facet       = multi_compute.value.facet
                      interval    = multi_compute.value.interval
                    }
                  }
                  search_query = rum_query.value.search_query
                }
              }
              dynamic "security_query" {
                for_each = request.value.security_query != null ? [request.value.security_query] : []
                content {
                  dynamic "compute_query" {
                    for_each = security_query.value.compute_query != null ? [security_query.value.compute_query] : []
                    content {
                      aggregation = compute_query.value.aggregation
                      facet       = compute_query.value.facet
                      interval    = compute_query.value.interval
                    }
                  }
                  dynamic "group_by" {
                    for_each = security_query.value.group_by != null ? security_query.value.group_by : []
                    content {
                      facet = group_by.value.facet
                      limit = group_by.value.limit
                      dynamic "sort_query" {
                        for_each = group_by.value.sort_query != null ? [group_by.value.sort_query] : []
                        content {
                          aggregation = sort_query.value.aggregation
                          facet       = sort_query.value.facet
                          order       = sort_query.value.order
                        }
                      }
                    }
                  }
                  index = security_query.value.index
                  dynamic "multi_compute" {
                    for_each = security_query.value.multi_compute != null ? security_query.value.multi_compute : []
                    content {
                      aggregation = multi_compute.value.aggregation
                      facet       = multi_compute.value.facet
                      interval    = multi_compute.value.interval
                    }
                  }
                  search_query = security_query.value.search_query
                }
              }
              dynamic "style" {
                for_each = request.value.style != null ? [request.value.style] : []
                content {
                  palette = style.value.palette
                }
              }
            }
          }
          show_legend = distribution_definition.value.show_legend
          title       = distribution_definition.value.title
          title_align = distribution_definition.value.title_align
          title_size  = distribution_definition.value.title_size
          dynamic "xaxis" {
            for_each = distribution_definition.value.xaxis != null ? [distribution_definition.value.xaxis] : []
            content {
              include_zero = xaxis.value.include_zero
              max          = xaxis.value.max
              min          = xaxis.value.min
              scale        = xaxis.value.scale
            }
          }
          dynamic "yaxis" {
            for_each = distribution_definition.value.yaxis != null ? [distribution_definition.value.yaxis] : []
            content {
              include_zero = yaxis.value.include_zero
              label        = yaxis.value.label
              max          = yaxis.value.max
              min          = yaxis.value.min
              scale        = yaxis.value.scale
            }
          }
        }
      }
      dynamic "event_stream_definition" {
        for_each = widget.value.event_stream_definition != null ? [widget.value.event_stream_definition] : []
        content {
          description               = event_stream_definition.value.description
          event_size                = event_stream_definition.value.event_size
          hide_incomplete_cost_data = event_stream_definition.value.hide_incomplete_cost_data
          live_span                 = event_stream_definition.value.live_span
          query                     = event_stream_definition.value.query
          tags_execution            = event_stream_definition.value.tags_execution
          title                     = event_stream_definition.value.title
          title_align               = event_stream_definition.value.title_align
          title_size                = event_stream_definition.value.title_size
        }
      }
      dynamic "event_timeline_definition" {
        for_each = widget.value.event_timeline_definition != null ? [widget.value.event_timeline_definition] : []
        content {
          description               = event_timeline_definition.value.description
          hide_incomplete_cost_data = event_timeline_definition.value.hide_incomplete_cost_data
          live_span                 = event_timeline_definition.value.live_span
          query                     = event_timeline_definition.value.query
          tags_execution            = event_timeline_definition.value.tags_execution
          title                     = event_timeline_definition.value.title
          title_align               = event_timeline_definition.value.title_align
          title_size                = event_timeline_definition.value.title_size
        }
      }
      dynamic "free_text_definition" {
        for_each = widget.value.free_text_definition != null ? [widget.value.free_text_definition] : []
        content {
          color       = free_text_definition.value.color
          description = free_text_definition.value.description
          font_size   = free_text_definition.value.font_size
          text        = free_text_definition.value.text
          text_align  = free_text_definition.value.text_align
        }
      }
      dynamic "geomap_definition" {
        for_each = widget.value.geomap_definition != null ? [widget.value.geomap_definition] : []
        content {
          dynamic "custom_link" {
            for_each = geomap_definition.value.custom_link != null ? geomap_definition.value.custom_link : []
            content {
              is_hidden      = custom_link.value.is_hidden
              label          = custom_link.value.label
              link           = custom_link.value.link
              override_label = custom_link.value.override_label
            }
          }
          description               = geomap_definition.value.description
          hide_incomplete_cost_data = geomap_definition.value.hide_incomplete_cost_data
          live_span                 = geomap_definition.value.live_span
          dynamic "request" {
            for_each = geomap_definition.value.request != null ? geomap_definition.value.request : []
            content {
              dynamic "formula" {
                for_each = request.value.formula != null ? request.value.formula : []
                content {
                  alias             = formula.value.alias
                  cell_display_mode = formula.value.cell_display_mode
                  dynamic "conditional_formats" {
                    for_each = formula.value.conditional_formats != null ? formula.value.conditional_formats : []
                    content {
                      comparator      = conditional_formats.value.comparator
                      custom_bg_color = conditional_formats.value.custom_bg_color
                      custom_fg_color = conditional_formats.value.custom_fg_color
                      hide_value      = conditional_formats.value.hide_value
                      image_url       = conditional_formats.value.image_url
                      metric          = conditional_formats.value.metric
                      palette         = conditional_formats.value.palette
                      timeframe       = conditional_formats.value.timeframe
                      value           = conditional_formats.value.value
                    }
                  }
                  formula_expression = formula.value.formula_expression
                  dynamic "limit" {
                    for_each = formula.value.limit != null ? [formula.value.limit] : []
                    content {
                      count = limit.value.count
                      order = limit.value.order
                    }
                  }
                  dynamic "number_format" {
                    for_each = formula.value.number_format != null ? [formula.value.number_format] : []
                    content {
                      unit {
                        dynamic "canonical" {
                          for_each = number_format.value.unit.canonical != null ? [number_format.value.unit.canonical] : []
                          content {
                            per_unit_name = canonical.value.per_unit_name
                            unit_name     = canonical.value.unit_name
                          }
                        }
                        dynamic "custom" {
                          for_each = number_format.value.unit.custom != null ? [number_format.value.unit.custom] : []
                          content {
                            label = custom.value.label
                          }
                        }
                      }
                      dynamic "unit_scale" {
                        for_each = number_format.value.unit_scale != null ? [number_format.value.unit_scale] : []
                        content {
                          unit_name = unit_scale.value.unit_name
                        }
                      }
                    }
                  }
                  dynamic "style" {
                    for_each = formula.value.style != null ? [formula.value.style] : []
                    content {
                      palette       = style.value.palette
                      palette_index = style.value.palette_index
                    }
                  }
                }
              }
              dynamic "log_query" {
                for_each = request.value.log_query != null ? [request.value.log_query] : []
                content {
                  dynamic "compute_query" {
                    for_each = log_query.value.compute_query != null ? [log_query.value.compute_query] : []
                    content {
                      aggregation = compute_query.value.aggregation
                      facet       = compute_query.value.facet
                      interval    = compute_query.value.interval
                    }
                  }
                  dynamic "group_by" {
                    for_each = log_query.value.group_by != null ? log_query.value.group_by : []
                    content {
                      facet = group_by.value.facet
                      limit = group_by.value.limit
                      dynamic "sort_query" {
                        for_each = group_by.value.sort_query != null ? [group_by.value.sort_query] : []
                        content {
                          aggregation = sort_query.value.aggregation
                          facet       = sort_query.value.facet
                          order       = sort_query.value.order
                        }
                      }
                    }
                  }
                  index = log_query.value.index
                  dynamic "multi_compute" {
                    for_each = log_query.value.multi_compute != null ? log_query.value.multi_compute : []
                    content {
                      aggregation = multi_compute.value.aggregation
                      facet       = multi_compute.value.facet
                      interval    = multi_compute.value.interval
                    }
                  }
                  search_query = log_query.value.search_query
                }
              }
              q = request.value.q
              dynamic "query" {
                for_each = request.value.query != null ? request.value.query : []
                content {
                  dynamic "apm_dependency_stats_query" {
                    for_each = query.value.apm_dependency_stats_query != null ? [query.value.apm_dependency_stats_query] : []
                    content {
                      cross_org_uuids   = apm_dependency_stats_query.value.cross_org_uuids
                      data_source       = apm_dependency_stats_query.value.data_source
                      env               = apm_dependency_stats_query.value.env
                      is_upstream       = apm_dependency_stats_query.value.is_upstream
                      name              = apm_dependency_stats_query.value.name
                      operation_name    = apm_dependency_stats_query.value.operation_name
                      primary_tag_name  = apm_dependency_stats_query.value.primary_tag_name
                      primary_tag_value = apm_dependency_stats_query.value.primary_tag_value
                      resource_name     = apm_dependency_stats_query.value.resource_name
                      service           = apm_dependency_stats_query.value.service
                      stat              = apm_dependency_stats_query.value.stat
                    }
                  }
                  dynamic "apm_resource_stats_query" {
                    for_each = query.value.apm_resource_stats_query != null ? [query.value.apm_resource_stats_query] : []
                    content {
                      cross_org_uuids   = apm_resource_stats_query.value.cross_org_uuids
                      data_source       = apm_resource_stats_query.value.data_source
                      env               = apm_resource_stats_query.value.env
                      group_by          = apm_resource_stats_query.value.group_by
                      name              = apm_resource_stats_query.value.name
                      operation_name    = apm_resource_stats_query.value.operation_name
                      primary_tag_name  = apm_resource_stats_query.value.primary_tag_name
                      primary_tag_value = apm_resource_stats_query.value.primary_tag_value
                      resource_name     = apm_resource_stats_query.value.resource_name
                      service           = apm_resource_stats_query.value.service
                      stat              = apm_resource_stats_query.value.stat
                    }
                  }
                  dynamic "cloud_cost_query" {
                    for_each = query.value.cloud_cost_query != null ? [query.value.cloud_cost_query] : []
                    content {
                      aggregator      = cloud_cost_query.value.aggregator
                      cross_org_uuids = cloud_cost_query.value.cross_org_uuids
                      data_source     = cloud_cost_query.value.data_source
                      name            = cloud_cost_query.value.name
                      query           = cloud_cost_query.value.query
                    }
                  }
                  dynamic "event_query" {
                    for_each = query.value.event_query != null ? [query.value.event_query] : []
                    content {
                      dynamic "compute" {
                        for_each = event_query.value.compute
                        content {
                          aggregation = compute.value.aggregation
                          interval    = compute.value.interval
                          metric      = compute.value.metric
                        }
                      }
                      cross_org_uuids = event_query.value.cross_org_uuids
                      data_source     = event_query.value.data_source
                      dynamic "group_by" {
                        for_each = event_query.value.group_by != null ? event_query.value.group_by : []
                        content {
                          facet = group_by.value.facet
                          limit = group_by.value.limit
                          dynamic "sort" {
                            for_each = group_by.value.sort != null ? [group_by.value.sort] : []
                            content {
                              aggregation = sort.value.aggregation
                              metric      = sort.value.metric
                              order       = sort.value.order
                            }
                          }
                        }
                      }
                      dynamic "group_by_fields" {
                        for_each = event_query.value.group_by_fields != null ? [event_query.value.group_by_fields] : []
                        content {
                          fields = group_by_fields.value.fields
                          limit  = group_by_fields.value.limit
                          dynamic "sort" {
                            for_each = group_by_fields.value.sort != null ? [group_by_fields.value.sort] : []
                            content {
                              aggregation = sort.value.aggregation
                              metric      = sort.value.metric
                              order       = sort.value.order
                            }
                          }
                        }
                      }
                      indexes = event_query.value.indexes
                      name    = event_query.value.name
                      dynamic "search" {
                        for_each = event_query.value.search != null ? [event_query.value.search] : []
                        content {
                          query = search.value.query
                        }
                      }
                      storage = event_query.value.storage
                    }
                  }
                  dynamic "metric_query" {
                    for_each = query.value.metric_query != null ? [query.value.metric_query] : []
                    content {
                      aggregator      = metric_query.value.aggregator
                      cross_org_uuids = metric_query.value.cross_org_uuids
                      data_source     = metric_query.value.data_source
                      name            = metric_query.value.name
                      query           = metric_query.value.query
                      semantic_mode   = metric_query.value.semantic_mode
                    }
                  }
                  dynamic "process_query" {
                    for_each = query.value.process_query != null ? [query.value.process_query] : []
                    content {
                      aggregator        = process_query.value.aggregator
                      cross_org_uuids   = process_query.value.cross_org_uuids
                      data_source       = process_query.value.data_source
                      is_normalized_cpu = process_query.value.is_normalized_cpu
                      limit             = process_query.value.limit
                      metric            = process_query.value.metric
                      name              = process_query.value.name
                      sort              = process_query.value.sort
                      tag_filters       = process_query.value.tag_filters
                      text_filter       = process_query.value.text_filter
                    }
                  }
                  dynamic "slo_query" {
                    for_each = query.value.slo_query != null ? [query.value.slo_query] : []
                    content {
                      additional_query_filters = slo_query.value.additional_query_filters
                      cross_org_uuids          = slo_query.value.cross_org_uuids
                      data_source              = slo_query.value.data_source
                      group_mode               = slo_query.value.group_mode
                      measure                  = slo_query.value.measure
                      name                     = slo_query.value.name
                      slo_id                   = slo_query.value.slo_id
                      slo_query_type           = slo_query.value.slo_query_type
                    }
                  }
                }
              }
              dynamic "rum_query" {
                for_each = request.value.rum_query != null ? [request.value.rum_query] : []
                content {
                  dynamic "compute_query" {
                    for_each = rum_query.value.compute_query != null ? [rum_query.value.compute_query] : []
                    content {
                      aggregation = compute_query.value.aggregation
                      facet       = compute_query.value.facet
                      interval    = compute_query.value.interval
                    }
                  }
                  dynamic "group_by" {
                    for_each = rum_query.value.group_by != null ? rum_query.value.group_by : []
                    content {
                      facet = group_by.value.facet
                      limit = group_by.value.limit
                      dynamic "sort_query" {
                        for_each = group_by.value.sort_query != null ? [group_by.value.sort_query] : []
                        content {
                          aggregation = sort_query.value.aggregation
                          facet       = sort_query.value.facet
                          order       = sort_query.value.order
                        }
                      }
                    }
                  }
                  index = rum_query.value.index
                  dynamic "multi_compute" {
                    for_each = rum_query.value.multi_compute != null ? rum_query.value.multi_compute : []
                    content {
                      aggregation = multi_compute.value.aggregation
                      facet       = multi_compute.value.facet
                      interval    = multi_compute.value.interval
                    }
                  }
                  search_query = rum_query.value.search_query
                }
              }
            }
          }
          dynamic "style" {
            for_each = geomap_definition.value.style != null ? [geomap_definition.value.style] : []
            content {
              palette      = style.value.palette
              palette_flip = style.value.palette_flip
            }
          }
          title       = geomap_definition.value.title
          title_align = geomap_definition.value.title_align
          title_size  = geomap_definition.value.title_size
          view {
            focus = geomap_definition.value.view.focus
          }
        }
      }
      dynamic "heatmap_definition" {
        for_each = widget.value.heatmap_definition != null ? [widget.value.heatmap_definition] : []
        content {
          dynamic "custom_link" {
            for_each = heatmap_definition.value.custom_link != null ? heatmap_definition.value.custom_link : []
            content {
              is_hidden      = custom_link.value.is_hidden
              label          = custom_link.value.label
              link           = custom_link.value.link
              override_label = custom_link.value.override_label
            }
          }
          description = heatmap_definition.value.description
          dynamic "event" {
            for_each = heatmap_definition.value.event != null ? heatmap_definition.value.event : []
            content {
              q              = event.value.q
              tags_execution = event.value.tags_execution
            }
          }
          hide_incomplete_cost_data = heatmap_definition.value.hide_incomplete_cost_data
          legend_size               = heatmap_definition.value.legend_size
          live_span                 = heatmap_definition.value.live_span
          dynamic "request" {
            for_each = heatmap_definition.value.request != null ? heatmap_definition.value.request : []
            content {
              dynamic "apm_query" {
                for_each = request.value.apm_query != null ? [request.value.apm_query] : []
                content {
                  dynamic "compute_query" {
                    for_each = apm_query.value.compute_query != null ? [apm_query.value.compute_query] : []
                    content {
                      aggregation = compute_query.value.aggregation
                      facet       = compute_query.value.facet
                      interval    = compute_query.value.interval
                    }
                  }
                  dynamic "group_by" {
                    for_each = apm_query.value.group_by != null ? apm_query.value.group_by : []
                    content {
                      facet = group_by.value.facet
                      limit = group_by.value.limit
                      dynamic "sort_query" {
                        for_each = group_by.value.sort_query != null ? [group_by.value.sort_query] : []
                        content {
                          aggregation = sort_query.value.aggregation
                          facet       = sort_query.value.facet
                          order       = sort_query.value.order
                        }
                      }
                    }
                  }
                  index = apm_query.value.index
                  dynamic "multi_compute" {
                    for_each = apm_query.value.multi_compute != null ? apm_query.value.multi_compute : []
                    content {
                      aggregation = multi_compute.value.aggregation
                      facet       = multi_compute.value.facet
                      interval    = multi_compute.value.interval
                    }
                  }
                  search_query = apm_query.value.search_query
                }
              }
              dynamic "formula" {
                for_each = request.value.formula != null ? request.value.formula : []
                content {
                  alias             = formula.value.alias
                  cell_display_mode = formula.value.cell_display_mode
                  dynamic "conditional_formats" {
                    for_each = formula.value.conditional_formats != null ? formula.value.conditional_formats : []
                    content {
                      comparator      = conditional_formats.value.comparator
                      custom_bg_color = conditional_formats.value.custom_bg_color
                      custom_fg_color = conditional_formats.value.custom_fg_color
                      hide_value      = conditional_formats.value.hide_value
                      image_url       = conditional_formats.value.image_url
                      metric          = conditional_formats.value.metric
                      palette         = conditional_formats.value.palette
                      timeframe       = conditional_formats.value.timeframe
                      value           = conditional_formats.value.value
                    }
                  }
                  formula_expression = formula.value.formula_expression
                  dynamic "limit" {
                    for_each = formula.value.limit != null ? [formula.value.limit] : []
                    content {
                      count = limit.value.count
                      order = limit.value.order
                    }
                  }
                  dynamic "number_format" {
                    for_each = formula.value.number_format != null ? [formula.value.number_format] : []
                    content {
                      unit {
                        dynamic "canonical" {
                          for_each = number_format.value.unit.canonical != null ? [number_format.value.unit.canonical] : []
                          content {
                            per_unit_name = canonical.value.per_unit_name
                            unit_name     = canonical.value.unit_name
                          }
                        }
                        dynamic "custom" {
                          for_each = number_format.value.unit.custom != null ? [number_format.value.unit.custom] : []
                          content {
                            label = custom.value.label
                          }
                        }
                      }
                      dynamic "unit_scale" {
                        for_each = number_format.value.unit_scale != null ? [number_format.value.unit_scale] : []
                        content {
                          unit_name = unit_scale.value.unit_name
                        }
                      }
                    }
                  }
                  dynamic "style" {
                    for_each = formula.value.style != null ? [formula.value.style] : []
                    content {
                      palette       = style.value.palette
                      palette_index = style.value.palette_index
                    }
                  }
                }
              }
              dynamic "log_query" {
                for_each = request.value.log_query != null ? [request.value.log_query] : []
                content {
                  dynamic "compute_query" {
                    for_each = log_query.value.compute_query != null ? [log_query.value.compute_query] : []
                    content {
                      aggregation = compute_query.value.aggregation
                      facet       = compute_query.value.facet
                      interval    = compute_query.value.interval
                    }
                  }
                  dynamic "group_by" {
                    for_each = log_query.value.group_by != null ? log_query.value.group_by : []
                    content {
                      facet = group_by.value.facet
                      limit = group_by.value.limit
                      dynamic "sort_query" {
                        for_each = group_by.value.sort_query != null ? [group_by.value.sort_query] : []
                        content {
                          aggregation = sort_query.value.aggregation
                          facet       = sort_query.value.facet
                          order       = sort_query.value.order
                        }
                      }
                    }
                  }
                  index = log_query.value.index
                  dynamic "multi_compute" {
                    for_each = log_query.value.multi_compute != null ? log_query.value.multi_compute : []
                    content {
                      aggregation = multi_compute.value.aggregation
                      facet       = multi_compute.value.facet
                      interval    = multi_compute.value.interval
                    }
                  }
                  search_query = log_query.value.search_query
                }
              }
              dynamic "process_query" {
                for_each = request.value.process_query != null ? [request.value.process_query] : []
                content {
                  filter_by = process_query.value.filter_by
                  limit     = process_query.value.limit
                  metric    = process_query.value.metric
                  search_by = process_query.value.search_by
                }
              }
              q = request.value.q
              dynamic "query" {
                for_each = request.value.query != null ? request.value.query : []
                content {
                  dynamic "apm_dependency_stats_query" {
                    for_each = query.value.apm_dependency_stats_query != null ? [query.value.apm_dependency_stats_query] : []
                    content {
                      cross_org_uuids   = apm_dependency_stats_query.value.cross_org_uuids
                      data_source       = apm_dependency_stats_query.value.data_source
                      env               = apm_dependency_stats_query.value.env
                      is_upstream       = apm_dependency_stats_query.value.is_upstream
                      name              = apm_dependency_stats_query.value.name
                      operation_name    = apm_dependency_stats_query.value.operation_name
                      primary_tag_name  = apm_dependency_stats_query.value.primary_tag_name
                      primary_tag_value = apm_dependency_stats_query.value.primary_tag_value
                      resource_name     = apm_dependency_stats_query.value.resource_name
                      service           = apm_dependency_stats_query.value.service
                      stat              = apm_dependency_stats_query.value.stat
                    }
                  }
                  dynamic "apm_resource_stats_query" {
                    for_each = query.value.apm_resource_stats_query != null ? [query.value.apm_resource_stats_query] : []
                    content {
                      cross_org_uuids   = apm_resource_stats_query.value.cross_org_uuids
                      data_source       = apm_resource_stats_query.value.data_source
                      env               = apm_resource_stats_query.value.env
                      group_by          = apm_resource_stats_query.value.group_by
                      name              = apm_resource_stats_query.value.name
                      operation_name    = apm_resource_stats_query.value.operation_name
                      primary_tag_name  = apm_resource_stats_query.value.primary_tag_name
                      primary_tag_value = apm_resource_stats_query.value.primary_tag_value
                      resource_name     = apm_resource_stats_query.value.resource_name
                      service           = apm_resource_stats_query.value.service
                      stat              = apm_resource_stats_query.value.stat
                    }
                  }
                  dynamic "cloud_cost_query" {
                    for_each = query.value.cloud_cost_query != null ? [query.value.cloud_cost_query] : []
                    content {
                      aggregator      = cloud_cost_query.value.aggregator
                      cross_org_uuids = cloud_cost_query.value.cross_org_uuids
                      data_source     = cloud_cost_query.value.data_source
                      name            = cloud_cost_query.value.name
                      query           = cloud_cost_query.value.query
                    }
                  }
                  dynamic "event_query" {
                    for_each = query.value.event_query != null ? [query.value.event_query] : []
                    content {
                      dynamic "compute" {
                        for_each = event_query.value.compute
                        content {
                          aggregation = compute.value.aggregation
                          interval    = compute.value.interval
                          metric      = compute.value.metric
                        }
                      }
                      cross_org_uuids = event_query.value.cross_org_uuids
                      data_source     = event_query.value.data_source
                      dynamic "group_by" {
                        for_each = event_query.value.group_by != null ? event_query.value.group_by : []
                        content {
                          facet = group_by.value.facet
                          limit = group_by.value.limit
                          dynamic "sort" {
                            for_each = group_by.value.sort != null ? [group_by.value.sort] : []
                            content {
                              aggregation = sort.value.aggregation
                              metric      = sort.value.metric
                              order       = sort.value.order
                            }
                          }
                        }
                      }
                      dynamic "group_by_fields" {
                        for_each = event_query.value.group_by_fields != null ? [event_query.value.group_by_fields] : []
                        content {
                          fields = group_by_fields.value.fields
                          limit  = group_by_fields.value.limit
                          dynamic "sort" {
                            for_each = group_by_fields.value.sort != null ? [group_by_fields.value.sort] : []
                            content {
                              aggregation = sort.value.aggregation
                              metric      = sort.value.metric
                              order       = sort.value.order
                            }
                          }
                        }
                      }
                      indexes = event_query.value.indexes
                      name    = event_query.value.name
                      dynamic "search" {
                        for_each = event_query.value.search != null ? [event_query.value.search] : []
                        content {
                          query = search.value.query
                        }
                      }
                      storage = event_query.value.storage
                    }
                  }
                  dynamic "metric_query" {
                    for_each = query.value.metric_query != null ? [query.value.metric_query] : []
                    content {
                      aggregator      = metric_query.value.aggregator
                      cross_org_uuids = metric_query.value.cross_org_uuids
                      data_source     = metric_query.value.data_source
                      name            = metric_query.value.name
                      query           = metric_query.value.query
                      semantic_mode   = metric_query.value.semantic_mode
                    }
                  }
                  dynamic "process_query" {
                    for_each = query.value.process_query != null ? [query.value.process_query] : []
                    content {
                      aggregator        = process_query.value.aggregator
                      cross_org_uuids   = process_query.value.cross_org_uuids
                      data_source       = process_query.value.data_source
                      is_normalized_cpu = process_query.value.is_normalized_cpu
                      limit             = process_query.value.limit
                      metric            = process_query.value.metric
                      name              = process_query.value.name
                      sort              = process_query.value.sort
                      tag_filters       = process_query.value.tag_filters
                      text_filter       = process_query.value.text_filter
                    }
                  }
                  dynamic "slo_query" {
                    for_each = query.value.slo_query != null ? [query.value.slo_query] : []
                    content {
                      additional_query_filters = slo_query.value.additional_query_filters
                      cross_org_uuids          = slo_query.value.cross_org_uuids
                      data_source              = slo_query.value.data_source
                      group_mode               = slo_query.value.group_mode
                      measure                  = slo_query.value.measure
                      name                     = slo_query.value.name
                      slo_id                   = slo_query.value.slo_id
                      slo_query_type           = slo_query.value.slo_query_type
                    }
                  }
                }
              }
              dynamic "rum_query" {
                for_each = request.value.rum_query != null ? [request.value.rum_query] : []
                content {
                  dynamic "compute_query" {
                    for_each = rum_query.value.compute_query != null ? [rum_query.value.compute_query] : []
                    content {
                      aggregation = compute_query.value.aggregation
                      facet       = compute_query.value.facet
                      interval    = compute_query.value.interval
                    }
                  }
                  dynamic "group_by" {
                    for_each = rum_query.value.group_by != null ? rum_query.value.group_by : []
                    content {
                      facet = group_by.value.facet
                      limit = group_by.value.limit
                      dynamic "sort_query" {
                        for_each = group_by.value.sort_query != null ? [group_by.value.sort_query] : []
                        content {
                          aggregation = sort_query.value.aggregation
                          facet       = sort_query.value.facet
                          order       = sort_query.value.order
                        }
                      }
                    }
                  }
                  index = rum_query.value.index
                  dynamic "multi_compute" {
                    for_each = rum_query.value.multi_compute != null ? rum_query.value.multi_compute : []
                    content {
                      aggregation = multi_compute.value.aggregation
                      facet       = multi_compute.value.facet
                      interval    = multi_compute.value.interval
                    }
                  }
                  search_query = rum_query.value.search_query
                }
              }
              dynamic "security_query" {
                for_each = request.value.security_query != null ? [request.value.security_query] : []
                content {
                  dynamic "compute_query" {
                    for_each = security_query.value.compute_query != null ? [security_query.value.compute_query] : []
                    content {
                      aggregation = compute_query.value.aggregation
                      facet       = compute_query.value.facet
                      interval    = compute_query.value.interval
                    }
                  }
                  dynamic "group_by" {
                    for_each = security_query.value.group_by != null ? security_query.value.group_by : []
                    content {
                      facet = group_by.value.facet
                      limit = group_by.value.limit
                      dynamic "sort_query" {
                        for_each = group_by.value.sort_query != null ? [group_by.value.sort_query] : []
                        content {
                          aggregation = sort_query.value.aggregation
                          facet       = sort_query.value.facet
                          order       = sort_query.value.order
                        }
                      }
                    }
                  }
                  index = security_query.value.index
                  dynamic "multi_compute" {
                    for_each = security_query.value.multi_compute != null ? security_query.value.multi_compute : []
                    content {
                      aggregation = multi_compute.value.aggregation
                      facet       = multi_compute.value.facet
                      interval    = multi_compute.value.interval
                    }
                  }
                  search_query = security_query.value.search_query
                }
              }
              dynamic "style" {
                for_each = request.value.style != null ? [request.value.style] : []
                content {
                  palette = style.value.palette
                }
              }
            }
          }
          show_legend = heatmap_definition.value.show_legend
          title       = heatmap_definition.value.title
          title_align = heatmap_definition.value.title_align
          title_size  = heatmap_definition.value.title_size
          dynamic "yaxis" {
            for_each = heatmap_definition.value.yaxis != null ? [heatmap_definition.value.yaxis] : []
            content {
              include_zero = yaxis.value.include_zero
              label        = yaxis.value.label
              max          = yaxis.value.max
              min          = yaxis.value.min
              scale        = yaxis.value.scale
            }
          }
        }
      }
      dynamic "hostmap_definition" {
        for_each = widget.value.hostmap_definition != null ? [widget.value.hostmap_definition] : []
        content {
          dynamic "custom_link" {
            for_each = hostmap_definition.value.custom_link != null ? hostmap_definition.value.custom_link : []
            content {
              is_hidden      = custom_link.value.is_hidden
              label          = custom_link.value.label
              link           = custom_link.value.link
              override_label = custom_link.value.override_label
            }
          }
          description     = hostmap_definition.value.description
          group           = hostmap_definition.value.group
          no_group_hosts  = hostmap_definition.value.no_group_hosts
          no_metric_hosts = hostmap_definition.value.no_metric_hosts
          node_type       = hostmap_definition.value.node_type
          dynamic "request" {
            for_each = hostmap_definition.value.request != null ? [hostmap_definition.value.request] : []
            content {
              dynamic "fill" {
                for_each = request.value.fill != null ? request.value.fill : []
                content {
                  dynamic "apm_query" {
                    for_each = fill.value.apm_query != null ? [fill.value.apm_query] : []
                    content {
                      dynamic "compute_query" {
                        for_each = apm_query.value.compute_query != null ? [apm_query.value.compute_query] : []
                        content {
                          aggregation = compute_query.value.aggregation
                          facet       = compute_query.value.facet
                          interval    = compute_query.value.interval
                        }
                      }
                      dynamic "group_by" {
                        for_each = apm_query.value.group_by != null ? apm_query.value.group_by : []
                        content {
                          facet = group_by.value.facet
                          limit = group_by.value.limit
                          dynamic "sort_query" {
                            for_each = group_by.value.sort_query != null ? [group_by.value.sort_query] : []
                            content {
                              aggregation = sort_query.value.aggregation
                              facet       = sort_query.value.facet
                              order       = sort_query.value.order
                            }
                          }
                        }
                      }
                      index = apm_query.value.index
                      dynamic "multi_compute" {
                        for_each = apm_query.value.multi_compute != null ? apm_query.value.multi_compute : []
                        content {
                          aggregation = multi_compute.value.aggregation
                          facet       = multi_compute.value.facet
                          interval    = multi_compute.value.interval
                        }
                      }
                      search_query = apm_query.value.search_query
                    }
                  }
                  dynamic "log_query" {
                    for_each = fill.value.log_query != null ? [fill.value.log_query] : []
                    content {
                      dynamic "compute_query" {
                        for_each = log_query.value.compute_query != null ? [log_query.value.compute_query] : []
                        content {
                          aggregation = compute_query.value.aggregation
                          facet       = compute_query.value.facet
                          interval    = compute_query.value.interval
                        }
                      }
                      dynamic "group_by" {
                        for_each = log_query.value.group_by != null ? log_query.value.group_by : []
                        content {
                          facet = group_by.value.facet
                          limit = group_by.value.limit
                          dynamic "sort_query" {
                            for_each = group_by.value.sort_query != null ? [group_by.value.sort_query] : []
                            content {
                              aggregation = sort_query.value.aggregation
                              facet       = sort_query.value.facet
                              order       = sort_query.value.order
                            }
                          }
                        }
                      }
                      index = log_query.value.index
                      dynamic "multi_compute" {
                        for_each = log_query.value.multi_compute != null ? log_query.value.multi_compute : []
                        content {
                          aggregation = multi_compute.value.aggregation
                          facet       = multi_compute.value.facet
                          interval    = multi_compute.value.interval
                        }
                      }
                      search_query = log_query.value.search_query
                    }
                  }
                  dynamic "process_query" {
                    for_each = fill.value.process_query != null ? [fill.value.process_query] : []
                    content {
                      filter_by = process_query.value.filter_by
                      limit     = process_query.value.limit
                      metric    = process_query.value.metric
                      search_by = process_query.value.search_by
                    }
                  }
                  q = fill.value.q
                  dynamic "rum_query" {
                    for_each = fill.value.rum_query != null ? [fill.value.rum_query] : []
                    content {
                      dynamic "compute_query" {
                        for_each = rum_query.value.compute_query != null ? [rum_query.value.compute_query] : []
                        content {
                          aggregation = compute_query.value.aggregation
                          facet       = compute_query.value.facet
                          interval    = compute_query.value.interval
                        }
                      }
                      dynamic "group_by" {
                        for_each = rum_query.value.group_by != null ? rum_query.value.group_by : []
                        content {
                          facet = group_by.value.facet
                          limit = group_by.value.limit
                          dynamic "sort_query" {
                            for_each = group_by.value.sort_query != null ? [group_by.value.sort_query] : []
                            content {
                              aggregation = sort_query.value.aggregation
                              facet       = sort_query.value.facet
                              order       = sort_query.value.order
                            }
                          }
                        }
                      }
                      index = rum_query.value.index
                      dynamic "multi_compute" {
                        for_each = rum_query.value.multi_compute != null ? rum_query.value.multi_compute : []
                        content {
                          aggregation = multi_compute.value.aggregation
                          facet       = multi_compute.value.facet
                          interval    = multi_compute.value.interval
                        }
                      }
                      search_query = rum_query.value.search_query
                    }
                  }
                  dynamic "security_query" {
                    for_each = fill.value.security_query != null ? [fill.value.security_query] : []
                    content {
                      dynamic "compute_query" {
                        for_each = security_query.value.compute_query != null ? [security_query.value.compute_query] : []
                        content {
                          aggregation = compute_query.value.aggregation
                          facet       = compute_query.value.facet
                          interval    = compute_query.value.interval
                        }
                      }
                      dynamic "group_by" {
                        for_each = security_query.value.group_by != null ? security_query.value.group_by : []
                        content {
                          facet = group_by.value.facet
                          limit = group_by.value.limit
                          dynamic "sort_query" {
                            for_each = group_by.value.sort_query != null ? [group_by.value.sort_query] : []
                            content {
                              aggregation = sort_query.value.aggregation
                              facet       = sort_query.value.facet
                              order       = sort_query.value.order
                            }
                          }
                        }
                      }
                      index = security_query.value.index
                      dynamic "multi_compute" {
                        for_each = security_query.value.multi_compute != null ? security_query.value.multi_compute : []
                        content {
                          aggregation = multi_compute.value.aggregation
                          facet       = multi_compute.value.facet
                          interval    = multi_compute.value.interval
                        }
                      }
                      search_query = security_query.value.search_query
                    }
                  }
                }
              }
              dynamic "size" {
                for_each = request.value.size != null ? request.value.size : []
                content {
                  dynamic "apm_query" {
                    for_each = size.value.apm_query != null ? [size.value.apm_query] : []
                    content {
                      dynamic "compute_query" {
                        for_each = apm_query.value.compute_query != null ? [apm_query.value.compute_query] : []
                        content {
                          aggregation = compute_query.value.aggregation
                          facet       = compute_query.value.facet
                          interval    = compute_query.value.interval
                        }
                      }
                      dynamic "group_by" {
                        for_each = apm_query.value.group_by != null ? apm_query.value.group_by : []
                        content {
                          facet = group_by.value.facet
                          limit = group_by.value.limit
                          dynamic "sort_query" {
                            for_each = group_by.value.sort_query != null ? [group_by.value.sort_query] : []
                            content {
                              aggregation = sort_query.value.aggregation
                              facet       = sort_query.value.facet
                              order       = sort_query.value.order
                            }
                          }
                        }
                      }
                      index = apm_query.value.index
                      dynamic "multi_compute" {
                        for_each = apm_query.value.multi_compute != null ? apm_query.value.multi_compute : []
                        content {
                          aggregation = multi_compute.value.aggregation
                          facet       = multi_compute.value.facet
                          interval    = multi_compute.value.interval
                        }
                      }
                      search_query = apm_query.value.search_query
                    }
                  }
                  dynamic "log_query" {
                    for_each = size.value.log_query != null ? [size.value.log_query] : []
                    content {
                      dynamic "compute_query" {
                        for_each = log_query.value.compute_query != null ? [log_query.value.compute_query] : []
                        content {
                          aggregation = compute_query.value.aggregation
                          facet       = compute_query.value.facet
                          interval    = compute_query.value.interval
                        }
                      }
                      dynamic "group_by" {
                        for_each = log_query.value.group_by != null ? log_query.value.group_by : []
                        content {
                          facet = group_by.value.facet
                          limit = group_by.value.limit
                          dynamic "sort_query" {
                            for_each = group_by.value.sort_query != null ? [group_by.value.sort_query] : []
                            content {
                              aggregation = sort_query.value.aggregation
                              facet       = sort_query.value.facet
                              order       = sort_query.value.order
                            }
                          }
                        }
                      }
                      index = log_query.value.index
                      dynamic "multi_compute" {
                        for_each = log_query.value.multi_compute != null ? log_query.value.multi_compute : []
                        content {
                          aggregation = multi_compute.value.aggregation
                          facet       = multi_compute.value.facet
                          interval    = multi_compute.value.interval
                        }
                      }
                      search_query = log_query.value.search_query
                    }
                  }
                  dynamic "process_query" {
                    for_each = size.value.process_query != null ? [size.value.process_query] : []
                    content {
                      filter_by = process_query.value.filter_by
                      limit     = process_query.value.limit
                      metric    = process_query.value.metric
                      search_by = process_query.value.search_by
                    }
                  }
                  q = size.value.q
                  dynamic "rum_query" {
                    for_each = size.value.rum_query != null ? [size.value.rum_query] : []
                    content {
                      dynamic "compute_query" {
                        for_each = rum_query.value.compute_query != null ? [rum_query.value.compute_query] : []
                        content {
                          aggregation = compute_query.value.aggregation
                          facet       = compute_query.value.facet
                          interval    = compute_query.value.interval
                        }
                      }
                      dynamic "group_by" {
                        for_each = rum_query.value.group_by != null ? rum_query.value.group_by : []
                        content {
                          facet = group_by.value.facet
                          limit = group_by.value.limit
                          dynamic "sort_query" {
                            for_each = group_by.value.sort_query != null ? [group_by.value.sort_query] : []
                            content {
                              aggregation = sort_query.value.aggregation
                              facet       = sort_query.value.facet
                              order       = sort_query.value.order
                            }
                          }
                        }
                      }
                      index = rum_query.value.index
                      dynamic "multi_compute" {
                        for_each = rum_query.value.multi_compute != null ? rum_query.value.multi_compute : []
                        content {
                          aggregation = multi_compute.value.aggregation
                          facet       = multi_compute.value.facet
                          interval    = multi_compute.value.interval
                        }
                      }
                      search_query = rum_query.value.search_query
                    }
                  }
                  dynamic "security_query" {
                    for_each = size.value.security_query != null ? [size.value.security_query] : []
                    content {
                      dynamic "compute_query" {
                        for_each = security_query.value.compute_query != null ? [security_query.value.compute_query] : []
                        content {
                          aggregation = compute_query.value.aggregation
                          facet       = compute_query.value.facet
                          interval    = compute_query.value.interval
                        }
                      }
                      dynamic "group_by" {
                        for_each = security_query.value.group_by != null ? security_query.value.group_by : []
                        content {
                          facet = group_by.value.facet
                          limit = group_by.value.limit
                          dynamic "sort_query" {
                            for_each = group_by.value.sort_query != null ? [group_by.value.sort_query] : []
                            content {
                              aggregation = sort_query.value.aggregation
                              facet       = sort_query.value.facet
                              order       = sort_query.value.order
                            }
                          }
                        }
                      }
                      index = security_query.value.index
                      dynamic "multi_compute" {
                        for_each = security_query.value.multi_compute != null ? security_query.value.multi_compute : []
                        content {
                          aggregation = multi_compute.value.aggregation
                          facet       = multi_compute.value.facet
                          interval    = multi_compute.value.interval
                        }
                      }
                      search_query = security_query.value.search_query
                    }
                  }
                }
              }
            }
          }
          scope = hostmap_definition.value.scope
          dynamic "style" {
            for_each = hostmap_definition.value.style != null ? [hostmap_definition.value.style] : []
            content {
              fill_max     = style.value.fill_max
              fill_min     = style.value.fill_min
              palette      = style.value.palette
              palette_flip = style.value.palette_flip
            }
          }
          title       = hostmap_definition.value.title
          title_align = hostmap_definition.value.title_align
          title_size  = hostmap_definition.value.title_size
        }
      }
      dynamic "iframe_definition" {
        for_each = widget.value.iframe_definition != null ? [widget.value.iframe_definition] : []
        content {
          url = iframe_definition.value.url
        }
      }
      dynamic "image_definition" {
        for_each = widget.value.image_definition != null ? [widget.value.image_definition] : []
        content {
          has_background   = image_definition.value.has_background
          has_border       = image_definition.value.has_border
          horizontal_align = image_definition.value.horizontal_align
          margin           = image_definition.value.margin
          sizing           = image_definition.value.sizing
          url              = image_definition.value.url
          url_dark_theme   = image_definition.value.url_dark_theme
          vertical_align   = image_definition.value.vertical_align
        }
      }
      dynamic "list_stream_definition" {
        for_each = widget.value.list_stream_definition != null ? [widget.value.list_stream_definition] : []
        content {
          dynamic "request" {
            for_each = list_stream_definition.value.request
            content {
              dynamic "columns" {
                for_each = request.value.columns
                content {
                  field = columns.value.field
                  width = columns.value.width
                }
              }
              description = request.value.description
              query {
                clustering_pattern_field_path = request.value.query.clustering_pattern_field_path
                data_source                   = request.value.query.data_source
                event_size                    = request.value.query.event_size
                dynamic "group_by" {
                  for_each = request.value.query.group_by != null ? request.value.query.group_by : []
                  content {
                    facet = group_by.value.facet
                  }
                }
                indexes      = request.value.query.indexes
                query_string = request.value.query.query_string
                dynamic "sort" {
                  for_each = request.value.query.sort != null ? [request.value.query.sort] : []
                  content {
                    column      = sort.value.column
                    description = sort.value.description
                    order       = sort.value.order
                  }
                }
                storage = request.value.query.storage
              }
              response_format = request.value.response_format
            }
          }
          title       = list_stream_definition.value.title
          title_align = list_stream_definition.value.title_align
          title_size  = list_stream_definition.value.title_size
        }
      }
      dynamic "log_stream_definition" {
        for_each = widget.value.log_stream_definition != null ? [widget.value.log_stream_definition] : []
        content {
          columns                   = log_stream_definition.value.columns
          hide_incomplete_cost_data = log_stream_definition.value.hide_incomplete_cost_data
          indexes                   = log_stream_definition.value.indexes
          live_span                 = log_stream_definition.value.live_span
          message_display           = log_stream_definition.value.message_display
          query                     = log_stream_definition.value.query
          show_date_column          = log_stream_definition.value.show_date_column
          show_message_column       = log_stream_definition.value.show_message_column
          dynamic "sort" {
            for_each = log_stream_definition.value.sort != null ? [log_stream_definition.value.sort] : []
            content {
              column      = sort.value.column
              description = sort.value.description
              order       = sort.value.order
            }
          }
          title       = log_stream_definition.value.title
          title_align = log_stream_definition.value.title_align
          title_size  = log_stream_definition.value.title_size
        }
      }
      dynamic "manage_status_definition" {
        for_each = widget.value.manage_status_definition != null ? [widget.value.manage_status_definition] : []
        content {
          color_preference    = manage_status_definition.value.color_preference
          display_format      = manage_status_definition.value.display_format
          hide_zero_counts    = manage_status_definition.value.hide_zero_counts
          query               = manage_status_definition.value.query
          show_last_triggered = manage_status_definition.value.show_last_triggered
          show_priority       = manage_status_definition.value.show_priority
          sort                = manage_status_definition.value.sort
          summary_type        = manage_status_definition.value.summary_type
          title               = manage_status_definition.value.title
          title_align         = manage_status_definition.value.title_align
          title_size          = manage_status_definition.value.title_size
        }
      }
      dynamic "note_definition" {
        for_each = widget.value.note_definition != null ? [widget.value.note_definition] : []
        content {
          background_color = note_definition.value.background_color
          content          = note_definition.value.content
          description      = note_definition.value.description
          font_size        = note_definition.value.font_size
          has_padding      = note_definition.value.has_padding
          show_tick        = note_definition.value.show_tick
          text_align       = note_definition.value.text_align
          tick_edge        = note_definition.value.tick_edge
          tick_pos         = note_definition.value.tick_pos
          vertical_align   = note_definition.value.vertical_align
        }
      }
      dynamic "query_table_definition" {
        for_each = widget.value.query_table_definition != null ? [widget.value.query_table_definition] : []
        content {
          dynamic "custom_link" {
            for_each = query_table_definition.value.custom_link != null ? query_table_definition.value.custom_link : []
            content {
              is_hidden      = custom_link.value.is_hidden
              label          = custom_link.value.label
              link           = custom_link.value.link
              override_label = custom_link.value.override_label
            }
          }
          description               = query_table_definition.value.description
          has_search_bar            = query_table_definition.value.has_search_bar
          hide_incomplete_cost_data = query_table_definition.value.hide_incomplete_cost_data
          live_span                 = query_table_definition.value.live_span
          dynamic "request" {
            for_each = query_table_definition.value.request != null ? query_table_definition.value.request : []
            content {
              aggregator = request.value.aggregator
              alias      = request.value.alias
              dynamic "apm_query" {
                for_each = request.value.apm_query != null ? [request.value.apm_query] : []
                content {
                  dynamic "compute_query" {
                    for_each = apm_query.value.compute_query != null ? [apm_query.value.compute_query] : []
                    content {
                      aggregation = compute_query.value.aggregation
                      facet       = compute_query.value.facet
                      interval    = compute_query.value.interval
                    }
                  }
                  dynamic "group_by" {
                    for_each = apm_query.value.group_by != null ? apm_query.value.group_by : []
                    content {
                      facet = group_by.value.facet
                      limit = group_by.value.limit
                      dynamic "sort_query" {
                        for_each = group_by.value.sort_query != null ? [group_by.value.sort_query] : []
                        content {
                          aggregation = sort_query.value.aggregation
                          facet       = sort_query.value.facet
                          order       = sort_query.value.order
                        }
                      }
                    }
                  }
                  index = apm_query.value.index
                  dynamic "multi_compute" {
                    for_each = apm_query.value.multi_compute != null ? apm_query.value.multi_compute : []
                    content {
                      aggregation = multi_compute.value.aggregation
                      facet       = multi_compute.value.facet
                      interval    = multi_compute.value.interval
                    }
                  }
                  search_query = apm_query.value.search_query
                }
              }
              dynamic "apm_stats_query" {
                for_each = request.value.apm_stats_query != null ? [request.value.apm_stats_query] : []
                content {
                  dynamic "columns" {
                    for_each = apm_stats_query.value.columns != null ? apm_stats_query.value.columns : []
                    content {
                      alias             = columns.value.alias
                      cell_display_mode = columns.value.cell_display_mode
                      name              = columns.value.name
                      order             = columns.value.order
                    }
                  }
                  env         = apm_stats_query.value.env
                  name        = apm_stats_query.value.name
                  primary_tag = apm_stats_query.value.primary_tag
                  resource    = apm_stats_query.value.resource
                  row_type    = apm_stats_query.value.row_type
                  service     = apm_stats_query.value.service
                }
              }
              cell_display_mode = request.value.cell_display_mode
              dynamic "conditional_formats" {
                for_each = request.value.conditional_formats != null ? request.value.conditional_formats : []
                content {
                  comparator      = conditional_formats.value.comparator
                  custom_bg_color = conditional_formats.value.custom_bg_color
                  custom_fg_color = conditional_formats.value.custom_fg_color
                  hide_value      = conditional_formats.value.hide_value
                  image_url       = conditional_formats.value.image_url
                  metric          = conditional_formats.value.metric
                  palette         = conditional_formats.value.palette
                  timeframe       = conditional_formats.value.timeframe
                  value           = conditional_formats.value.value
                }
              }
              dynamic "formula" {
                for_each = request.value.formula != null ? request.value.formula : []
                content {
                  alias             = formula.value.alias
                  cell_display_mode = formula.value.cell_display_mode
                  dynamic "cell_display_mode_options" {
                    for_each = formula.value.cell_display_mode_options != null ? [formula.value.cell_display_mode_options] : []
                    content {
                      trend_type = cell_display_mode_options.value.trend_type
                      y_scale    = cell_display_mode_options.value.y_scale
                    }
                  }
                  dynamic "conditional_formats" {
                    for_each = formula.value.conditional_formats != null ? formula.value.conditional_formats : []
                    content {
                      comparator      = conditional_formats.value.comparator
                      custom_bg_color = conditional_formats.value.custom_bg_color
                      custom_fg_color = conditional_formats.value.custom_fg_color
                      hide_value      = conditional_formats.value.hide_value
                      image_url       = conditional_formats.value.image_url
                      metric          = conditional_formats.value.metric
                      palette         = conditional_formats.value.palette
                      timeframe       = conditional_formats.value.timeframe
                      value           = conditional_formats.value.value
                    }
                  }
                  formula_expression = formula.value.formula_expression
                  dynamic "limit" {
                    for_each = formula.value.limit != null ? [formula.value.limit] : []
                    content {
                      count = limit.value.count
                      order = limit.value.order
                    }
                  }
                  dynamic "number_format" {
                    for_each = formula.value.number_format != null ? [formula.value.number_format] : []
                    content {
                      unit {
                        dynamic "canonical" {
                          for_each = number_format.value.unit.canonical != null ? [number_format.value.unit.canonical] : []
                          content {
                            per_unit_name = canonical.value.per_unit_name
                            unit_name     = canonical.value.unit_name
                          }
                        }
                        dynamic "custom" {
                          for_each = number_format.value.unit.custom != null ? [number_format.value.unit.custom] : []
                          content {
                            label = custom.value.label
                          }
                        }
                      }
                      dynamic "unit_scale" {
                        for_each = number_format.value.unit_scale != null ? [number_format.value.unit_scale] : []
                        content {
                          unit_name = unit_scale.value.unit_name
                        }
                      }
                    }
                  }
                  dynamic "style" {
                    for_each = formula.value.style != null ? [formula.value.style] : []
                    content {
                      palette       = style.value.palette
                      palette_index = style.value.palette_index
                    }
                  }
                }
              }
              limit = request.value.limit
              dynamic "log_query" {
                for_each = request.value.log_query != null ? [request.value.log_query] : []
                content {
                  dynamic "compute_query" {
                    for_each = log_query.value.compute_query != null ? [log_query.value.compute_query] : []
                    content {
                      aggregation = compute_query.value.aggregation
                      facet       = compute_query.value.facet
                      interval    = compute_query.value.interval
                    }
                  }
                  dynamic "group_by" {
                    for_each = log_query.value.group_by != null ? log_query.value.group_by : []
                    content {
                      facet = group_by.value.facet
                      limit = group_by.value.limit
                      dynamic "sort_query" {
                        for_each = group_by.value.sort_query != null ? [group_by.value.sort_query] : []
                        content {
                          aggregation = sort_query.value.aggregation
                          facet       = sort_query.value.facet
                          order       = sort_query.value.order
                        }
                      }
                    }
                  }
                  index = log_query.value.index
                  dynamic "multi_compute" {
                    for_each = log_query.value.multi_compute != null ? log_query.value.multi_compute : []
                    content {
                      aggregation = multi_compute.value.aggregation
                      facet       = multi_compute.value.facet
                      interval    = multi_compute.value.interval
                    }
                  }
                  search_query = log_query.value.search_query
                }
              }
              order = request.value.order
              dynamic "process_query" {
                for_each = request.value.process_query != null ? [request.value.process_query] : []
                content {
                  filter_by = process_query.value.filter_by
                  limit     = process_query.value.limit
                  metric    = process_query.value.metric
                  search_by = process_query.value.search_by
                }
              }
              q = request.value.q
              dynamic "query" {
                for_each = request.value.query != null ? request.value.query : []
                content {
                  dynamic "apm_dependency_stats_query" {
                    for_each = query.value.apm_dependency_stats_query != null ? [query.value.apm_dependency_stats_query] : []
                    content {
                      cross_org_uuids   = apm_dependency_stats_query.value.cross_org_uuids
                      data_source       = apm_dependency_stats_query.value.data_source
                      env               = apm_dependency_stats_query.value.env
                      is_upstream       = apm_dependency_stats_query.value.is_upstream
                      name              = apm_dependency_stats_query.value.name
                      operation_name    = apm_dependency_stats_query.value.operation_name
                      primary_tag_name  = apm_dependency_stats_query.value.primary_tag_name
                      primary_tag_value = apm_dependency_stats_query.value.primary_tag_value
                      resource_name     = apm_dependency_stats_query.value.resource_name
                      service           = apm_dependency_stats_query.value.service
                      stat              = apm_dependency_stats_query.value.stat
                    }
                  }
                  dynamic "apm_resource_stats_query" {
                    for_each = query.value.apm_resource_stats_query != null ? [query.value.apm_resource_stats_query] : []
                    content {
                      cross_org_uuids   = apm_resource_stats_query.value.cross_org_uuids
                      data_source       = apm_resource_stats_query.value.data_source
                      env               = apm_resource_stats_query.value.env
                      group_by          = apm_resource_stats_query.value.group_by
                      name              = apm_resource_stats_query.value.name
                      operation_name    = apm_resource_stats_query.value.operation_name
                      primary_tag_name  = apm_resource_stats_query.value.primary_tag_name
                      primary_tag_value = apm_resource_stats_query.value.primary_tag_value
                      resource_name     = apm_resource_stats_query.value.resource_name
                      service           = apm_resource_stats_query.value.service
                      stat              = apm_resource_stats_query.value.stat
                    }
                  }
                  dynamic "cloud_cost_query" {
                    for_each = query.value.cloud_cost_query != null ? [query.value.cloud_cost_query] : []
                    content {
                      aggregator      = cloud_cost_query.value.aggregator
                      cross_org_uuids = cloud_cost_query.value.cross_org_uuids
                      data_source     = cloud_cost_query.value.data_source
                      name            = cloud_cost_query.value.name
                      query           = cloud_cost_query.value.query
                    }
                  }
                  dynamic "event_query" {
                    for_each = query.value.event_query != null ? [query.value.event_query] : []
                    content {
                      dynamic "compute" {
                        for_each = event_query.value.compute
                        content {
                          aggregation = compute.value.aggregation
                          interval    = compute.value.interval
                          metric      = compute.value.metric
                        }
                      }
                      cross_org_uuids = event_query.value.cross_org_uuids
                      data_source     = event_query.value.data_source
                      dynamic "group_by" {
                        for_each = event_query.value.group_by != null ? event_query.value.group_by : []
                        content {
                          facet = group_by.value.facet
                          limit = group_by.value.limit
                          dynamic "sort" {
                            for_each = group_by.value.sort != null ? [group_by.value.sort] : []
                            content {
                              aggregation = sort.value.aggregation
                              metric      = sort.value.metric
                              order       = sort.value.order
                            }
                          }
                        }
                      }
                      dynamic "group_by_fields" {
                        for_each = event_query.value.group_by_fields != null ? [event_query.value.group_by_fields] : []
                        content {
                          fields = group_by_fields.value.fields
                          limit  = group_by_fields.value.limit
                          dynamic "sort" {
                            for_each = group_by_fields.value.sort != null ? [group_by_fields.value.sort] : []
                            content {
                              aggregation = sort.value.aggregation
                              metric      = sort.value.metric
                              order       = sort.value.order
                            }
                          }
                        }
                      }
                      indexes = event_query.value.indexes
                      name    = event_query.value.name
                      dynamic "search" {
                        for_each = event_query.value.search != null ? [event_query.value.search] : []
                        content {
                          query = search.value.query
                        }
                      }
                      storage = event_query.value.storage
                    }
                  }
                  dynamic "metric_query" {
                    for_each = query.value.metric_query != null ? [query.value.metric_query] : []
                    content {
                      aggregator      = metric_query.value.aggregator
                      cross_org_uuids = metric_query.value.cross_org_uuids
                      data_source     = metric_query.value.data_source
                      name            = metric_query.value.name
                      query           = metric_query.value.query
                      semantic_mode   = metric_query.value.semantic_mode
                    }
                  }
                  dynamic "process_query" {
                    for_each = query.value.process_query != null ? [query.value.process_query] : []
                    content {
                      aggregator        = process_query.value.aggregator
                      cross_org_uuids   = process_query.value.cross_org_uuids
                      data_source       = process_query.value.data_source
                      is_normalized_cpu = process_query.value.is_normalized_cpu
                      limit             = process_query.value.limit
                      metric            = process_query.value.metric
                      name              = process_query.value.name
                      sort              = process_query.value.sort
                      tag_filters       = process_query.value.tag_filters
                      text_filter       = process_query.value.text_filter
                    }
                  }
                  dynamic "slo_query" {
                    for_each = query.value.slo_query != null ? [query.value.slo_query] : []
                    content {
                      additional_query_filters = slo_query.value.additional_query_filters
                      cross_org_uuids          = slo_query.value.cross_org_uuids
                      data_source              = slo_query.value.data_source
                      group_mode               = slo_query.value.group_mode
                      measure                  = slo_query.value.measure
                      name                     = slo_query.value.name
                      slo_id                   = slo_query.value.slo_id
                      slo_query_type           = slo_query.value.slo_query_type
                    }
                  }
                }
              }
              dynamic "rum_query" {
                for_each = request.value.rum_query != null ? [request.value.rum_query] : []
                content {
                  dynamic "compute_query" {
                    for_each = rum_query.value.compute_query != null ? [rum_query.value.compute_query] : []
                    content {
                      aggregation = compute_query.value.aggregation
                      facet       = compute_query.value.facet
                      interval    = compute_query.value.interval
                    }
                  }
                  dynamic "group_by" {
                    for_each = rum_query.value.group_by != null ? rum_query.value.group_by : []
                    content {
                      facet = group_by.value.facet
                      limit = group_by.value.limit
                      dynamic "sort_query" {
                        for_each = group_by.value.sort_query != null ? [group_by.value.sort_query] : []
                        content {
                          aggregation = sort_query.value.aggregation
                          facet       = sort_query.value.facet
                          order       = sort_query.value.order
                        }
                      }
                    }
                  }
                  index = rum_query.value.index
                  dynamic "multi_compute" {
                    for_each = rum_query.value.multi_compute != null ? rum_query.value.multi_compute : []
                    content {
                      aggregation = multi_compute.value.aggregation
                      facet       = multi_compute.value.facet
                      interval    = multi_compute.value.interval
                    }
                  }
                  search_query = rum_query.value.search_query
                }
              }
              dynamic "security_query" {
                for_each = request.value.security_query != null ? [request.value.security_query] : []
                content {
                  dynamic "compute_query" {
                    for_each = security_query.value.compute_query != null ? [security_query.value.compute_query] : []
                    content {
                      aggregation = compute_query.value.aggregation
                      facet       = compute_query.value.facet
                      interval    = compute_query.value.interval
                    }
                  }
                  dynamic "group_by" {
                    for_each = security_query.value.group_by != null ? security_query.value.group_by : []
                    content {
                      facet = group_by.value.facet
                      limit = group_by.value.limit
                      dynamic "sort_query" {
                        for_each = group_by.value.sort_query != null ? [group_by.value.sort_query] : []
                        content {
                          aggregation = sort_query.value.aggregation
                          facet       = sort_query.value.facet
                          order       = sort_query.value.order
                        }
                      }
                    }
                  }
                  index = security_query.value.index
                  dynamic "multi_compute" {
                    for_each = security_query.value.multi_compute != null ? security_query.value.multi_compute : []
                    content {
                      aggregation = multi_compute.value.aggregation
                      facet       = multi_compute.value.facet
                      interval    = multi_compute.value.interval
                    }
                  }
                  search_query = security_query.value.search_query
                }
              }
              dynamic "text_formats" {
                for_each = request.value.text_formats != null ? request.value.text_formats : []
                content {
                  dynamic "text_format" {
                    for_each = text_formats.value.text_format != null ? text_formats.value.text_format : []
                    content {
                      custom_bg_color = text_format.value.custom_bg_color
                      custom_fg_color = text_format.value.custom_fg_color
                      match {
                        type  = text_format.value.match.type
                        value = text_format.value.match.value
                      }
                      palette = text_format.value.palette
                      dynamic "replace" {
                        for_each = text_format.value.replace != null ? [text_format.value.replace] : []
                        content {
                          substring = replace.value.substring
                          type      = replace.value.type
                          with      = replace.value.with
                        }
                      }
                    }
                  }
                }
              }
            }
          }
          title       = query_table_definition.value.title
          title_align = query_table_definition.value.title_align
          title_size  = query_table_definition.value.title_size
        }
      }
      dynamic "query_value_definition" {
        for_each = widget.value.query_value_definition != null ? [widget.value.query_value_definition] : []
        content {
          autoscale = query_value_definition.value.autoscale
          dynamic "custom_link" {
            for_each = query_value_definition.value.custom_link != null ? query_value_definition.value.custom_link : []
            content {
              is_hidden      = custom_link.value.is_hidden
              label          = custom_link.value.label
              link           = custom_link.value.link
              override_label = custom_link.value.override_label
            }
          }
          custom_unit               = query_value_definition.value.custom_unit
          description               = query_value_definition.value.description
          hide_incomplete_cost_data = query_value_definition.value.hide_incomplete_cost_data
          live_span                 = query_value_definition.value.live_span
          precision                 = query_value_definition.value.precision
          dynamic "request" {
            for_each = query_value_definition.value.request != null ? query_value_definition.value.request : []
            content {
              aggregator = request.value.aggregator
              dynamic "apm_query" {
                for_each = request.value.apm_query != null ? [request.value.apm_query] : []
                content {
                  dynamic "compute_query" {
                    for_each = apm_query.value.compute_query != null ? [apm_query.value.compute_query] : []
                    content {
                      aggregation = compute_query.value.aggregation
                      facet       = compute_query.value.facet
                      interval    = compute_query.value.interval
                    }
                  }
                  dynamic "group_by" {
                    for_each = apm_query.value.group_by != null ? apm_query.value.group_by : []
                    content {
                      facet = group_by.value.facet
                      limit = group_by.value.limit
                      dynamic "sort_query" {
                        for_each = group_by.value.sort_query != null ? [group_by.value.sort_query] : []
                        content {
                          aggregation = sort_query.value.aggregation
                          facet       = sort_query.value.facet
                          order       = sort_query.value.order
                        }
                      }
                    }
                  }
                  index = apm_query.value.index
                  dynamic "multi_compute" {
                    for_each = apm_query.value.multi_compute != null ? apm_query.value.multi_compute : []
                    content {
                      aggregation = multi_compute.value.aggregation
                      facet       = multi_compute.value.facet
                      interval    = multi_compute.value.interval
                    }
                  }
                  search_query = apm_query.value.search_query
                }
              }
              dynamic "audit_query" {
                for_each = request.value.audit_query != null ? [request.value.audit_query] : []
                content {
                  dynamic "compute_query" {
                    for_each = audit_query.value.compute_query != null ? [audit_query.value.compute_query] : []
                    content {
                      aggregation = compute_query.value.aggregation
                      facet       = compute_query.value.facet
                      interval    = compute_query.value.interval
                    }
                  }
                  dynamic "group_by" {
                    for_each = audit_query.value.group_by != null ? audit_query.value.group_by : []
                    content {
                      facet = group_by.value.facet
                      limit = group_by.value.limit
                      dynamic "sort_query" {
                        for_each = group_by.value.sort_query != null ? [group_by.value.sort_query] : []
                        content {
                          aggregation = sort_query.value.aggregation
                          facet       = sort_query.value.facet
                          order       = sort_query.value.order
                        }
                      }
                    }
                  }
                  index = audit_query.value.index
                  dynamic "multi_compute" {
                    for_each = audit_query.value.multi_compute != null ? audit_query.value.multi_compute : []
                    content {
                      aggregation = multi_compute.value.aggregation
                      facet       = multi_compute.value.facet
                      interval    = multi_compute.value.interval
                    }
                  }
                  search_query = audit_query.value.search_query
                }
              }
              dynamic "conditional_formats" {
                for_each = request.value.conditional_formats != null ? request.value.conditional_formats : []
                content {
                  comparator      = conditional_formats.value.comparator
                  custom_bg_color = conditional_formats.value.custom_bg_color
                  custom_fg_color = conditional_formats.value.custom_fg_color
                  hide_value      = conditional_formats.value.hide_value
                  image_url       = conditional_formats.value.image_url
                  metric          = conditional_formats.value.metric
                  palette         = conditional_formats.value.palette
                  timeframe       = conditional_formats.value.timeframe
                  value           = conditional_formats.value.value
                }
              }
              dynamic "formula" {
                for_each = request.value.formula != null ? request.value.formula : []
                content {
                  alias             = formula.value.alias
                  cell_display_mode = formula.value.cell_display_mode
                  dynamic "conditional_formats" {
                    for_each = formula.value.conditional_formats != null ? formula.value.conditional_formats : []
                    content {
                      comparator      = conditional_formats.value.comparator
                      custom_bg_color = conditional_formats.value.custom_bg_color
                      custom_fg_color = conditional_formats.value.custom_fg_color
                      hide_value      = conditional_formats.value.hide_value
                      image_url       = conditional_formats.value.image_url
                      metric          = conditional_formats.value.metric
                      palette         = conditional_formats.value.palette
                      timeframe       = conditional_formats.value.timeframe
                      value           = conditional_formats.value.value
                    }
                  }
                  formula_expression = formula.value.formula_expression
                  dynamic "limit" {
                    for_each = formula.value.limit != null ? [formula.value.limit] : []
                    content {
                      count = limit.value.count
                      order = limit.value.order
                    }
                  }
                  dynamic "number_format" {
                    for_each = formula.value.number_format != null ? [formula.value.number_format] : []
                    content {
                      unit {
                        dynamic "canonical" {
                          for_each = number_format.value.unit.canonical != null ? [number_format.value.unit.canonical] : []
                          content {
                            per_unit_name = canonical.value.per_unit_name
                            unit_name     = canonical.value.unit_name
                          }
                        }
                        dynamic "custom" {
                          for_each = number_format.value.unit.custom != null ? [number_format.value.unit.custom] : []
                          content {
                            label = custom.value.label
                          }
                        }
                      }
                      dynamic "unit_scale" {
                        for_each = number_format.value.unit_scale != null ? [number_format.value.unit_scale] : []
                        content {
                          unit_name = unit_scale.value.unit_name
                        }
                      }
                    }
                  }
                  dynamic "style" {
                    for_each = formula.value.style != null ? [formula.value.style] : []
                    content {
                      palette       = style.value.palette
                      palette_index = style.value.palette_index
                    }
                  }
                }
              }
              dynamic "log_query" {
                for_each = request.value.log_query != null ? [request.value.log_query] : []
                content {
                  dynamic "compute_query" {
                    for_each = log_query.value.compute_query != null ? [log_query.value.compute_query] : []
                    content {
                      aggregation = compute_query.value.aggregation
                      facet       = compute_query.value.facet
                      interval    = compute_query.value.interval
                    }
                  }
                  dynamic "group_by" {
                    for_each = log_query.value.group_by != null ? log_query.value.group_by : []
                    content {
                      facet = group_by.value.facet
                      limit = group_by.value.limit
                      dynamic "sort_query" {
                        for_each = group_by.value.sort_query != null ? [group_by.value.sort_query] : []
                        content {
                          aggregation = sort_query.value.aggregation
                          facet       = sort_query.value.facet
                          order       = sort_query.value.order
                        }
                      }
                    }
                  }
                  index = log_query.value.index
                  dynamic "multi_compute" {
                    for_each = log_query.value.multi_compute != null ? log_query.value.multi_compute : []
                    content {
                      aggregation = multi_compute.value.aggregation
                      facet       = multi_compute.value.facet
                      interval    = multi_compute.value.interval
                    }
                  }
                  search_query = log_query.value.search_query
                }
              }
              dynamic "process_query" {
                for_each = request.value.process_query != null ? [request.value.process_query] : []
                content {
                  filter_by = process_query.value.filter_by
                  limit     = process_query.value.limit
                  metric    = process_query.value.metric
                  search_by = process_query.value.search_by
                }
              }
              q = request.value.q
              dynamic "query" {
                for_each = request.value.query != null ? request.value.query : []
                content {
                  dynamic "apm_dependency_stats_query" {
                    for_each = query.value.apm_dependency_stats_query != null ? [query.value.apm_dependency_stats_query] : []
                    content {
                      cross_org_uuids   = apm_dependency_stats_query.value.cross_org_uuids
                      data_source       = apm_dependency_stats_query.value.data_source
                      env               = apm_dependency_stats_query.value.env
                      is_upstream       = apm_dependency_stats_query.value.is_upstream
                      name              = apm_dependency_stats_query.value.name
                      operation_name    = apm_dependency_stats_query.value.operation_name
                      primary_tag_name  = apm_dependency_stats_query.value.primary_tag_name
                      primary_tag_value = apm_dependency_stats_query.value.primary_tag_value
                      resource_name     = apm_dependency_stats_query.value.resource_name
                      service           = apm_dependency_stats_query.value.service
                      stat              = apm_dependency_stats_query.value.stat
                    }
                  }
                  dynamic "apm_resource_stats_query" {
                    for_each = query.value.apm_resource_stats_query != null ? [query.value.apm_resource_stats_query] : []
                    content {
                      cross_org_uuids   = apm_resource_stats_query.value.cross_org_uuids
                      data_source       = apm_resource_stats_query.value.data_source
                      env               = apm_resource_stats_query.value.env
                      group_by          = apm_resource_stats_query.value.group_by
                      name              = apm_resource_stats_query.value.name
                      operation_name    = apm_resource_stats_query.value.operation_name
                      primary_tag_name  = apm_resource_stats_query.value.primary_tag_name
                      primary_tag_value = apm_resource_stats_query.value.primary_tag_value
                      resource_name     = apm_resource_stats_query.value.resource_name
                      service           = apm_resource_stats_query.value.service
                      stat              = apm_resource_stats_query.value.stat
                    }
                  }
                  dynamic "cloud_cost_query" {
                    for_each = query.value.cloud_cost_query != null ? [query.value.cloud_cost_query] : []
                    content {
                      aggregator      = cloud_cost_query.value.aggregator
                      cross_org_uuids = cloud_cost_query.value.cross_org_uuids
                      data_source     = cloud_cost_query.value.data_source
                      name            = cloud_cost_query.value.name
                      query           = cloud_cost_query.value.query
                    }
                  }
                  dynamic "event_query" {
                    for_each = query.value.event_query != null ? [query.value.event_query] : []
                    content {
                      dynamic "compute" {
                        for_each = event_query.value.compute
                        content {
                          aggregation = compute.value.aggregation
                          interval    = compute.value.interval
                          metric      = compute.value.metric
                        }
                      }
                      cross_org_uuids = event_query.value.cross_org_uuids
                      data_source     = event_query.value.data_source
                      dynamic "group_by" {
                        for_each = event_query.value.group_by != null ? event_query.value.group_by : []
                        content {
                          facet = group_by.value.facet
                          limit = group_by.value.limit
                          dynamic "sort" {
                            for_each = group_by.value.sort != null ? [group_by.value.sort] : []
                            content {
                              aggregation = sort.value.aggregation
                              metric      = sort.value.metric
                              order       = sort.value.order
                            }
                          }
                        }
                      }
                      dynamic "group_by_fields" {
                        for_each = event_query.value.group_by_fields != null ? [event_query.value.group_by_fields] : []
                        content {
                          fields = group_by_fields.value.fields
                          limit  = group_by_fields.value.limit
                          dynamic "sort" {
                            for_each = group_by_fields.value.sort != null ? [group_by_fields.value.sort] : []
                            content {
                              aggregation = sort.value.aggregation
                              metric      = sort.value.metric
                              order       = sort.value.order
                            }
                          }
                        }
                      }
                      indexes = event_query.value.indexes
                      name    = event_query.value.name
                      dynamic "search" {
                        for_each = event_query.value.search != null ? [event_query.value.search] : []
                        content {
                          query = search.value.query
                        }
                      }
                      storage = event_query.value.storage
                    }
                  }
                  dynamic "metric_query" {
                    for_each = query.value.metric_query != null ? [query.value.metric_query] : []
                    content {
                      aggregator      = metric_query.value.aggregator
                      cross_org_uuids = metric_query.value.cross_org_uuids
                      data_source     = metric_query.value.data_source
                      name            = metric_query.value.name
                      query           = metric_query.value.query
                      semantic_mode   = metric_query.value.semantic_mode
                    }
                  }
                  dynamic "process_query" {
                    for_each = query.value.process_query != null ? [query.value.process_query] : []
                    content {
                      aggregator        = process_query.value.aggregator
                      cross_org_uuids   = process_query.value.cross_org_uuids
                      data_source       = process_query.value.data_source
                      is_normalized_cpu = process_query.value.is_normalized_cpu
                      limit             = process_query.value.limit
                      metric            = process_query.value.metric
                      name              = process_query.value.name
                      sort              = process_query.value.sort
                      tag_filters       = process_query.value.tag_filters
                      text_filter       = process_query.value.text_filter
                    }
                  }
                  dynamic "slo_query" {
                    for_each = query.value.slo_query != null ? [query.value.slo_query] : []
                    content {
                      additional_query_filters = slo_query.value.additional_query_filters
                      cross_org_uuids          = slo_query.value.cross_org_uuids
                      data_source              = slo_query.value.data_source
                      group_mode               = slo_query.value.group_mode
                      measure                  = slo_query.value.measure
                      name                     = slo_query.value.name
                      slo_id                   = slo_query.value.slo_id
                      slo_query_type           = slo_query.value.slo_query_type
                    }
                  }
                }
              }
              dynamic "rum_query" {
                for_each = request.value.rum_query != null ? [request.value.rum_query] : []
                content {
                  dynamic "compute_query" {
                    for_each = rum_query.value.compute_query != null ? [rum_query.value.compute_query] : []
                    content {
                      aggregation = compute_query.value.aggregation
                      facet       = compute_query.value.facet
                      interval    = compute_query.value.interval
                    }
                  }
                  dynamic "group_by" {
                    for_each = rum_query.value.group_by != null ? rum_query.value.group_by : []
                    content {
                      facet = group_by.value.facet
                      limit = group_by.value.limit
                      dynamic "sort_query" {
                        for_each = group_by.value.sort_query != null ? [group_by.value.sort_query] : []
                        content {
                          aggregation = sort_query.value.aggregation
                          facet       = sort_query.value.facet
                          order       = sort_query.value.order
                        }
                      }
                    }
                  }
                  index = rum_query.value.index
                  dynamic "multi_compute" {
                    for_each = rum_query.value.multi_compute != null ? rum_query.value.multi_compute : []
                    content {
                      aggregation = multi_compute.value.aggregation
                      facet       = multi_compute.value.facet
                      interval    = multi_compute.value.interval
                    }
                  }
                  search_query = rum_query.value.search_query
                }
              }
              dynamic "security_query" {
                for_each = request.value.security_query != null ? [request.value.security_query] : []
                content {
                  dynamic "compute_query" {
                    for_each = security_query.value.compute_query != null ? [security_query.value.compute_query] : []
                    content {
                      aggregation = compute_query.value.aggregation
                      facet       = compute_query.value.facet
                      interval    = compute_query.value.interval
                    }
                  }
                  dynamic "group_by" {
                    for_each = security_query.value.group_by != null ? security_query.value.group_by : []
                    content {
                      facet = group_by.value.facet
                      limit = group_by.value.limit
                      dynamic "sort_query" {
                        for_each = group_by.value.sort_query != null ? [group_by.value.sort_query] : []
                        content {
                          aggregation = sort_query.value.aggregation
                          facet       = sort_query.value.facet
                          order       = sort_query.value.order
                        }
                      }
                    }
                  }
                  index = security_query.value.index
                  dynamic "multi_compute" {
                    for_each = security_query.value.multi_compute != null ? security_query.value.multi_compute : []
                    content {
                      aggregation = multi_compute.value.aggregation
                      facet       = multi_compute.value.facet
                      interval    = multi_compute.value.interval
                    }
                  }
                  search_query = security_query.value.search_query
                }
              }
            }
          }
          text_align = query_value_definition.value.text_align
          dynamic "timeseries_background" {
            for_each = query_value_definition.value.timeseries_background != null ? [query_value_definition.value.timeseries_background] : []
            content {
              type = timeseries_background.value.type
              dynamic "yaxis" {
                for_each = timeseries_background.value.yaxis != null ? [timeseries_background.value.yaxis] : []
                content {
                  include_zero = yaxis.value.include_zero
                  label        = yaxis.value.label
                  max          = yaxis.value.max
                  min          = yaxis.value.min
                  scale        = yaxis.value.scale
                }
              }
            }
          }
          title       = query_value_definition.value.title
          title_align = query_value_definition.value.title_align
          title_size  = query_value_definition.value.title_size
        }
      }
      dynamic "run_workflow_definition" {
        for_each = widget.value.run_workflow_definition != null ? [widget.value.run_workflow_definition] : []
        content {
          dynamic "custom_link" {
            for_each = run_workflow_definition.value.custom_link != null ? run_workflow_definition.value.custom_link : []
            content {
              is_hidden      = custom_link.value.is_hidden
              label          = custom_link.value.label
              link           = custom_link.value.link
              override_label = custom_link.value.override_label
            }
          }
          description               = run_workflow_definition.value.description
          hide_incomplete_cost_data = run_workflow_definition.value.hide_incomplete_cost_data
          dynamic "input" {
            for_each = run_workflow_definition.value.input != null ? run_workflow_definition.value.input : []
            content {
              name  = input.value.name
              value = input.value.value
            }
          }
          live_span   = run_workflow_definition.value.live_span
          title       = run_workflow_definition.value.title
          title_align = run_workflow_definition.value.title_align
          title_size  = run_workflow_definition.value.title_size
          workflow_id = run_workflow_definition.value.workflow_id
        }
      }
      dynamic "scatterplot_definition" {
        for_each = widget.value.scatterplot_definition != null ? [widget.value.scatterplot_definition] : []
        content {
          color_by_groups = scatterplot_definition.value.color_by_groups
          dynamic "custom_link" {
            for_each = scatterplot_definition.value.custom_link != null ? scatterplot_definition.value.custom_link : []
            content {
              is_hidden      = custom_link.value.is_hidden
              label          = custom_link.value.label
              link           = custom_link.value.link
              override_label = custom_link.value.override_label
            }
          }
          description               = scatterplot_definition.value.description
          hide_incomplete_cost_data = scatterplot_definition.value.hide_incomplete_cost_data
          live_span                 = scatterplot_definition.value.live_span
          dynamic "request" {
            for_each = scatterplot_definition.value.request != null ? [scatterplot_definition.value.request] : []
            content {
              dynamic "scatterplot_table" {
                for_each = request.value.scatterplot_table != null ? request.value.scatterplot_table : []
                content {
                  dynamic "formula" {
                    for_each = scatterplot_table.value.formula != null ? scatterplot_table.value.formula : []
                    content {
                      alias              = formula.value.alias
                      dimension          = formula.value.dimension
                      formula_expression = formula.value.formula_expression
                    }
                  }
                  dynamic "query" {
                    for_each = scatterplot_table.value.query != null ? scatterplot_table.value.query : []
                    content {
                      dynamic "apm_dependency_stats_query" {
                        for_each = query.value.apm_dependency_stats_query != null ? [query.value.apm_dependency_stats_query] : []
                        content {
                          cross_org_uuids   = apm_dependency_stats_query.value.cross_org_uuids
                          data_source       = apm_dependency_stats_query.value.data_source
                          env               = apm_dependency_stats_query.value.env
                          is_upstream       = apm_dependency_stats_query.value.is_upstream
                          name              = apm_dependency_stats_query.value.name
                          operation_name    = apm_dependency_stats_query.value.operation_name
                          primary_tag_name  = apm_dependency_stats_query.value.primary_tag_name
                          primary_tag_value = apm_dependency_stats_query.value.primary_tag_value
                          resource_name     = apm_dependency_stats_query.value.resource_name
                          service           = apm_dependency_stats_query.value.service
                          stat              = apm_dependency_stats_query.value.stat
                        }
                      }
                      dynamic "apm_resource_stats_query" {
                        for_each = query.value.apm_resource_stats_query != null ? [query.value.apm_resource_stats_query] : []
                        content {
                          cross_org_uuids   = apm_resource_stats_query.value.cross_org_uuids
                          data_source       = apm_resource_stats_query.value.data_source
                          env               = apm_resource_stats_query.value.env
                          group_by          = apm_resource_stats_query.value.group_by
                          name              = apm_resource_stats_query.value.name
                          operation_name    = apm_resource_stats_query.value.operation_name
                          primary_tag_name  = apm_resource_stats_query.value.primary_tag_name
                          primary_tag_value = apm_resource_stats_query.value.primary_tag_value
                          resource_name     = apm_resource_stats_query.value.resource_name
                          service           = apm_resource_stats_query.value.service
                          stat              = apm_resource_stats_query.value.stat
                        }
                      }
                      dynamic "cloud_cost_query" {
                        for_each = query.value.cloud_cost_query != null ? [query.value.cloud_cost_query] : []
                        content {
                          aggregator      = cloud_cost_query.value.aggregator
                          cross_org_uuids = cloud_cost_query.value.cross_org_uuids
                          data_source     = cloud_cost_query.value.data_source
                          name            = cloud_cost_query.value.name
                          query           = cloud_cost_query.value.query
                        }
                      }
                      dynamic "event_query" {
                        for_each = query.value.event_query != null ? [query.value.event_query] : []
                        content {
                          dynamic "compute" {
                            for_each = event_query.value.compute
                            content {
                              aggregation = compute.value.aggregation
                              interval    = compute.value.interval
                              metric      = compute.value.metric
                            }
                          }
                          cross_org_uuids = event_query.value.cross_org_uuids
                          data_source     = event_query.value.data_source
                          dynamic "group_by" {
                            for_each = event_query.value.group_by != null ? event_query.value.group_by : []
                            content {
                              facet = group_by.value.facet
                              limit = group_by.value.limit
                              dynamic "sort" {
                                for_each = group_by.value.sort != null ? [group_by.value.sort] : []
                                content {
                                  aggregation = sort.value.aggregation
                                  metric      = sort.value.metric
                                  order       = sort.value.order
                                }
                              }
                            }
                          }
                          dynamic "group_by_fields" {
                            for_each = event_query.value.group_by_fields != null ? [event_query.value.group_by_fields] : []
                            content {
                              fields = group_by_fields.value.fields
                              limit  = group_by_fields.value.limit
                              dynamic "sort" {
                                for_each = group_by_fields.value.sort != null ? [group_by_fields.value.sort] : []
                                content {
                                  aggregation = sort.value.aggregation
                                  metric      = sort.value.metric
                                  order       = sort.value.order
                                }
                              }
                            }
                          }
                          indexes = event_query.value.indexes
                          name    = event_query.value.name
                          dynamic "search" {
                            for_each = event_query.value.search != null ? [event_query.value.search] : []
                            content {
                              query = search.value.query
                            }
                          }
                          storage = event_query.value.storage
                        }
                      }
                      dynamic "metric_query" {
                        for_each = query.value.metric_query != null ? [query.value.metric_query] : []
                        content {
                          aggregator      = metric_query.value.aggregator
                          cross_org_uuids = metric_query.value.cross_org_uuids
                          data_source     = metric_query.value.data_source
                          name            = metric_query.value.name
                          query           = metric_query.value.query
                          semantic_mode   = metric_query.value.semantic_mode
                        }
                      }
                      dynamic "process_query" {
                        for_each = query.value.process_query != null ? [query.value.process_query] : []
                        content {
                          aggregator        = process_query.value.aggregator
                          cross_org_uuids   = process_query.value.cross_org_uuids
                          data_source       = process_query.value.data_source
                          is_normalized_cpu = process_query.value.is_normalized_cpu
                          limit             = process_query.value.limit
                          metric            = process_query.value.metric
                          name              = process_query.value.name
                          sort              = process_query.value.sort
                          tag_filters       = process_query.value.tag_filters
                          text_filter       = process_query.value.text_filter
                        }
                      }
                      dynamic "slo_query" {
                        for_each = query.value.slo_query != null ? [query.value.slo_query] : []
                        content {
                          additional_query_filters = slo_query.value.additional_query_filters
                          cross_org_uuids          = slo_query.value.cross_org_uuids
                          data_source              = slo_query.value.data_source
                          group_mode               = slo_query.value.group_mode
                          measure                  = slo_query.value.measure
                          name                     = slo_query.value.name
                          slo_id                   = slo_query.value.slo_id
                          slo_query_type           = slo_query.value.slo_query_type
                        }
                      }
                    }
                  }
                }
              }
              dynamic "x" {
                for_each = request.value.x != null ? request.value.x : []
                content {
                  aggregator = x.value.aggregator
                  dynamic "apm_query" {
                    for_each = x.value.apm_query != null ? [x.value.apm_query] : []
                    content {
                      dynamic "compute_query" {
                        for_each = apm_query.value.compute_query != null ? [apm_query.value.compute_query] : []
                        content {
                          aggregation = compute_query.value.aggregation
                          facet       = compute_query.value.facet
                          interval    = compute_query.value.interval
                        }
                      }
                      dynamic "group_by" {
                        for_each = apm_query.value.group_by != null ? apm_query.value.group_by : []
                        content {
                          facet = group_by.value.facet
                          limit = group_by.value.limit
                          dynamic "sort_query" {
                            for_each = group_by.value.sort_query != null ? [group_by.value.sort_query] : []
                            content {
                              aggregation = sort_query.value.aggregation
                              facet       = sort_query.value.facet
                              order       = sort_query.value.order
                            }
                          }
                        }
                      }
                      index = apm_query.value.index
                      dynamic "multi_compute" {
                        for_each = apm_query.value.multi_compute != null ? apm_query.value.multi_compute : []
                        content {
                          aggregation = multi_compute.value.aggregation
                          facet       = multi_compute.value.facet
                          interval    = multi_compute.value.interval
                        }
                      }
                      search_query = apm_query.value.search_query
                    }
                  }
                  dynamic "log_query" {
                    for_each = x.value.log_query != null ? [x.value.log_query] : []
                    content {
                      dynamic "compute_query" {
                        for_each = log_query.value.compute_query != null ? [log_query.value.compute_query] : []
                        content {
                          aggregation = compute_query.value.aggregation
                          facet       = compute_query.value.facet
                          interval    = compute_query.value.interval
                        }
                      }
                      dynamic "group_by" {
                        for_each = log_query.value.group_by != null ? log_query.value.group_by : []
                        content {
                          facet = group_by.value.facet
                          limit = group_by.value.limit
                          dynamic "sort_query" {
                            for_each = group_by.value.sort_query != null ? [group_by.value.sort_query] : []
                            content {
                              aggregation = sort_query.value.aggregation
                              facet       = sort_query.value.facet
                              order       = sort_query.value.order
                            }
                          }
                        }
                      }
                      index = log_query.value.index
                      dynamic "multi_compute" {
                        for_each = log_query.value.multi_compute != null ? log_query.value.multi_compute : []
                        content {
                          aggregation = multi_compute.value.aggregation
                          facet       = multi_compute.value.facet
                          interval    = multi_compute.value.interval
                        }
                      }
                      search_query = log_query.value.search_query
                    }
                  }
                  dynamic "process_query" {
                    for_each = x.value.process_query != null ? [x.value.process_query] : []
                    content {
                      filter_by = process_query.value.filter_by
                      limit     = process_query.value.limit
                      metric    = process_query.value.metric
                      search_by = process_query.value.search_by
                    }
                  }
                  q = x.value.q
                  dynamic "rum_query" {
                    for_each = x.value.rum_query != null ? [x.value.rum_query] : []
                    content {
                      dynamic "compute_query" {
                        for_each = rum_query.value.compute_query != null ? [rum_query.value.compute_query] : []
                        content {
                          aggregation = compute_query.value.aggregation
                          facet       = compute_query.value.facet
                          interval    = compute_query.value.interval
                        }
                      }
                      dynamic "group_by" {
                        for_each = rum_query.value.group_by != null ? rum_query.value.group_by : []
                        content {
                          facet = group_by.value.facet
                          limit = group_by.value.limit
                          dynamic "sort_query" {
                            for_each = group_by.value.sort_query != null ? [group_by.value.sort_query] : []
                            content {
                              aggregation = sort_query.value.aggregation
                              facet       = sort_query.value.facet
                              order       = sort_query.value.order
                            }
                          }
                        }
                      }
                      index = rum_query.value.index
                      dynamic "multi_compute" {
                        for_each = rum_query.value.multi_compute != null ? rum_query.value.multi_compute : []
                        content {
                          aggregation = multi_compute.value.aggregation
                          facet       = multi_compute.value.facet
                          interval    = multi_compute.value.interval
                        }
                      }
                      search_query = rum_query.value.search_query
                    }
                  }
                  dynamic "security_query" {
                    for_each = x.value.security_query != null ? [x.value.security_query] : []
                    content {
                      dynamic "compute_query" {
                        for_each = security_query.value.compute_query != null ? [security_query.value.compute_query] : []
                        content {
                          aggregation = compute_query.value.aggregation
                          facet       = compute_query.value.facet
                          interval    = compute_query.value.interval
                        }
                      }
                      dynamic "group_by" {
                        for_each = security_query.value.group_by != null ? security_query.value.group_by : []
                        content {
                          facet = group_by.value.facet
                          limit = group_by.value.limit
                          dynamic "sort_query" {
                            for_each = group_by.value.sort_query != null ? [group_by.value.sort_query] : []
                            content {
                              aggregation = sort_query.value.aggregation
                              facet       = sort_query.value.facet
                              order       = sort_query.value.order
                            }
                          }
                        }
                      }
                      index = security_query.value.index
                      dynamic "multi_compute" {
                        for_each = security_query.value.multi_compute != null ? security_query.value.multi_compute : []
                        content {
                          aggregation = multi_compute.value.aggregation
                          facet       = multi_compute.value.facet
                          interval    = multi_compute.value.interval
                        }
                      }
                      search_query = security_query.value.search_query
                    }
                  }
                }
              }
              dynamic "y" {
                for_each = request.value.y != null ? request.value.y : []
                content {
                  aggregator = y.value.aggregator
                  dynamic "apm_query" {
                    for_each = y.value.apm_query != null ? [y.value.apm_query] : []
                    content {
                      dynamic "compute_query" {
                        for_each = apm_query.value.compute_query != null ? [apm_query.value.compute_query] : []
                        content {
                          aggregation = compute_query.value.aggregation
                          facet       = compute_query.value.facet
                          interval    = compute_query.value.interval
                        }
                      }
                      dynamic "group_by" {
                        for_each = apm_query.value.group_by != null ? apm_query.value.group_by : []
                        content {
                          facet = group_by.value.facet
                          limit = group_by.value.limit
                          dynamic "sort_query" {
                            for_each = group_by.value.sort_query != null ? [group_by.value.sort_query] : []
                            content {
                              aggregation = sort_query.value.aggregation
                              facet       = sort_query.value.facet
                              order       = sort_query.value.order
                            }
                          }
                        }
                      }
                      index = apm_query.value.index
                      dynamic "multi_compute" {
                        for_each = apm_query.value.multi_compute != null ? apm_query.value.multi_compute : []
                        content {
                          aggregation = multi_compute.value.aggregation
                          facet       = multi_compute.value.facet
                          interval    = multi_compute.value.interval
                        }
                      }
                      search_query = apm_query.value.search_query
                    }
                  }
                  dynamic "log_query" {
                    for_each = y.value.log_query != null ? [y.value.log_query] : []
                    content {
                      dynamic "compute_query" {
                        for_each = log_query.value.compute_query != null ? [log_query.value.compute_query] : []
                        content {
                          aggregation = compute_query.value.aggregation
                          facet       = compute_query.value.facet
                          interval    = compute_query.value.interval
                        }
                      }
                      dynamic "group_by" {
                        for_each = log_query.value.group_by != null ? log_query.value.group_by : []
                        content {
                          facet = group_by.value.facet
                          limit = group_by.value.limit
                          dynamic "sort_query" {
                            for_each = group_by.value.sort_query != null ? [group_by.value.sort_query] : []
                            content {
                              aggregation = sort_query.value.aggregation
                              facet       = sort_query.value.facet
                              order       = sort_query.value.order
                            }
                          }
                        }
                      }
                      index = log_query.value.index
                      dynamic "multi_compute" {
                        for_each = log_query.value.multi_compute != null ? log_query.value.multi_compute : []
                        content {
                          aggregation = multi_compute.value.aggregation
                          facet       = multi_compute.value.facet
                          interval    = multi_compute.value.interval
                        }
                      }
                      search_query = log_query.value.search_query
                    }
                  }
                  dynamic "process_query" {
                    for_each = y.value.process_query != null ? [y.value.process_query] : []
                    content {
                      filter_by = process_query.value.filter_by
                      limit     = process_query.value.limit
                      metric    = process_query.value.metric
                      search_by = process_query.value.search_by
                    }
                  }
                  q = y.value.q
                  dynamic "rum_query" {
                    for_each = y.value.rum_query != null ? [y.value.rum_query] : []
                    content {
                      dynamic "compute_query" {
                        for_each = rum_query.value.compute_query != null ? [rum_query.value.compute_query] : []
                        content {
                          aggregation = compute_query.value.aggregation
                          facet       = compute_query.value.facet
                          interval    = compute_query.value.interval
                        }
                      }
                      dynamic "group_by" {
                        for_each = rum_query.value.group_by != null ? rum_query.value.group_by : []
                        content {
                          facet = group_by.value.facet
                          limit = group_by.value.limit
                          dynamic "sort_query" {
                            for_each = group_by.value.sort_query != null ? [group_by.value.sort_query] : []
                            content {
                              aggregation = sort_query.value.aggregation
                              facet       = sort_query.value.facet
                              order       = sort_query.value.order
                            }
                          }
                        }
                      }
                      index = rum_query.value.index
                      dynamic "multi_compute" {
                        for_each = rum_query.value.multi_compute != null ? rum_query.value.multi_compute : []
                        content {
                          aggregation = multi_compute.value.aggregation
                          facet       = multi_compute.value.facet
                          interval    = multi_compute.value.interval
                        }
                      }
                      search_query = rum_query.value.search_query
                    }
                  }
                  dynamic "security_query" {
                    for_each = y.value.security_query != null ? [y.value.security_query] : []
                    content {
                      dynamic "compute_query" {
                        for_each = security_query.value.compute_query != null ? [security_query.value.compute_query] : []
                        content {
                          aggregation = compute_query.value.aggregation
                          facet       = compute_query.value.facet
                          interval    = compute_query.value.interval
                        }
                      }
                      dynamic "group_by" {
                        for_each = security_query.value.group_by != null ? security_query.value.group_by : []
                        content {
                          facet = group_by.value.facet
                          limit = group_by.value.limit
                          dynamic "sort_query" {
                            for_each = group_by.value.sort_query != null ? [group_by.value.sort_query] : []
                            content {
                              aggregation = sort_query.value.aggregation
                              facet       = sort_query.value.facet
                              order       = sort_query.value.order
                            }
                          }
                        }
                      }
                      index = security_query.value.index
                      dynamic "multi_compute" {
                        for_each = security_query.value.multi_compute != null ? security_query.value.multi_compute : []
                        content {
                          aggregation = multi_compute.value.aggregation
                          facet       = multi_compute.value.facet
                          interval    = multi_compute.value.interval
                        }
                      }
                      search_query = security_query.value.search_query
                    }
                  }
                }
              }
            }
          }
          title       = scatterplot_definition.value.title
          title_align = scatterplot_definition.value.title_align
          title_size  = scatterplot_definition.value.title_size
          dynamic "xaxis" {
            for_each = scatterplot_definition.value.xaxis != null ? [scatterplot_definition.value.xaxis] : []
            content {
              include_zero = xaxis.value.include_zero
              label        = xaxis.value.label
              max          = xaxis.value.max
              min          = xaxis.value.min
              scale        = xaxis.value.scale
            }
          }
          dynamic "yaxis" {
            for_each = scatterplot_definition.value.yaxis != null ? [scatterplot_definition.value.yaxis] : []
            content {
              include_zero = yaxis.value.include_zero
              label        = yaxis.value.label
              max          = yaxis.value.max
              min          = yaxis.value.min
              scale        = yaxis.value.scale
            }
          }
        }
      }
      dynamic "service_level_objective_definition" {
        for_each = widget.value.service_level_objective_definition != null ? [widget.value.service_level_objective_definition] : []
        content {
          additional_query_filters = service_level_objective_definition.value.additional_query_filters
          description              = service_level_objective_definition.value.description
          global_time_target       = service_level_objective_definition.value.global_time_target
          show_error_budget        = service_level_objective_definition.value.show_error_budget
          slo_id                   = service_level_objective_definition.value.slo_id
          time_windows             = service_level_objective_definition.value.time_windows
          title                    = service_level_objective_definition.value.title
          title_align              = service_level_objective_definition.value.title_align
          title_size               = service_level_objective_definition.value.title_size
          view_mode                = service_level_objective_definition.value.view_mode
          view_type                = service_level_objective_definition.value.view_type
        }
      }
      dynamic "servicemap_definition" {
        for_each = widget.value.servicemap_definition != null ? [widget.value.servicemap_definition] : []
        content {
          dynamic "custom_link" {
            for_each = servicemap_definition.value.custom_link != null ? servicemap_definition.value.custom_link : []
            content {
              is_hidden      = custom_link.value.is_hidden
              label          = custom_link.value.label
              link           = custom_link.value.link
              override_label = custom_link.value.override_label
            }
          }
          description = servicemap_definition.value.description
          filters     = servicemap_definition.value.filters
          service     = servicemap_definition.value.service
          title       = servicemap_definition.value.title
          title_align = servicemap_definition.value.title_align
          title_size  = servicemap_definition.value.title_size
        }
      }
      dynamic "slo_list_definition" {
        for_each = widget.value.slo_list_definition != null ? [widget.value.slo_list_definition] : []
        content {
          request {
            description = slo_list_definition.value.request.description
            query {
              limit        = slo_list_definition.value.request.query.limit
              query_string = slo_list_definition.value.request.query.query_string
              dynamic "sort" {
                for_each = slo_list_definition.value.request.query.sort != null ? [slo_list_definition.value.request.query.sort] : []
                content {
                  column      = sort.value.column
                  description = sort.value.description
                  order       = sort.value.order
                }
              }
            }
            request_type = slo_list_definition.value.request.request_type
          }
          title       = slo_list_definition.value.title
          title_align = slo_list_definition.value.title_align
          title_size  = slo_list_definition.value.title_size
        }
      }
      dynamic "sunburst_definition" {
        for_each = widget.value.sunburst_definition != null ? [widget.value.sunburst_definition] : []
        content {
          dynamic "custom_link" {
            for_each = sunburst_definition.value.custom_link != null ? sunburst_definition.value.custom_link : []
            content {
              is_hidden      = custom_link.value.is_hidden
              label          = custom_link.value.label
              link           = custom_link.value.link
              override_label = custom_link.value.override_label
            }
          }
          description               = sunburst_definition.value.description
          hide_incomplete_cost_data = sunburst_definition.value.hide_incomplete_cost_data
          hide_total                = sunburst_definition.value.hide_total
          dynamic "legend_inline" {
            for_each = sunburst_definition.value.legend_inline != null ? [sunburst_definition.value.legend_inline] : []
            content {
              hide_percent = legend_inline.value.hide_percent
              hide_value   = legend_inline.value.hide_value
              type         = legend_inline.value.type
            }
          }
          dynamic "legend_table" {
            for_each = sunburst_definition.value.legend_table != null ? [sunburst_definition.value.legend_table] : []
            content {
              type = legend_table.value.type
            }
          }
          live_span = sunburst_definition.value.live_span
          dynamic "request" {
            for_each = sunburst_definition.value.request != null ? sunburst_definition.value.request : []
            content {
              dynamic "apm_query" {
                for_each = request.value.apm_query != null ? [request.value.apm_query] : []
                content {
                  dynamic "compute_query" {
                    for_each = apm_query.value.compute_query != null ? [apm_query.value.compute_query] : []
                    content {
                      aggregation = compute_query.value.aggregation
                      facet       = compute_query.value.facet
                      interval    = compute_query.value.interval
                    }
                  }
                  dynamic "group_by" {
                    for_each = apm_query.value.group_by != null ? apm_query.value.group_by : []
                    content {
                      facet = group_by.value.facet
                      limit = group_by.value.limit
                      dynamic "sort_query" {
                        for_each = group_by.value.sort_query != null ? [group_by.value.sort_query] : []
                        content {
                          aggregation = sort_query.value.aggregation
                          facet       = sort_query.value.facet
                          order       = sort_query.value.order
                        }
                      }
                    }
                  }
                  index = apm_query.value.index
                  dynamic "multi_compute" {
                    for_each = apm_query.value.multi_compute != null ? apm_query.value.multi_compute : []
                    content {
                      aggregation = multi_compute.value.aggregation
                      facet       = multi_compute.value.facet
                      interval    = multi_compute.value.interval
                    }
                  }
                  search_query = apm_query.value.search_query
                }
              }
              dynamic "audit_query" {
                for_each = request.value.audit_query != null ? [request.value.audit_query] : []
                content {
                  dynamic "compute_query" {
                    for_each = audit_query.value.compute_query != null ? [audit_query.value.compute_query] : []
                    content {
                      aggregation = compute_query.value.aggregation
                      facet       = compute_query.value.facet
                      interval    = compute_query.value.interval
                    }
                  }
                  dynamic "group_by" {
                    for_each = audit_query.value.group_by != null ? audit_query.value.group_by : []
                    content {
                      facet = group_by.value.facet
                      limit = group_by.value.limit
                      dynamic "sort_query" {
                        for_each = group_by.value.sort_query != null ? [group_by.value.sort_query] : []
                        content {
                          aggregation = sort_query.value.aggregation
                          facet       = sort_query.value.facet
                          order       = sort_query.value.order
                        }
                      }
                    }
                  }
                  index = audit_query.value.index
                  dynamic "multi_compute" {
                    for_each = audit_query.value.multi_compute != null ? audit_query.value.multi_compute : []
                    content {
                      aggregation = multi_compute.value.aggregation
                      facet       = multi_compute.value.facet
                      interval    = multi_compute.value.interval
                    }
                  }
                  search_query = audit_query.value.search_query
                }
              }
              dynamic "formula" {
                for_each = request.value.formula != null ? request.value.formula : []
                content {
                  alias             = formula.value.alias
                  cell_display_mode = formula.value.cell_display_mode
                  dynamic "conditional_formats" {
                    for_each = formula.value.conditional_formats != null ? formula.value.conditional_formats : []
                    content {
                      comparator      = conditional_formats.value.comparator
                      custom_bg_color = conditional_formats.value.custom_bg_color
                      custom_fg_color = conditional_formats.value.custom_fg_color
                      hide_value      = conditional_formats.value.hide_value
                      image_url       = conditional_formats.value.image_url
                      metric          = conditional_formats.value.metric
                      palette         = conditional_formats.value.palette
                      timeframe       = conditional_formats.value.timeframe
                      value           = conditional_formats.value.value
                    }
                  }
                  formula_expression = formula.value.formula_expression
                  dynamic "limit" {
                    for_each = formula.value.limit != null ? [formula.value.limit] : []
                    content {
                      count = limit.value.count
                      order = limit.value.order
                    }
                  }
                  dynamic "number_format" {
                    for_each = formula.value.number_format != null ? [formula.value.number_format] : []
                    content {
                      unit {
                        dynamic "canonical" {
                          for_each = number_format.value.unit.canonical != null ? [number_format.value.unit.canonical] : []
                          content {
                            per_unit_name = canonical.value.per_unit_name
                            unit_name     = canonical.value.unit_name
                          }
                        }
                        dynamic "custom" {
                          for_each = number_format.value.unit.custom != null ? [number_format.value.unit.custom] : []
                          content {
                            label = custom.value.label
                          }
                        }
                      }
                      dynamic "unit_scale" {
                        for_each = number_format.value.unit_scale != null ? [number_format.value.unit_scale] : []
                        content {
                          unit_name = unit_scale.value.unit_name
                        }
                      }
                    }
                  }
                  dynamic "style" {
                    for_each = formula.value.style != null ? [formula.value.style] : []
                    content {
                      palette       = style.value.palette
                      palette_index = style.value.palette_index
                    }
                  }
                }
              }
              dynamic "log_query" {
                for_each = request.value.log_query != null ? [request.value.log_query] : []
                content {
                  dynamic "compute_query" {
                    for_each = log_query.value.compute_query != null ? [log_query.value.compute_query] : []
                    content {
                      aggregation = compute_query.value.aggregation
                      facet       = compute_query.value.facet
                      interval    = compute_query.value.interval
                    }
                  }
                  dynamic "group_by" {
                    for_each = log_query.value.group_by != null ? log_query.value.group_by : []
                    content {
                      facet = group_by.value.facet
                      limit = group_by.value.limit
                      dynamic "sort_query" {
                        for_each = group_by.value.sort_query != null ? [group_by.value.sort_query] : []
                        content {
                          aggregation = sort_query.value.aggregation
                          facet       = sort_query.value.facet
                          order       = sort_query.value.order
                        }
                      }
                    }
                  }
                  index = log_query.value.index
                  dynamic "multi_compute" {
                    for_each = log_query.value.multi_compute != null ? log_query.value.multi_compute : []
                    content {
                      aggregation = multi_compute.value.aggregation
                      facet       = multi_compute.value.facet
                      interval    = multi_compute.value.interval
                    }
                  }
                  search_query = log_query.value.search_query
                }
              }
              dynamic "network_query" {
                for_each = request.value.network_query != null ? [request.value.network_query] : []
                content {
                  dynamic "compute_query" {
                    for_each = network_query.value.compute_query != null ? [network_query.value.compute_query] : []
                    content {
                      aggregation = compute_query.value.aggregation
                      facet       = compute_query.value.facet
                      interval    = compute_query.value.interval
                    }
                  }
                  dynamic "group_by" {
                    for_each = network_query.value.group_by != null ? network_query.value.group_by : []
                    content {
                      facet = group_by.value.facet
                      limit = group_by.value.limit
                      dynamic "sort_query" {
                        for_each = group_by.value.sort_query != null ? [group_by.value.sort_query] : []
                        content {
                          aggregation = sort_query.value.aggregation
                          facet       = sort_query.value.facet
                          order       = sort_query.value.order
                        }
                      }
                    }
                  }
                  index = network_query.value.index
                  dynamic "multi_compute" {
                    for_each = network_query.value.multi_compute != null ? network_query.value.multi_compute : []
                    content {
                      aggregation = multi_compute.value.aggregation
                      facet       = multi_compute.value.facet
                      interval    = multi_compute.value.interval
                    }
                  }
                  search_query = network_query.value.search_query
                }
              }
              dynamic "process_query" {
                for_each = request.value.process_query != null ? [request.value.process_query] : []
                content {
                  filter_by = process_query.value.filter_by
                  limit     = process_query.value.limit
                  metric    = process_query.value.metric
                  search_by = process_query.value.search_by
                }
              }
              q = request.value.q
              dynamic "query" {
                for_each = request.value.query != null ? request.value.query : []
                content {
                  dynamic "apm_dependency_stats_query" {
                    for_each = query.value.apm_dependency_stats_query != null ? [query.value.apm_dependency_stats_query] : []
                    content {
                      cross_org_uuids   = apm_dependency_stats_query.value.cross_org_uuids
                      data_source       = apm_dependency_stats_query.value.data_source
                      env               = apm_dependency_stats_query.value.env
                      is_upstream       = apm_dependency_stats_query.value.is_upstream
                      name              = apm_dependency_stats_query.value.name
                      operation_name    = apm_dependency_stats_query.value.operation_name
                      primary_tag_name  = apm_dependency_stats_query.value.primary_tag_name
                      primary_tag_value = apm_dependency_stats_query.value.primary_tag_value
                      resource_name     = apm_dependency_stats_query.value.resource_name
                      service           = apm_dependency_stats_query.value.service
                      stat              = apm_dependency_stats_query.value.stat
                    }
                  }
                  dynamic "apm_resource_stats_query" {
                    for_each = query.value.apm_resource_stats_query != null ? [query.value.apm_resource_stats_query] : []
                    content {
                      cross_org_uuids   = apm_resource_stats_query.value.cross_org_uuids
                      data_source       = apm_resource_stats_query.value.data_source
                      env               = apm_resource_stats_query.value.env
                      group_by          = apm_resource_stats_query.value.group_by
                      name              = apm_resource_stats_query.value.name
                      operation_name    = apm_resource_stats_query.value.operation_name
                      primary_tag_name  = apm_resource_stats_query.value.primary_tag_name
                      primary_tag_value = apm_resource_stats_query.value.primary_tag_value
                      resource_name     = apm_resource_stats_query.value.resource_name
                      service           = apm_resource_stats_query.value.service
                      stat              = apm_resource_stats_query.value.stat
                    }
                  }
                  dynamic "cloud_cost_query" {
                    for_each = query.value.cloud_cost_query != null ? [query.value.cloud_cost_query] : []
                    content {
                      aggregator      = cloud_cost_query.value.aggregator
                      cross_org_uuids = cloud_cost_query.value.cross_org_uuids
                      data_source     = cloud_cost_query.value.data_source
                      name            = cloud_cost_query.value.name
                      query           = cloud_cost_query.value.query
                    }
                  }
                  dynamic "event_query" {
                    for_each = query.value.event_query != null ? [query.value.event_query] : []
                    content {
                      dynamic "compute" {
                        for_each = event_query.value.compute
                        content {
                          aggregation = compute.value.aggregation
                          interval    = compute.value.interval
                          metric      = compute.value.metric
                        }
                      }
                      cross_org_uuids = event_query.value.cross_org_uuids
                      data_source     = event_query.value.data_source
                      dynamic "group_by" {
                        for_each = event_query.value.group_by != null ? event_query.value.group_by : []
                        content {
                          facet = group_by.value.facet
                          limit = group_by.value.limit
                          dynamic "sort" {
                            for_each = group_by.value.sort != null ? [group_by.value.sort] : []
                            content {
                              aggregation = sort.value.aggregation
                              metric      = sort.value.metric
                              order       = sort.value.order
                            }
                          }
                        }
                      }
                      dynamic "group_by_fields" {
                        for_each = event_query.value.group_by_fields != null ? [event_query.value.group_by_fields] : []
                        content {
                          fields = group_by_fields.value.fields
                          limit  = group_by_fields.value.limit
                          dynamic "sort" {
                            for_each = group_by_fields.value.sort != null ? [group_by_fields.value.sort] : []
                            content {
                              aggregation = sort.value.aggregation
                              metric      = sort.value.metric
                              order       = sort.value.order
                            }
                          }
                        }
                      }
                      indexes = event_query.value.indexes
                      name    = event_query.value.name
                      dynamic "search" {
                        for_each = event_query.value.search != null ? [event_query.value.search] : []
                        content {
                          query = search.value.query
                        }
                      }
                      storage = event_query.value.storage
                    }
                  }
                  dynamic "metric_query" {
                    for_each = query.value.metric_query != null ? [query.value.metric_query] : []
                    content {
                      aggregator      = metric_query.value.aggregator
                      cross_org_uuids = metric_query.value.cross_org_uuids
                      data_source     = metric_query.value.data_source
                      name            = metric_query.value.name
                      query           = metric_query.value.query
                      semantic_mode   = metric_query.value.semantic_mode
                    }
                  }
                  dynamic "process_query" {
                    for_each = query.value.process_query != null ? [query.value.process_query] : []
                    content {
                      aggregator        = process_query.value.aggregator
                      cross_org_uuids   = process_query.value.cross_org_uuids
                      data_source       = process_query.value.data_source
                      is_normalized_cpu = process_query.value.is_normalized_cpu
                      limit             = process_query.value.limit
                      metric            = process_query.value.metric
                      name              = process_query.value.name
                      sort              = process_query.value.sort
                      tag_filters       = process_query.value.tag_filters
                      text_filter       = process_query.value.text_filter
                    }
                  }
                  dynamic "slo_query" {
                    for_each = query.value.slo_query != null ? [query.value.slo_query] : []
                    content {
                      additional_query_filters = slo_query.value.additional_query_filters
                      cross_org_uuids          = slo_query.value.cross_org_uuids
                      data_source              = slo_query.value.data_source
                      group_mode               = slo_query.value.group_mode
                      measure                  = slo_query.value.measure
                      name                     = slo_query.value.name
                      slo_id                   = slo_query.value.slo_id
                      slo_query_type           = slo_query.value.slo_query_type
                    }
                  }
                }
              }
              dynamic "rum_query" {
                for_each = request.value.rum_query != null ? [request.value.rum_query] : []
                content {
                  dynamic "compute_query" {
                    for_each = rum_query.value.compute_query != null ? [rum_query.value.compute_query] : []
                    content {
                      aggregation = compute_query.value.aggregation
                      facet       = compute_query.value.facet
                      interval    = compute_query.value.interval
                    }
                  }
                  dynamic "group_by" {
                    for_each = rum_query.value.group_by != null ? rum_query.value.group_by : []
                    content {
                      facet = group_by.value.facet
                      limit = group_by.value.limit
                      dynamic "sort_query" {
                        for_each = group_by.value.sort_query != null ? [group_by.value.sort_query] : []
                        content {
                          aggregation = sort_query.value.aggregation
                          facet       = sort_query.value.facet
                          order       = sort_query.value.order
                        }
                      }
                    }
                  }
                  index = rum_query.value.index
                  dynamic "multi_compute" {
                    for_each = rum_query.value.multi_compute != null ? rum_query.value.multi_compute : []
                    content {
                      aggregation = multi_compute.value.aggregation
                      facet       = multi_compute.value.facet
                      interval    = multi_compute.value.interval
                    }
                  }
                  search_query = rum_query.value.search_query
                }
              }
              dynamic "security_query" {
                for_each = request.value.security_query != null ? [request.value.security_query] : []
                content {
                  dynamic "compute_query" {
                    for_each = security_query.value.compute_query != null ? [security_query.value.compute_query] : []
                    content {
                      aggregation = compute_query.value.aggregation
                      facet       = compute_query.value.facet
                      interval    = compute_query.value.interval
                    }
                  }
                  dynamic "group_by" {
                    for_each = security_query.value.group_by != null ? security_query.value.group_by : []
                    content {
                      facet = group_by.value.facet
                      limit = group_by.value.limit
                      dynamic "sort_query" {
                        for_each = group_by.value.sort_query != null ? [group_by.value.sort_query] : []
                        content {
                          aggregation = sort_query.value.aggregation
                          facet       = sort_query.value.facet
                          order       = sort_query.value.order
                        }
                      }
                    }
                  }
                  index = security_query.value.index
                  dynamic "multi_compute" {
                    for_each = security_query.value.multi_compute != null ? security_query.value.multi_compute : []
                    content {
                      aggregation = multi_compute.value.aggregation
                      facet       = multi_compute.value.facet
                      interval    = multi_compute.value.interval
                    }
                  }
                  search_query = security_query.value.search_query
                }
              }
              dynamic "style" {
                for_each = request.value.style != null ? [request.value.style] : []
                content {
                  palette = style.value.palette
                }
              }
            }
          }
          title       = sunburst_definition.value.title
          title_align = sunburst_definition.value.title_align
          title_size  = sunburst_definition.value.title_size
        }
      }
      dynamic "timeseries_definition" {
        for_each = widget.value.timeseries_definition != null ? [widget.value.timeseries_definition] : []
        content {
          dynamic "custom_link" {
            for_each = timeseries_definition.value.custom_link != null ? timeseries_definition.value.custom_link : []
            content {
              is_hidden      = custom_link.value.is_hidden
              label          = custom_link.value.label
              link           = custom_link.value.link
              override_label = custom_link.value.override_label
            }
          }
          description = timeseries_definition.value.description
          dynamic "event" {
            for_each = timeseries_definition.value.event != null ? timeseries_definition.value.event : []
            content {
              q              = event.value.q
              tags_execution = event.value.tags_execution
            }
          }
          hide_incomplete_cost_data = timeseries_definition.value.hide_incomplete_cost_data
          legend_columns            = timeseries_definition.value.legend_columns
          legend_layout             = timeseries_definition.value.legend_layout
          legend_size               = timeseries_definition.value.legend_size
          live_span                 = timeseries_definition.value.live_span
          dynamic "marker" {
            for_each = timeseries_definition.value.marker != null ? timeseries_definition.value.marker : []
            content {
              display_type = marker.value.display_type
              label        = marker.value.label
              value        = marker.value.value
            }
          }
          dynamic "request" {
            for_each = timeseries_definition.value.request != null ? timeseries_definition.value.request : []
            content {
              dynamic "apm_query" {
                for_each = request.value.apm_query != null ? [request.value.apm_query] : []
                content {
                  dynamic "compute_query" {
                    for_each = apm_query.value.compute_query != null ? [apm_query.value.compute_query] : []
                    content {
                      aggregation = compute_query.value.aggregation
                      facet       = compute_query.value.facet
                      interval    = compute_query.value.interval
                    }
                  }
                  dynamic "group_by" {
                    for_each = apm_query.value.group_by != null ? apm_query.value.group_by : []
                    content {
                      facet = group_by.value.facet
                      limit = group_by.value.limit
                      dynamic "sort_query" {
                        for_each = group_by.value.sort_query != null ? [group_by.value.sort_query] : []
                        content {
                          aggregation = sort_query.value.aggregation
                          facet       = sort_query.value.facet
                          order       = sort_query.value.order
                        }
                      }
                    }
                  }
                  index = apm_query.value.index
                  dynamic "multi_compute" {
                    for_each = apm_query.value.multi_compute != null ? apm_query.value.multi_compute : []
                    content {
                      aggregation = multi_compute.value.aggregation
                      facet       = multi_compute.value.facet
                      interval    = multi_compute.value.interval
                    }
                  }
                  search_query = apm_query.value.search_query
                }
              }
              dynamic "audit_query" {
                for_each = request.value.audit_query != null ? [request.value.audit_query] : []
                content {
                  dynamic "compute_query" {
                    for_each = audit_query.value.compute_query != null ? [audit_query.value.compute_query] : []
                    content {
                      aggregation = compute_query.value.aggregation
                      facet       = compute_query.value.facet
                      interval    = compute_query.value.interval
                    }
                  }
                  dynamic "group_by" {
                    for_each = audit_query.value.group_by != null ? audit_query.value.group_by : []
                    content {
                      facet = group_by.value.facet
                      limit = group_by.value.limit
                      dynamic "sort_query" {
                        for_each = group_by.value.sort_query != null ? [group_by.value.sort_query] : []
                        content {
                          aggregation = sort_query.value.aggregation
                          facet       = sort_query.value.facet
                          order       = sort_query.value.order
                        }
                      }
                    }
                  }
                  index = audit_query.value.index
                  dynamic "multi_compute" {
                    for_each = audit_query.value.multi_compute != null ? audit_query.value.multi_compute : []
                    content {
                      aggregation = multi_compute.value.aggregation
                      facet       = multi_compute.value.facet
                      interval    = multi_compute.value.interval
                    }
                  }
                  search_query = audit_query.value.search_query
                }
              }
              display_type = request.value.display_type
              dynamic "formula" {
                for_each = request.value.formula != null ? request.value.formula : []
                content {
                  alias             = formula.value.alias
                  cell_display_mode = formula.value.cell_display_mode
                  dynamic "conditional_formats" {
                    for_each = formula.value.conditional_formats != null ? formula.value.conditional_formats : []
                    content {
                      comparator      = conditional_formats.value.comparator
                      custom_bg_color = conditional_formats.value.custom_bg_color
                      custom_fg_color = conditional_formats.value.custom_fg_color
                      hide_value      = conditional_formats.value.hide_value
                      image_url       = conditional_formats.value.image_url
                      metric          = conditional_formats.value.metric
                      palette         = conditional_formats.value.palette
                      timeframe       = conditional_formats.value.timeframe
                      value           = conditional_formats.value.value
                    }
                  }
                  formula_expression = formula.value.formula_expression
                  dynamic "limit" {
                    for_each = formula.value.limit != null ? [formula.value.limit] : []
                    content {
                      count = limit.value.count
                      order = limit.value.order
                    }
                  }
                  dynamic "number_format" {
                    for_each = formula.value.number_format != null ? [formula.value.number_format] : []
                    content {
                      unit {
                        dynamic "canonical" {
                          for_each = number_format.value.unit.canonical != null ? [number_format.value.unit.canonical] : []
                          content {
                            per_unit_name = canonical.value.per_unit_name
                            unit_name     = canonical.value.unit_name
                          }
                        }
                        dynamic "custom" {
                          for_each = number_format.value.unit.custom != null ? [number_format.value.unit.custom] : []
                          content {
                            label = custom.value.label
                          }
                        }
                      }
                      dynamic "unit_scale" {
                        for_each = number_format.value.unit_scale != null ? [number_format.value.unit_scale] : []
                        content {
                          unit_name = unit_scale.value.unit_name
                        }
                      }
                    }
                  }
                  dynamic "style" {
                    for_each = formula.value.style != null ? [formula.value.style] : []
                    content {
                      palette       = style.value.palette
                      palette_index = style.value.palette_index
                    }
                  }
                }
              }
              dynamic "log_query" {
                for_each = request.value.log_query != null ? [request.value.log_query] : []
                content {
                  dynamic "compute_query" {
                    for_each = log_query.value.compute_query != null ? [log_query.value.compute_query] : []
                    content {
                      aggregation = compute_query.value.aggregation
                      facet       = compute_query.value.facet
                      interval    = compute_query.value.interval
                    }
                  }
                  dynamic "group_by" {
                    for_each = log_query.value.group_by != null ? log_query.value.group_by : []
                    content {
                      facet = group_by.value.facet
                      limit = group_by.value.limit
                      dynamic "sort_query" {
                        for_each = group_by.value.sort_query != null ? [group_by.value.sort_query] : []
                        content {
                          aggregation = sort_query.value.aggregation
                          facet       = sort_query.value.facet
                          order       = sort_query.value.order
                        }
                      }
                    }
                  }
                  index = log_query.value.index
                  dynamic "multi_compute" {
                    for_each = log_query.value.multi_compute != null ? log_query.value.multi_compute : []
                    content {
                      aggregation = multi_compute.value.aggregation
                      facet       = multi_compute.value.facet
                      interval    = multi_compute.value.interval
                    }
                  }
                  search_query = log_query.value.search_query
                }
              }
              dynamic "metadata" {
                for_each = request.value.metadata != null ? request.value.metadata : []
                content {
                  alias_name = metadata.value.alias_name
                  expression = metadata.value.expression
                }
              }
              dynamic "network_query" {
                for_each = request.value.network_query != null ? [request.value.network_query] : []
                content {
                  dynamic "compute_query" {
                    for_each = network_query.value.compute_query != null ? [network_query.value.compute_query] : []
                    content {
                      aggregation = compute_query.value.aggregation
                      facet       = compute_query.value.facet
                      interval    = compute_query.value.interval
                    }
                  }
                  dynamic "group_by" {
                    for_each = network_query.value.group_by != null ? network_query.value.group_by : []
                    content {
                      facet = group_by.value.facet
                      limit = group_by.value.limit
                      dynamic "sort_query" {
                        for_each = group_by.value.sort_query != null ? [group_by.value.sort_query] : []
                        content {
                          aggregation = sort_query.value.aggregation
                          facet       = sort_query.value.facet
                          order       = sort_query.value.order
                        }
                      }
                    }
                  }
                  index = network_query.value.index
                  dynamic "multi_compute" {
                    for_each = network_query.value.multi_compute != null ? network_query.value.multi_compute : []
                    content {
                      aggregation = multi_compute.value.aggregation
                      facet       = multi_compute.value.facet
                      interval    = multi_compute.value.interval
                    }
                  }
                  search_query = network_query.value.search_query
                }
              }
              on_right_yaxis = request.value.on_right_yaxis
              dynamic "process_query" {
                for_each = request.value.process_query != null ? [request.value.process_query] : []
                content {
                  filter_by = process_query.value.filter_by
                  limit     = process_query.value.limit
                  metric    = process_query.value.metric
                  search_by = process_query.value.search_by
                }
              }
              q = request.value.q
              dynamic "query" {
                for_each = request.value.query != null ? request.value.query : []
                content {
                  dynamic "apm_dependency_stats_query" {
                    for_each = query.value.apm_dependency_stats_query != null ? [query.value.apm_dependency_stats_query] : []
                    content {
                      cross_org_uuids   = apm_dependency_stats_query.value.cross_org_uuids
                      data_source       = apm_dependency_stats_query.value.data_source
                      env               = apm_dependency_stats_query.value.env
                      is_upstream       = apm_dependency_stats_query.value.is_upstream
                      name              = apm_dependency_stats_query.value.name
                      operation_name    = apm_dependency_stats_query.value.operation_name
                      primary_tag_name  = apm_dependency_stats_query.value.primary_tag_name
                      primary_tag_value = apm_dependency_stats_query.value.primary_tag_value
                      resource_name     = apm_dependency_stats_query.value.resource_name
                      service           = apm_dependency_stats_query.value.service
                      stat              = apm_dependency_stats_query.value.stat
                    }
                  }
                  dynamic "apm_resource_stats_query" {
                    for_each = query.value.apm_resource_stats_query != null ? [query.value.apm_resource_stats_query] : []
                    content {
                      cross_org_uuids   = apm_resource_stats_query.value.cross_org_uuids
                      data_source       = apm_resource_stats_query.value.data_source
                      env               = apm_resource_stats_query.value.env
                      group_by          = apm_resource_stats_query.value.group_by
                      name              = apm_resource_stats_query.value.name
                      operation_name    = apm_resource_stats_query.value.operation_name
                      primary_tag_name  = apm_resource_stats_query.value.primary_tag_name
                      primary_tag_value = apm_resource_stats_query.value.primary_tag_value
                      resource_name     = apm_resource_stats_query.value.resource_name
                      service           = apm_resource_stats_query.value.service
                      stat              = apm_resource_stats_query.value.stat
                    }
                  }
                  dynamic "cloud_cost_query" {
                    for_each = query.value.cloud_cost_query != null ? [query.value.cloud_cost_query] : []
                    content {
                      aggregator      = cloud_cost_query.value.aggregator
                      cross_org_uuids = cloud_cost_query.value.cross_org_uuids
                      data_source     = cloud_cost_query.value.data_source
                      name            = cloud_cost_query.value.name
                      query           = cloud_cost_query.value.query
                    }
                  }
                  dynamic "event_query" {
                    for_each = query.value.event_query != null ? [query.value.event_query] : []
                    content {
                      dynamic "compute" {
                        for_each = event_query.value.compute
                        content {
                          aggregation = compute.value.aggregation
                          interval    = compute.value.interval
                          metric      = compute.value.metric
                        }
                      }
                      cross_org_uuids = event_query.value.cross_org_uuids
                      data_source     = event_query.value.data_source
                      dynamic "group_by" {
                        for_each = event_query.value.group_by != null ? event_query.value.group_by : []
                        content {
                          facet = group_by.value.facet
                          limit = group_by.value.limit
                          dynamic "sort" {
                            for_each = group_by.value.sort != null ? [group_by.value.sort] : []
                            content {
                              aggregation = sort.value.aggregation
                              metric      = sort.value.metric
                              order       = sort.value.order
                            }
                          }
                        }
                      }
                      dynamic "group_by_fields" {
                        for_each = event_query.value.group_by_fields != null ? [event_query.value.group_by_fields] : []
                        content {
                          fields = group_by_fields.value.fields
                          limit  = group_by_fields.value.limit
                          dynamic "sort" {
                            for_each = group_by_fields.value.sort != null ? [group_by_fields.value.sort] : []
                            content {
                              aggregation = sort.value.aggregation
                              metric      = sort.value.metric
                              order       = sort.value.order
                            }
                          }
                        }
                      }
                      indexes = event_query.value.indexes
                      name    = event_query.value.name
                      dynamic "search" {
                        for_each = event_query.value.search != null ? [event_query.value.search] : []
                        content {
                          query = search.value.query
                        }
                      }
                      storage = event_query.value.storage
                    }
                  }
                  dynamic "metric_query" {
                    for_each = query.value.metric_query != null ? [query.value.metric_query] : []
                    content {
                      aggregator      = metric_query.value.aggregator
                      cross_org_uuids = metric_query.value.cross_org_uuids
                      data_source     = metric_query.value.data_source
                      name            = metric_query.value.name
                      query           = metric_query.value.query
                      semantic_mode   = metric_query.value.semantic_mode
                    }
                  }
                  dynamic "process_query" {
                    for_each = query.value.process_query != null ? [query.value.process_query] : []
                    content {
                      aggregator        = process_query.value.aggregator
                      cross_org_uuids   = process_query.value.cross_org_uuids
                      data_source       = process_query.value.data_source
                      is_normalized_cpu = process_query.value.is_normalized_cpu
                      limit             = process_query.value.limit
                      metric            = process_query.value.metric
                      name              = process_query.value.name
                      sort              = process_query.value.sort
                      tag_filters       = process_query.value.tag_filters
                      text_filter       = process_query.value.text_filter
                    }
                  }
                  dynamic "slo_query" {
                    for_each = query.value.slo_query != null ? [query.value.slo_query] : []
                    content {
                      additional_query_filters = slo_query.value.additional_query_filters
                      cross_org_uuids          = slo_query.value.cross_org_uuids
                      data_source              = slo_query.value.data_source
                      group_mode               = slo_query.value.group_mode
                      measure                  = slo_query.value.measure
                      name                     = slo_query.value.name
                      slo_id                   = slo_query.value.slo_id
                      slo_query_type           = slo_query.value.slo_query_type
                    }
                  }
                }
              }
              dynamic "rum_query" {
                for_each = request.value.rum_query != null ? [request.value.rum_query] : []
                content {
                  dynamic "compute_query" {
                    for_each = rum_query.value.compute_query != null ? [rum_query.value.compute_query] : []
                    content {
                      aggregation = compute_query.value.aggregation
                      facet       = compute_query.value.facet
                      interval    = compute_query.value.interval
                    }
                  }
                  dynamic "group_by" {
                    for_each = rum_query.value.group_by != null ? rum_query.value.group_by : []
                    content {
                      facet = group_by.value.facet
                      limit = group_by.value.limit
                      dynamic "sort_query" {
                        for_each = group_by.value.sort_query != null ? [group_by.value.sort_query] : []
                        content {
                          aggregation = sort_query.value.aggregation
                          facet       = sort_query.value.facet
                          order       = sort_query.value.order
                        }
                      }
                    }
                  }
                  index = rum_query.value.index
                  dynamic "multi_compute" {
                    for_each = rum_query.value.multi_compute != null ? rum_query.value.multi_compute : []
                    content {
                      aggregation = multi_compute.value.aggregation
                      facet       = multi_compute.value.facet
                      interval    = multi_compute.value.interval
                    }
                  }
                  search_query = rum_query.value.search_query
                }
              }
              dynamic "security_query" {
                for_each = request.value.security_query != null ? [request.value.security_query] : []
                content {
                  dynamic "compute_query" {
                    for_each = security_query.value.compute_query != null ? [security_query.value.compute_query] : []
                    content {
                      aggregation = compute_query.value.aggregation
                      facet       = compute_query.value.facet
                      interval    = compute_query.value.interval
                    }
                  }
                  dynamic "group_by" {
                    for_each = security_query.value.group_by != null ? security_query.value.group_by : []
                    content {
                      facet = group_by.value.facet
                      limit = group_by.value.limit
                      dynamic "sort_query" {
                        for_each = group_by.value.sort_query != null ? [group_by.value.sort_query] : []
                        content {
                          aggregation = sort_query.value.aggregation
                          facet       = sort_query.value.facet
                          order       = sort_query.value.order
                        }
                      }
                    }
                  }
                  index = security_query.value.index
                  dynamic "multi_compute" {
                    for_each = security_query.value.multi_compute != null ? security_query.value.multi_compute : []
                    content {
                      aggregation = multi_compute.value.aggregation
                      facet       = multi_compute.value.facet
                      interval    = multi_compute.value.interval
                    }
                  }
                  search_query = security_query.value.search_query
                }
              }
              dynamic "style" {
                for_each = request.value.style != null ? [request.value.style] : []
                content {
                  has_value_labels = style.value.has_value_labels
                  line_type        = style.value.line_type
                  line_width       = style.value.line_width
                  order_by         = style.value.order_by
                  palette          = style.value.palette
                }
              }
            }
          }
          dynamic "right_yaxis" {
            for_each = timeseries_definition.value.right_yaxis != null ? [timeseries_definition.value.right_yaxis] : []
            content {
              include_zero = right_yaxis.value.include_zero
              label        = right_yaxis.value.label
              max          = right_yaxis.value.max
              min          = right_yaxis.value.min
              scale        = right_yaxis.value.scale
            }
          }
          show_legend = timeseries_definition.value.show_legend
          title       = timeseries_definition.value.title
          title_align = timeseries_definition.value.title_align
          title_size  = timeseries_definition.value.title_size
          dynamic "yaxis" {
            for_each = timeseries_definition.value.yaxis != null ? [timeseries_definition.value.yaxis] : []
            content {
              include_zero = yaxis.value.include_zero
              label        = yaxis.value.label
              max          = yaxis.value.max
              min          = yaxis.value.min
              scale        = yaxis.value.scale
            }
          }
        }
      }
      dynamic "toplist_definition" {
        for_each = widget.value.toplist_definition != null ? [widget.value.toplist_definition] : []
        content {
          dynamic "custom_link" {
            for_each = toplist_definition.value.custom_link != null ? toplist_definition.value.custom_link : []
            content {
              is_hidden      = custom_link.value.is_hidden
              label          = custom_link.value.label
              link           = custom_link.value.link
              override_label = custom_link.value.override_label
            }
          }
          description               = toplist_definition.value.description
          hide_incomplete_cost_data = toplist_definition.value.hide_incomplete_cost_data
          live_span                 = toplist_definition.value.live_span
          dynamic "request" {
            for_each = toplist_definition.value.request != null ? toplist_definition.value.request : []
            content {
              dynamic "apm_query" {
                for_each = request.value.apm_query != null ? [request.value.apm_query] : []
                content {
                  dynamic "compute_query" {
                    for_each = apm_query.value.compute_query != null ? [apm_query.value.compute_query] : []
                    content {
                      aggregation = compute_query.value.aggregation
                      facet       = compute_query.value.facet
                      interval    = compute_query.value.interval
                    }
                  }
                  dynamic "group_by" {
                    for_each = apm_query.value.group_by != null ? apm_query.value.group_by : []
                    content {
                      facet = group_by.value.facet
                      limit = group_by.value.limit
                      dynamic "sort_query" {
                        for_each = group_by.value.sort_query != null ? [group_by.value.sort_query] : []
                        content {
                          aggregation = sort_query.value.aggregation
                          facet       = sort_query.value.facet
                          order       = sort_query.value.order
                        }
                      }
                    }
                  }
                  index = apm_query.value.index
                  dynamic "multi_compute" {
                    for_each = apm_query.value.multi_compute != null ? apm_query.value.multi_compute : []
                    content {
                      aggregation = multi_compute.value.aggregation
                      facet       = multi_compute.value.facet
                      interval    = multi_compute.value.interval
                    }
                  }
                  search_query = apm_query.value.search_query
                }
              }
              dynamic "audit_query" {
                for_each = request.value.audit_query != null ? [request.value.audit_query] : []
                content {
                  dynamic "compute_query" {
                    for_each = audit_query.value.compute_query != null ? [audit_query.value.compute_query] : []
                    content {
                      aggregation = compute_query.value.aggregation
                      facet       = compute_query.value.facet
                      interval    = compute_query.value.interval
                    }
                  }
                  dynamic "group_by" {
                    for_each = audit_query.value.group_by != null ? audit_query.value.group_by : []
                    content {
                      facet = group_by.value.facet
                      limit = group_by.value.limit
                      dynamic "sort_query" {
                        for_each = group_by.value.sort_query != null ? [group_by.value.sort_query] : []
                        content {
                          aggregation = sort_query.value.aggregation
                          facet       = sort_query.value.facet
                          order       = sort_query.value.order
                        }
                      }
                    }
                  }
                  index = audit_query.value.index
                  dynamic "multi_compute" {
                    for_each = audit_query.value.multi_compute != null ? audit_query.value.multi_compute : []
                    content {
                      aggregation = multi_compute.value.aggregation
                      facet       = multi_compute.value.facet
                      interval    = multi_compute.value.interval
                    }
                  }
                  search_query = audit_query.value.search_query
                }
              }
              dynamic "conditional_formats" {
                for_each = request.value.conditional_formats != null ? request.value.conditional_formats : []
                content {
                  comparator      = conditional_formats.value.comparator
                  custom_bg_color = conditional_formats.value.custom_bg_color
                  custom_fg_color = conditional_formats.value.custom_fg_color
                  hide_value      = conditional_formats.value.hide_value
                  image_url       = conditional_formats.value.image_url
                  metric          = conditional_formats.value.metric
                  palette         = conditional_formats.value.palette
                  timeframe       = conditional_formats.value.timeframe
                  value           = conditional_formats.value.value
                }
              }
              dynamic "formula" {
                for_each = request.value.formula != null ? request.value.formula : []
                content {
                  alias             = formula.value.alias
                  cell_display_mode = formula.value.cell_display_mode
                  dynamic "conditional_formats" {
                    for_each = formula.value.conditional_formats != null ? formula.value.conditional_formats : []
                    content {
                      comparator      = conditional_formats.value.comparator
                      custom_bg_color = conditional_formats.value.custom_bg_color
                      custom_fg_color = conditional_formats.value.custom_fg_color
                      hide_value      = conditional_formats.value.hide_value
                      image_url       = conditional_formats.value.image_url
                      metric          = conditional_formats.value.metric
                      palette         = conditional_formats.value.palette
                      timeframe       = conditional_formats.value.timeframe
                      value           = conditional_formats.value.value
                    }
                  }
                  formula_expression = formula.value.formula_expression
                  dynamic "limit" {
                    for_each = formula.value.limit != null ? [formula.value.limit] : []
                    content {
                      count = limit.value.count
                      order = limit.value.order
                    }
                  }
                  dynamic "number_format" {
                    for_each = formula.value.number_format != null ? [formula.value.number_format] : []
                    content {
                      unit {
                        dynamic "canonical" {
                          for_each = number_format.value.unit.canonical != null ? [number_format.value.unit.canonical] : []
                          content {
                            per_unit_name = canonical.value.per_unit_name
                            unit_name     = canonical.value.unit_name
                          }
                        }
                        dynamic "custom" {
                          for_each = number_format.value.unit.custom != null ? [number_format.value.unit.custom] : []
                          content {
                            label = custom.value.label
                          }
                        }
                      }
                      dynamic "unit_scale" {
                        for_each = number_format.value.unit_scale != null ? [number_format.value.unit_scale] : []
                        content {
                          unit_name = unit_scale.value.unit_name
                        }
                      }
                    }
                  }
                  dynamic "style" {
                    for_each = formula.value.style != null ? [formula.value.style] : []
                    content {
                      palette       = style.value.palette
                      palette_index = style.value.palette_index
                    }
                  }
                }
              }
              dynamic "log_query" {
                for_each = request.value.log_query != null ? [request.value.log_query] : []
                content {
                  dynamic "compute_query" {
                    for_each = log_query.value.compute_query != null ? [log_query.value.compute_query] : []
                    content {
                      aggregation = compute_query.value.aggregation
                      facet       = compute_query.value.facet
                      interval    = compute_query.value.interval
                    }
                  }
                  dynamic "group_by" {
                    for_each = log_query.value.group_by != null ? log_query.value.group_by : []
                    content {
                      facet = group_by.value.facet
                      limit = group_by.value.limit
                      dynamic "sort_query" {
                        for_each = group_by.value.sort_query != null ? [group_by.value.sort_query] : []
                        content {
                          aggregation = sort_query.value.aggregation
                          facet       = sort_query.value.facet
                          order       = sort_query.value.order
                        }
                      }
                    }
                  }
                  index = log_query.value.index
                  dynamic "multi_compute" {
                    for_each = log_query.value.multi_compute != null ? log_query.value.multi_compute : []
                    content {
                      aggregation = multi_compute.value.aggregation
                      facet       = multi_compute.value.facet
                      interval    = multi_compute.value.interval
                    }
                  }
                  search_query = log_query.value.search_query
                }
              }
              dynamic "process_query" {
                for_each = request.value.process_query != null ? [request.value.process_query] : []
                content {
                  filter_by = process_query.value.filter_by
                  limit     = process_query.value.limit
                  metric    = process_query.value.metric
                  search_by = process_query.value.search_by
                }
              }
              q = request.value.q
              dynamic "query" {
                for_each = request.value.query != null ? request.value.query : []
                content {
                  dynamic "apm_dependency_stats_query" {
                    for_each = query.value.apm_dependency_stats_query != null ? [query.value.apm_dependency_stats_query] : []
                    content {
                      cross_org_uuids   = apm_dependency_stats_query.value.cross_org_uuids
                      data_source       = apm_dependency_stats_query.value.data_source
                      env               = apm_dependency_stats_query.value.env
                      is_upstream       = apm_dependency_stats_query.value.is_upstream
                      name              = apm_dependency_stats_query.value.name
                      operation_name    = apm_dependency_stats_query.value.operation_name
                      primary_tag_name  = apm_dependency_stats_query.value.primary_tag_name
                      primary_tag_value = apm_dependency_stats_query.value.primary_tag_value
                      resource_name     = apm_dependency_stats_query.value.resource_name
                      service           = apm_dependency_stats_query.value.service
                      stat              = apm_dependency_stats_query.value.stat
                    }
                  }
                  dynamic "apm_resource_stats_query" {
                    for_each = query.value.apm_resource_stats_query != null ? [query.value.apm_resource_stats_query] : []
                    content {
                      cross_org_uuids   = apm_resource_stats_query.value.cross_org_uuids
                      data_source       = apm_resource_stats_query.value.data_source
                      env               = apm_resource_stats_query.value.env
                      group_by          = apm_resource_stats_query.value.group_by
                      name              = apm_resource_stats_query.value.name
                      operation_name    = apm_resource_stats_query.value.operation_name
                      primary_tag_name  = apm_resource_stats_query.value.primary_tag_name
                      primary_tag_value = apm_resource_stats_query.value.primary_tag_value
                      resource_name     = apm_resource_stats_query.value.resource_name
                      service           = apm_resource_stats_query.value.service
                      stat              = apm_resource_stats_query.value.stat
                    }
                  }
                  dynamic "cloud_cost_query" {
                    for_each = query.value.cloud_cost_query != null ? [query.value.cloud_cost_query] : []
                    content {
                      aggregator      = cloud_cost_query.value.aggregator
                      cross_org_uuids = cloud_cost_query.value.cross_org_uuids
                      data_source     = cloud_cost_query.value.data_source
                      name            = cloud_cost_query.value.name
                      query           = cloud_cost_query.value.query
                    }
                  }
                  dynamic "event_query" {
                    for_each = query.value.event_query != null ? [query.value.event_query] : []
                    content {
                      dynamic "compute" {
                        for_each = event_query.value.compute
                        content {
                          aggregation = compute.value.aggregation
                          interval    = compute.value.interval
                          metric      = compute.value.metric
                        }
                      }
                      cross_org_uuids = event_query.value.cross_org_uuids
                      data_source     = event_query.value.data_source
                      dynamic "group_by" {
                        for_each = event_query.value.group_by != null ? event_query.value.group_by : []
                        content {
                          facet = group_by.value.facet
                          limit = group_by.value.limit
                          dynamic "sort" {
                            for_each = group_by.value.sort != null ? [group_by.value.sort] : []
                            content {
                              aggregation = sort.value.aggregation
                              metric      = sort.value.metric
                              order       = sort.value.order
                            }
                          }
                        }
                      }
                      dynamic "group_by_fields" {
                        for_each = event_query.value.group_by_fields != null ? [event_query.value.group_by_fields] : []
                        content {
                          fields = group_by_fields.value.fields
                          limit  = group_by_fields.value.limit
                          dynamic "sort" {
                            for_each = group_by_fields.value.sort != null ? [group_by_fields.value.sort] : []
                            content {
                              aggregation = sort.value.aggregation
                              metric      = sort.value.metric
                              order       = sort.value.order
                            }
                          }
                        }
                      }
                      indexes = event_query.value.indexes
                      name    = event_query.value.name
                      dynamic "search" {
                        for_each = event_query.value.search != null ? [event_query.value.search] : []
                        content {
                          query = search.value.query
                        }
                      }
                      storage = event_query.value.storage
                    }
                  }
                  dynamic "metric_query" {
                    for_each = query.value.metric_query != null ? [query.value.metric_query] : []
                    content {
                      aggregator      = metric_query.value.aggregator
                      cross_org_uuids = metric_query.value.cross_org_uuids
                      data_source     = metric_query.value.data_source
                      name            = metric_query.value.name
                      query           = metric_query.value.query
                      semantic_mode   = metric_query.value.semantic_mode
                    }
                  }
                  dynamic "process_query" {
                    for_each = query.value.process_query != null ? [query.value.process_query] : []
                    content {
                      aggregator        = process_query.value.aggregator
                      cross_org_uuids   = process_query.value.cross_org_uuids
                      data_source       = process_query.value.data_source
                      is_normalized_cpu = process_query.value.is_normalized_cpu
                      limit             = process_query.value.limit
                      metric            = process_query.value.metric
                      name              = process_query.value.name
                      sort              = process_query.value.sort
                      tag_filters       = process_query.value.tag_filters
                      text_filter       = process_query.value.text_filter
                    }
                  }
                  dynamic "slo_query" {
                    for_each = query.value.slo_query != null ? [query.value.slo_query] : []
                    content {
                      additional_query_filters = slo_query.value.additional_query_filters
                      cross_org_uuids          = slo_query.value.cross_org_uuids
                      data_source              = slo_query.value.data_source
                      group_mode               = slo_query.value.group_mode
                      measure                  = slo_query.value.measure
                      name                     = slo_query.value.name
                      slo_id                   = slo_query.value.slo_id
                      slo_query_type           = slo_query.value.slo_query_type
                    }
                  }
                }
              }
              dynamic "rum_query" {
                for_each = request.value.rum_query != null ? [request.value.rum_query] : []
                content {
                  dynamic "compute_query" {
                    for_each = rum_query.value.compute_query != null ? [rum_query.value.compute_query] : []
                    content {
                      aggregation = compute_query.value.aggregation
                      facet       = compute_query.value.facet
                      interval    = compute_query.value.interval
                    }
                  }
                  dynamic "group_by" {
                    for_each = rum_query.value.group_by != null ? rum_query.value.group_by : []
                    content {
                      facet = group_by.value.facet
                      limit = group_by.value.limit
                      dynamic "sort_query" {
                        for_each = group_by.value.sort_query != null ? [group_by.value.sort_query] : []
                        content {
                          aggregation = sort_query.value.aggregation
                          facet       = sort_query.value.facet
                          order       = sort_query.value.order
                        }
                      }
                    }
                  }
                  index = rum_query.value.index
                  dynamic "multi_compute" {
                    for_each = rum_query.value.multi_compute != null ? rum_query.value.multi_compute : []
                    content {
                      aggregation = multi_compute.value.aggregation
                      facet       = multi_compute.value.facet
                      interval    = multi_compute.value.interval
                    }
                  }
                  search_query = rum_query.value.search_query
                }
              }
              dynamic "security_query" {
                for_each = request.value.security_query != null ? [request.value.security_query] : []
                content {
                  dynamic "compute_query" {
                    for_each = security_query.value.compute_query != null ? [security_query.value.compute_query] : []
                    content {
                      aggregation = compute_query.value.aggregation
                      facet       = compute_query.value.facet
                      interval    = compute_query.value.interval
                    }
                  }
                  dynamic "group_by" {
                    for_each = security_query.value.group_by != null ? security_query.value.group_by : []
                    content {
                      facet = group_by.value.facet
                      limit = group_by.value.limit
                      dynamic "sort_query" {
                        for_each = group_by.value.sort_query != null ? [group_by.value.sort_query] : []
                        content {
                          aggregation = sort_query.value.aggregation
                          facet       = sort_query.value.facet
                          order       = sort_query.value.order
                        }
                      }
                    }
                  }
                  index = security_query.value.index
                  dynamic "multi_compute" {
                    for_each = security_query.value.multi_compute != null ? security_query.value.multi_compute : []
                    content {
                      aggregation = multi_compute.value.aggregation
                      facet       = multi_compute.value.facet
                      interval    = multi_compute.value.interval
                    }
                  }
                  search_query = security_query.value.search_query
                }
              }
              dynamic "style" {
                for_each = request.value.style != null ? [request.value.style] : []
                content {
                  palette = style.value.palette
                }
              }
            }
          }
          dynamic "style" {
            for_each = toplist_definition.value.style != null ? toplist_definition.value.style : []
            content {
              dynamic "display" {
                for_each = style.value.display != null ? style.value.display : []
                content {
                  type = display.value.type
                }
              }
              palette = style.value.palette
              scaling = style.value.scaling
            }
          }
          title       = toplist_definition.value.title
          title_align = toplist_definition.value.title_align
          title_size  = toplist_definition.value.title_size
        }
      }
      dynamic "topology_map_definition" {
        for_each = widget.value.topology_map_definition != null ? [widget.value.topology_map_definition] : []
        content {
          dynamic "custom_link" {
            for_each = topology_map_definition.value.custom_link != null ? topology_map_definition.value.custom_link : []
            content {
              is_hidden      = custom_link.value.is_hidden
              label          = custom_link.value.label
              link           = custom_link.value.link
              override_label = custom_link.value.override_label
            }
          }
          description = topology_map_definition.value.description
          dynamic "request" {
            for_each = topology_map_definition.value.request != null ? topology_map_definition.value.request : []
            content {
              dynamic "query" {
                for_each = request.value.query
                content {
                  data_source = query.value.data_source
                  filters     = query.value.filters
                  service     = query.value.service
                }
              }
              request_type = request.value.request_type
            }
          }
          title       = topology_map_definition.value.title
          title_align = topology_map_definition.value.title_align
          title_size  = topology_map_definition.value.title_size
        }
      }
      dynamic "trace_service_definition" {
        for_each = widget.value.trace_service_definition != null ? [widget.value.trace_service_definition] : []
        content {
          display_format            = trace_service_definition.value.display_format
          env                       = trace_service_definition.value.env
          hide_incomplete_cost_data = trace_service_definition.value.hide_incomplete_cost_data
          live_span                 = trace_service_definition.value.live_span
          service                   = trace_service_definition.value.service
          show_breakdown            = trace_service_definition.value.show_breakdown
          show_distribution         = trace_service_definition.value.show_distribution
          show_errors               = trace_service_definition.value.show_errors
          show_hits                 = trace_service_definition.value.show_hits
          show_latency              = trace_service_definition.value.show_latency
          show_resource_list        = trace_service_definition.value.show_resource_list
          size_format               = trace_service_definition.value.size_format
          span_name                 = trace_service_definition.value.span_name
          title                     = trace_service_definition.value.title
          title_align               = trace_service_definition.value.title_align
          title_size                = trace_service_definition.value.title_size
        }
      }
      dynamic "treemap_definition" {
        for_each = widget.value.treemap_definition != null ? [widget.value.treemap_definition] : []
        content {
          dynamic "custom_links" {
            for_each = treemap_definition.value.custom_links != null ? treemap_definition.value.custom_links : []
            content {
              is_hidden      = custom_links.value.is_hidden
              label          = custom_links.value.label
              link           = custom_links.value.link
              override_label = custom_links.value.override_label
            }
          }
          description = treemap_definition.value.description
          dynamic "request" {
            for_each = treemap_definition.value.request != null ? treemap_definition.value.request : []
            content {
              dynamic "formula" {
                for_each = request.value.formula != null ? request.value.formula : []
                content {
                  alias             = formula.value.alias
                  cell_display_mode = formula.value.cell_display_mode
                  dynamic "conditional_formats" {
                    for_each = formula.value.conditional_formats != null ? formula.value.conditional_formats : []
                    content {
                      comparator      = conditional_formats.value.comparator
                      custom_bg_color = conditional_formats.value.custom_bg_color
                      custom_fg_color = conditional_formats.value.custom_fg_color
                      hide_value      = conditional_formats.value.hide_value
                      image_url       = conditional_formats.value.image_url
                      metric          = conditional_formats.value.metric
                      palette         = conditional_formats.value.palette
                      timeframe       = conditional_formats.value.timeframe
                      value           = conditional_formats.value.value
                    }
                  }
                  formula_expression = formula.value.formula_expression
                  dynamic "limit" {
                    for_each = formula.value.limit != null ? [formula.value.limit] : []
                    content {
                      count = limit.value.count
                      order = limit.value.order
                    }
                  }
                  dynamic "number_format" {
                    for_each = formula.value.number_format != null ? [formula.value.number_format] : []
                    content {
                      unit {
                        dynamic "canonical" {
                          for_each = number_format.value.unit.canonical != null ? [number_format.value.unit.canonical] : []
                          content {
                            per_unit_name = canonical.value.per_unit_name
                            unit_name     = canonical.value.unit_name
                          }
                        }
                        dynamic "custom" {
                          for_each = number_format.value.unit.custom != null ? [number_format.value.unit.custom] : []
                          content {
                            label = custom.value.label
                          }
                        }
                      }
                      dynamic "unit_scale" {
                        for_each = number_format.value.unit_scale != null ? [number_format.value.unit_scale] : []
                        content {
                          unit_name = unit_scale.value.unit_name
                        }
                      }
                    }
                  }
                  dynamic "style" {
                    for_each = formula.value.style != null ? [formula.value.style] : []
                    content {
                      palette       = style.value.palette
                      palette_index = style.value.palette_index
                    }
                  }
                }
              }
              dynamic "query" {
                for_each = request.value.query != null ? request.value.query : []
                content {
                  dynamic "apm_dependency_stats_query" {
                    for_each = query.value.apm_dependency_stats_query != null ? [query.value.apm_dependency_stats_query] : []
                    content {
                      cross_org_uuids   = apm_dependency_stats_query.value.cross_org_uuids
                      data_source       = apm_dependency_stats_query.value.data_source
                      env               = apm_dependency_stats_query.value.env
                      is_upstream       = apm_dependency_stats_query.value.is_upstream
                      name              = apm_dependency_stats_query.value.name
                      operation_name    = apm_dependency_stats_query.value.operation_name
                      primary_tag_name  = apm_dependency_stats_query.value.primary_tag_name
                      primary_tag_value = apm_dependency_stats_query.value.primary_tag_value
                      resource_name     = apm_dependency_stats_query.value.resource_name
                      service           = apm_dependency_stats_query.value.service
                      stat              = apm_dependency_stats_query.value.stat
                    }
                  }
                  dynamic "apm_resource_stats_query" {
                    for_each = query.value.apm_resource_stats_query != null ? [query.value.apm_resource_stats_query] : []
                    content {
                      cross_org_uuids   = apm_resource_stats_query.value.cross_org_uuids
                      data_source       = apm_resource_stats_query.value.data_source
                      env               = apm_resource_stats_query.value.env
                      group_by          = apm_resource_stats_query.value.group_by
                      name              = apm_resource_stats_query.value.name
                      operation_name    = apm_resource_stats_query.value.operation_name
                      primary_tag_name  = apm_resource_stats_query.value.primary_tag_name
                      primary_tag_value = apm_resource_stats_query.value.primary_tag_value
                      resource_name     = apm_resource_stats_query.value.resource_name
                      service           = apm_resource_stats_query.value.service
                      stat              = apm_resource_stats_query.value.stat
                    }
                  }
                  dynamic "cloud_cost_query" {
                    for_each = query.value.cloud_cost_query != null ? [query.value.cloud_cost_query] : []
                    content {
                      aggregator      = cloud_cost_query.value.aggregator
                      cross_org_uuids = cloud_cost_query.value.cross_org_uuids
                      data_source     = cloud_cost_query.value.data_source
                      name            = cloud_cost_query.value.name
                      query           = cloud_cost_query.value.query
                    }
                  }
                  dynamic "event_query" {
                    for_each = query.value.event_query != null ? [query.value.event_query] : []
                    content {
                      dynamic "compute" {
                        for_each = event_query.value.compute
                        content {
                          aggregation = compute.value.aggregation
                          interval    = compute.value.interval
                          metric      = compute.value.metric
                        }
                      }
                      cross_org_uuids = event_query.value.cross_org_uuids
                      data_source     = event_query.value.data_source
                      dynamic "group_by" {
                        for_each = event_query.value.group_by != null ? event_query.value.group_by : []
                        content {
                          facet = group_by.value.facet
                          limit = group_by.value.limit
                          dynamic "sort" {
                            for_each = group_by.value.sort != null ? [group_by.value.sort] : []
                            content {
                              aggregation = sort.value.aggregation
                              metric      = sort.value.metric
                              order       = sort.value.order
                            }
                          }
                        }
                      }
                      dynamic "group_by_fields" {
                        for_each = event_query.value.group_by_fields != null ? [event_query.value.group_by_fields] : []
                        content {
                          fields = group_by_fields.value.fields
                          limit  = group_by_fields.value.limit
                          dynamic "sort" {
                            for_each = group_by_fields.value.sort != null ? [group_by_fields.value.sort] : []
                            content {
                              aggregation = sort.value.aggregation
                              metric      = sort.value.metric
                              order       = sort.value.order
                            }
                          }
                        }
                      }
                      indexes = event_query.value.indexes
                      name    = event_query.value.name
                      dynamic "search" {
                        for_each = event_query.value.search != null ? [event_query.value.search] : []
                        content {
                          query = search.value.query
                        }
                      }
                      storage = event_query.value.storage
                    }
                  }
                  dynamic "metric_query" {
                    for_each = query.value.metric_query != null ? [query.value.metric_query] : []
                    content {
                      aggregator      = metric_query.value.aggregator
                      cross_org_uuids = metric_query.value.cross_org_uuids
                      data_source     = metric_query.value.data_source
                      name            = metric_query.value.name
                      query           = metric_query.value.query
                      semantic_mode   = metric_query.value.semantic_mode
                    }
                  }
                  dynamic "process_query" {
                    for_each = query.value.process_query != null ? [query.value.process_query] : []
                    content {
                      aggregator        = process_query.value.aggregator
                      cross_org_uuids   = process_query.value.cross_org_uuids
                      data_source       = process_query.value.data_source
                      is_normalized_cpu = process_query.value.is_normalized_cpu
                      limit             = process_query.value.limit
                      metric            = process_query.value.metric
                      name              = process_query.value.name
                      sort              = process_query.value.sort
                      tag_filters       = process_query.value.tag_filters
                      text_filter       = process_query.value.text_filter
                    }
                  }
                  dynamic "slo_query" {
                    for_each = query.value.slo_query != null ? [query.value.slo_query] : []
                    content {
                      additional_query_filters = slo_query.value.additional_query_filters
                      cross_org_uuids          = slo_query.value.cross_org_uuids
                      data_source              = slo_query.value.data_source
                      group_mode               = slo_query.value.group_mode
                      measure                  = slo_query.value.measure
                      name                     = slo_query.value.name
                      slo_id                   = slo_query.value.slo_id
                      slo_query_type           = slo_query.value.slo_query_type
                    }
                  }
                }
              }
            }
          }
          title = treemap_definition.value.title
        }
      }
      dynamic "widget_layout" {
        for_each = widget.value.widget_layout != null ? [widget.value.widget_layout] : []
        content {
          height          = widget_layout.value.height
          is_column_break = widget_layout.value.is_column_break
          width           = widget_layout.value.width
          x               = widget_layout.value.x
          y               = widget_layout.value.y
        }
      }
    }
  }
}

