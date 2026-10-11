variable "powerpacks" {
  description = <<EOT
Map of powerpacks, attributes below
Optional:
    - description
    - live_span
    - name
    - show_title
    - tags
    - layout (block):
        - height (optional)
        - width (optional)
        - x (optional)
        - y (optional)
    - template_variables (block):
        - defaults (optional)
        - name (required)
    - widget (block):
        - alert_graph_definition (optional, block):
            - alert_id (required)
            - hide_incomplete_cost_data (optional)
            - live_span (optional)
            - title (optional)
            - title_align (optional)
            - title_size (optional)
            - viz_type (required)
        - alert_value_definition (optional, block):
            - alert_id (required)
            - description (optional)
            - precision (optional)
            - text_align (optional)
            - title (optional)
            - title_align (optional)
            - title_size (optional)
            - unit (optional)
        - change_definition (optional, block):
            - custom_link (optional, block):
                - is_hidden (optional)
                - label (optional)
                - link (optional)
                - override_label (optional)
            - description (optional)
            - hide_incomplete_cost_data (optional)
            - live_span (optional)
            - request (optional, block):
                - apm_query (optional, block):
                    - compute_query (optional, block):
                        - aggregation (required)
                        - facet (optional)
                        - interval (optional)
                    - group_by (optional, block):
                        - facet (optional)
                        - limit (optional)
                        - sort_query (optional, block):
                            - aggregation (required)
                            - facet (optional)
                            - order (required)
                    - index (required)
                    - multi_compute (optional, block):
                        - aggregation (required)
                        - facet (optional)
                        - interval (optional)
                    - search_query (optional)
                - change_type (optional)
                - compare_to (optional)
                - formula (optional, block):
                    - alias (optional)
                    - cell_display_mode (optional)
                    - conditional_formats (optional, block):
                        - comparator (required)
                        - custom_bg_color (optional)
                        - custom_fg_color (optional)
                        - hide_value (optional)
                        - image_url (optional)
                        - metric (optional)
                        - palette (required)
                        - timeframe (optional)
                        - value (required)
                    - formula_expression (required)
                    - limit (optional, block):
                        - count (optional)
                        - order (optional)
                    - number_format (optional, block):
                        - unit (required, block):
                            - canonical (optional, block):
                                - per_unit_name (optional)
                                - unit_name (required)
                            - custom (optional, block):
                                - label (required)
                        - unit_scale (optional, block):
                            - unit_name (required)
                    - style (optional, block):
                        - palette (optional)
                        - palette_index (optional)
                - increase_good (optional)
                - log_query (optional, block):
                    - compute_query (optional, block):
                        - aggregation (required)
                        - facet (optional)
                        - interval (optional)
                    - group_by (optional, block):
                        - facet (optional)
                        - limit (optional)
                        - sort_query (optional, block):
                            - aggregation (required)
                            - facet (optional)
                            - order (required)
                    - index (required)
                    - multi_compute (optional, block):
                        - aggregation (required)
                        - facet (optional)
                        - interval (optional)
                    - search_query (optional)
                - order_by (optional)
                - order_dir (optional)
                - process_query (optional, block):
                    - filter_by (optional)
                    - limit (optional)
                    - metric (required)
                    - search_by (optional)
                - q (optional)
                - query (optional, block):
                    - apm_dependency_stats_query (optional, block):
                        - cross_org_uuids (optional)
                        - data_source (required)
                        - env (required)
                        - is_upstream (optional)
                        - name (required)
                        - operation_name (required)
                        - primary_tag_name (optional)
                        - primary_tag_value (optional)
                        - resource_name (required)
                        - service (required)
                        - stat (required)
                    - apm_resource_stats_query (optional, block):
                        - cross_org_uuids (optional)
                        - data_source (required)
                        - env (required)
                        - group_by (optional)
                        - name (required)
                        - operation_name (optional)
                        - primary_tag_name (optional)
                        - primary_tag_value (optional)
                        - resource_name (optional)
                        - service (required)
                        - stat (required)
                    - cloud_cost_query (optional, block):
                        - aggregator (optional)
                        - cross_org_uuids (optional)
                        - data_source (required)
                        - name (required)
                        - query (required)
                    - event_query (optional, block):
                        - compute (required, block):
                            - aggregation (required)
                            - interval (optional)
                            - metric (optional)
                        - cross_org_uuids (optional)
                        - data_source (required)
                        - group_by (optional, block):
                            - facet (required)
                            - limit (optional)
                            - sort (optional, block):
                                - aggregation (required)
                                - metric (optional)
                                - order (optional)
                        - group_by_fields (optional, block):
                            - fields (required)
                            - limit (optional)
                            - sort (optional, block):
                                - aggregation (required)
                                - metric (optional)
                                - order (optional)
                        - indexes (optional)
                        - name (required)
                        - search (optional, block):
                            - query (required)
                        - storage (optional)
                    - metric_query (optional, block):
                        - aggregator (optional)
                        - cross_org_uuids (optional)
                        - data_source (optional)
                        - name (required)
                        - query (required)
                        - semantic_mode (optional)
                    - process_query (optional, block):
                        - aggregator (optional)
                        - cross_org_uuids (optional)
                        - data_source (required)
                        - is_normalized_cpu (optional)
                        - limit (optional)
                        - metric (required)
                        - name (required)
                        - sort (optional)
                        - tag_filters (optional)
                        - text_filter (optional)
                    - slo_query (optional, block):
                        - additional_query_filters (optional)
                        - cross_org_uuids (optional)
                        - data_source (required)
                        - group_mode (optional)
                        - measure (required)
                        - name (optional)
                        - slo_id (required)
                        - slo_query_type (optional)
                - rum_query (optional, block):
                    - compute_query (optional, block):
                        - aggregation (required)
                        - facet (optional)
                        - interval (optional)
                    - group_by (optional, block):
                        - facet (optional)
                        - limit (optional)
                        - sort_query (optional, block):
                            - aggregation (required)
                            - facet (optional)
                            - order (required)
                    - index (required)
                    - multi_compute (optional, block):
                        - aggregation (required)
                        - facet (optional)
                        - interval (optional)
                    - search_query (optional)
                - security_query (optional, block):
                    - compute_query (optional, block):
                        - aggregation (required)
                        - facet (optional)
                        - interval (optional)
                    - group_by (optional, block):
                        - facet (optional)
                        - limit (optional)
                        - sort_query (optional, block):
                            - aggregation (required)
                            - facet (optional)
                            - order (required)
                    - index (required)
                    - multi_compute (optional, block):
                        - aggregation (required)
                        - facet (optional)
                        - interval (optional)
                    - search_query (optional)
                - show_present (optional)
            - title (optional)
            - title_align (optional)
            - title_size (optional)
        - check_status_definition (optional, block):
            - check (required)
            - group (optional)
            - group_by (optional)
            - grouping (required)
            - hide_incomplete_cost_data (optional)
            - live_span (optional)
            - tags (optional)
            - title (optional)
            - title_align (optional)
            - title_size (optional)
        - distribution_definition (optional, block):
            - description (optional)
            - hide_incomplete_cost_data (optional)
            - legend_size (optional)
            - live_span (optional)
            - request (optional, block):
                - apm_query (optional, block):
                    - compute_query (optional, block):
                        - aggregation (required)
                        - facet (optional)
                        - interval (optional)
                    - group_by (optional, block):
                        - facet (optional)
                        - limit (optional)
                        - sort_query (optional, block):
                            - aggregation (required)
                            - facet (optional)
                            - order (required)
                    - index (required)
                    - multi_compute (optional, block):
                        - aggregation (required)
                        - facet (optional)
                        - interval (optional)
                    - search_query (optional)
                - apm_stats_query (optional, block):
                    - columns (optional, block):
                        - alias (optional)
                        - cell_display_mode (optional)
                        - name (required)
                        - order (optional)
                    - env (required)
                    - name (required)
                    - primary_tag (required)
                    - resource (optional)
                    - row_type (required)
                    - service (required)
                - log_query (optional, block):
                    - compute_query (optional, block):
                        - aggregation (required)
                        - facet (optional)
                        - interval (optional)
                    - group_by (optional, block):
                        - facet (optional)
                        - limit (optional)
                        - sort_query (optional, block):
                            - aggregation (required)
                            - facet (optional)
                            - order (required)
                    - index (required)
                    - multi_compute (optional, block):
                        - aggregation (required)
                        - facet (optional)
                        - interval (optional)
                    - search_query (optional)
                - process_query (optional, block):
                    - filter_by (optional)
                    - limit (optional)
                    - metric (required)
                    - search_by (optional)
                - q (optional)
                - rum_query (optional, block):
                    - compute_query (optional, block):
                        - aggregation (required)
                        - facet (optional)
                        - interval (optional)
                    - group_by (optional, block):
                        - facet (optional)
                        - limit (optional)
                        - sort_query (optional, block):
                            - aggregation (required)
                            - facet (optional)
                            - order (required)
                    - index (required)
                    - multi_compute (optional, block):
                        - aggregation (required)
                        - facet (optional)
                        - interval (optional)
                    - search_query (optional)
                - security_query (optional, block):
                    - compute_query (optional, block):
                        - aggregation (required)
                        - facet (optional)
                        - interval (optional)
                    - group_by (optional, block):
                        - facet (optional)
                        - limit (optional)
                        - sort_query (optional, block):
                            - aggregation (required)
                            - facet (optional)
                            - order (required)
                    - index (required)
                    - multi_compute (optional, block):
                        - aggregation (required)
                        - facet (optional)
                        - interval (optional)
                    - search_query (optional)
                - style (optional, block):
                    - palette (optional)
            - show_legend (optional)
            - title (optional)
            - title_align (optional)
            - title_size (optional)
            - xaxis (optional, block):
                - include_zero (optional)
                - max (optional)
                - min (optional)
                - scale (optional)
            - yaxis (optional, block):
                - include_zero (optional)
                - label (optional)
                - max (optional)
                - min (optional)
                - scale (optional)
        - event_stream_definition (optional, block):
            - description (optional)
            - event_size (optional)
            - hide_incomplete_cost_data (optional)
            - live_span (optional)
            - query (required)
            - tags_execution (optional)
            - title (optional)
            - title_align (optional)
            - title_size (optional)
        - event_timeline_definition (optional, block):
            - description (optional)
            - hide_incomplete_cost_data (optional)
            - live_span (optional)
            - query (required)
            - tags_execution (optional)
            - title (optional)
            - title_align (optional)
            - title_size (optional)
        - free_text_definition (optional, block):
            - color (optional)
            - description (optional)
            - font_size (optional)
            - text (required)
            - text_align (optional)
        - geomap_definition (optional, block):
            - custom_link (optional, block):
                - is_hidden (optional)
                - label (optional)
                - link (optional)
                - override_label (optional)
            - description (optional)
            - hide_incomplete_cost_data (optional)
            - live_span (optional)
            - request (optional, block):
                - formula (optional, block):
                    - alias (optional)
                    - cell_display_mode (optional)
                    - conditional_formats (optional, block):
                        - comparator (required)
                        - custom_bg_color (optional)
                        - custom_fg_color (optional)
                        - hide_value (optional)
                        - image_url (optional)
                        - metric (optional)
                        - palette (required)
                        - timeframe (optional)
                        - value (required)
                    - formula_expression (required)
                    - limit (optional, block):
                        - count (optional)
                        - order (optional)
                    - number_format (optional, block):
                        - unit (required, block):
                            - canonical (optional, block):
                                - per_unit_name (optional)
                                - unit_name (required)
                            - custom (optional, block):
                                - label (required)
                        - unit_scale (optional, block):
                            - unit_name (required)
                    - style (optional, block):
                        - palette (optional)
                        - palette_index (optional)
                - log_query (optional, block):
                    - compute_query (optional, block):
                        - aggregation (required)
                        - facet (optional)
                        - interval (optional)
                    - group_by (optional, block):
                        - facet (optional)
                        - limit (optional)
                        - sort_query (optional, block):
                            - aggregation (required)
                            - facet (optional)
                            - order (required)
                    - index (required)
                    - multi_compute (optional, block):
                        - aggregation (required)
                        - facet (optional)
                        - interval (optional)
                    - search_query (optional)
                - q (optional)
                - query (optional, block):
                    - apm_dependency_stats_query (optional, block):
                        - cross_org_uuids (optional)
                        - data_source (required)
                        - env (required)
                        - is_upstream (optional)
                        - name (required)
                        - operation_name (required)
                        - primary_tag_name (optional)
                        - primary_tag_value (optional)
                        - resource_name (required)
                        - service (required)
                        - stat (required)
                    - apm_resource_stats_query (optional, block):
                        - cross_org_uuids (optional)
                        - data_source (required)
                        - env (required)
                        - group_by (optional)
                        - name (required)
                        - operation_name (optional)
                        - primary_tag_name (optional)
                        - primary_tag_value (optional)
                        - resource_name (optional)
                        - service (required)
                        - stat (required)
                    - cloud_cost_query (optional, block):
                        - aggregator (optional)
                        - cross_org_uuids (optional)
                        - data_source (required)
                        - name (required)
                        - query (required)
                    - event_query (optional, block):
                        - compute (required, block):
                            - aggregation (required)
                            - interval (optional)
                            - metric (optional)
                        - cross_org_uuids (optional)
                        - data_source (required)
                        - group_by (optional, block):
                            - facet (required)
                            - limit (optional)
                            - sort (optional, block):
                                - aggregation (required)
                                - metric (optional)
                                - order (optional)
                        - group_by_fields (optional, block):
                            - fields (required)
                            - limit (optional)
                            - sort (optional, block):
                                - aggregation (required)
                                - metric (optional)
                                - order (optional)
                        - indexes (optional)
                        - name (required)
                        - search (optional, block):
                            - query (required)
                        - storage (optional)
                    - metric_query (optional, block):
                        - aggregator (optional)
                        - cross_org_uuids (optional)
                        - data_source (optional)
                        - name (required)
                        - query (required)
                        - semantic_mode (optional)
                    - process_query (optional, block):
                        - aggregator (optional)
                        - cross_org_uuids (optional)
                        - data_source (required)
                        - is_normalized_cpu (optional)
                        - limit (optional)
                        - metric (required)
                        - name (required)
                        - sort (optional)
                        - tag_filters (optional)
                        - text_filter (optional)
                    - slo_query (optional, block):
                        - additional_query_filters (optional)
                        - cross_org_uuids (optional)
                        - data_source (required)
                        - group_mode (optional)
                        - measure (required)
                        - name (optional)
                        - slo_id (required)
                        - slo_query_type (optional)
                - rum_query (optional, block):
                    - compute_query (optional, block):
                        - aggregation (required)
                        - facet (optional)
                        - interval (optional)
                    - group_by (optional, block):
                        - facet (optional)
                        - limit (optional)
                        - sort_query (optional, block):
                            - aggregation (required)
                            - facet (optional)
                            - order (required)
                    - index (required)
                    - multi_compute (optional, block):
                        - aggregation (required)
                        - facet (optional)
                        - interval (optional)
                    - search_query (optional)
            - style (optional, block):
                - palette (required)
                - palette_flip (required)
            - title (optional)
            - title_align (optional)
            - title_size (optional)
            - view (required, block):
                - focus (required)
        - heatmap_definition (optional, block):
            - custom_link (optional, block):
                - is_hidden (optional)
                - label (optional)
                - link (optional)
                - override_label (optional)
            - description (optional)
            - event (optional, block):
                - q (required)
                - tags_execution (optional)
            - hide_incomplete_cost_data (optional)
            - legend_size (optional)
            - live_span (optional)
            - request (optional, block):
                - apm_query (optional, block):
                    - compute_query (optional, block):
                        - aggregation (required)
                        - facet (optional)
                        - interval (optional)
                    - group_by (optional, block):
                        - facet (optional)
                        - limit (optional)
                        - sort_query (optional, block):
                            - aggregation (required)
                            - facet (optional)
                            - order (required)
                    - index (required)
                    - multi_compute (optional, block):
                        - aggregation (required)
                        - facet (optional)
                        - interval (optional)
                    - search_query (optional)
                - formula (optional, block):
                    - alias (optional)
                    - cell_display_mode (optional)
                    - conditional_formats (optional, block):
                        - comparator (required)
                        - custom_bg_color (optional)
                        - custom_fg_color (optional)
                        - hide_value (optional)
                        - image_url (optional)
                        - metric (optional)
                        - palette (required)
                        - timeframe (optional)
                        - value (required)
                    - formula_expression (required)
                    - limit (optional, block):
                        - count (optional)
                        - order (optional)
                    - number_format (optional, block):
                        - unit (required, block):
                            - canonical (optional, block):
                                - per_unit_name (optional)
                                - unit_name (required)
                            - custom (optional, block):
                                - label (required)
                        - unit_scale (optional, block):
                            - unit_name (required)
                    - style (optional, block):
                        - palette (optional)
                        - palette_index (optional)
                - log_query (optional, block):
                    - compute_query (optional, block):
                        - aggregation (required)
                        - facet (optional)
                        - interval (optional)
                    - group_by (optional, block):
                        - facet (optional)
                        - limit (optional)
                        - sort_query (optional, block):
                            - aggregation (required)
                            - facet (optional)
                            - order (required)
                    - index (required)
                    - multi_compute (optional, block):
                        - aggregation (required)
                        - facet (optional)
                        - interval (optional)
                    - search_query (optional)
                - process_query (optional, block):
                    - filter_by (optional)
                    - limit (optional)
                    - metric (required)
                    - search_by (optional)
                - q (optional)
                - query (optional, block):
                    - apm_dependency_stats_query (optional, block):
                        - cross_org_uuids (optional)
                        - data_source (required)
                        - env (required)
                        - is_upstream (optional)
                        - name (required)
                        - operation_name (required)
                        - primary_tag_name (optional)
                        - primary_tag_value (optional)
                        - resource_name (required)
                        - service (required)
                        - stat (required)
                    - apm_resource_stats_query (optional, block):
                        - cross_org_uuids (optional)
                        - data_source (required)
                        - env (required)
                        - group_by (optional)
                        - name (required)
                        - operation_name (optional)
                        - primary_tag_name (optional)
                        - primary_tag_value (optional)
                        - resource_name (optional)
                        - service (required)
                        - stat (required)
                    - cloud_cost_query (optional, block):
                        - aggregator (optional)
                        - cross_org_uuids (optional)
                        - data_source (required)
                        - name (required)
                        - query (required)
                    - event_query (optional, block):
                        - compute (required, block):
                            - aggregation (required)
                            - interval (optional)
                            - metric (optional)
                        - cross_org_uuids (optional)
                        - data_source (required)
                        - group_by (optional, block):
                            - facet (required)
                            - limit (optional)
                            - sort (optional, block):
                                - aggregation (required)
                                - metric (optional)
                                - order (optional)
                        - group_by_fields (optional, block):
                            - fields (required)
                            - limit (optional)
                            - sort (optional, block):
                                - aggregation (required)
                                - metric (optional)
                                - order (optional)
                        - indexes (optional)
                        - name (required)
                        - search (optional, block):
                            - query (required)
                        - storage (optional)
                    - metric_query (optional, block):
                        - aggregator (optional)
                        - cross_org_uuids (optional)
                        - data_source (optional)
                        - name (required)
                        - query (required)
                        - semantic_mode (optional)
                    - process_query (optional, block):
                        - aggregator (optional)
                        - cross_org_uuids (optional)
                        - data_source (required)
                        - is_normalized_cpu (optional)
                        - limit (optional)
                        - metric (required)
                        - name (required)
                        - sort (optional)
                        - tag_filters (optional)
                        - text_filter (optional)
                    - slo_query (optional, block):
                        - additional_query_filters (optional)
                        - cross_org_uuids (optional)
                        - data_source (required)
                        - group_mode (optional)
                        - measure (required)
                        - name (optional)
                        - slo_id (required)
                        - slo_query_type (optional)
                - rum_query (optional, block):
                    - compute_query (optional, block):
                        - aggregation (required)
                        - facet (optional)
                        - interval (optional)
                    - group_by (optional, block):
                        - facet (optional)
                        - limit (optional)
                        - sort_query (optional, block):
                            - aggregation (required)
                            - facet (optional)
                            - order (required)
                    - index (required)
                    - multi_compute (optional, block):
                        - aggregation (required)
                        - facet (optional)
                        - interval (optional)
                    - search_query (optional)
                - security_query (optional, block):
                    - compute_query (optional, block):
                        - aggregation (required)
                        - facet (optional)
                        - interval (optional)
                    - group_by (optional, block):
                        - facet (optional)
                        - limit (optional)
                        - sort_query (optional, block):
                            - aggregation (required)
                            - facet (optional)
                            - order (required)
                    - index (required)
                    - multi_compute (optional, block):
                        - aggregation (required)
                        - facet (optional)
                        - interval (optional)
                    - search_query (optional)
                - style (optional, block):
                    - palette (optional)
            - show_legend (optional)
            - title (optional)
            - title_align (optional)
            - title_size (optional)
            - yaxis (optional, block):
                - include_zero (optional)
                - label (optional)
                - max (optional)
                - min (optional)
                - scale (optional)
        - hostmap_definition (optional, block):
            - custom_link (optional, block):
                - is_hidden (optional)
                - label (optional)
                - link (optional)
                - override_label (optional)
            - description (optional)
            - group (optional)
            - no_group_hosts (optional)
            - no_metric_hosts (optional)
            - node_type (optional)
            - request (optional, block):
                - fill (optional, block):
                    - apm_query (optional, block):
                        - compute_query (optional, block):
                            - aggregation (required)
                            - facet (optional)
                            - interval (optional)
                        - group_by (optional, block):
                            - facet (optional)
                            - limit (optional)
                            - sort_query (optional, block):
                                - aggregation (required)
                                - facet (optional)
                                - order (required)
                        - index (required)
                        - multi_compute (optional, block):
                            - aggregation (required)
                            - facet (optional)
                            - interval (optional)
                        - search_query (optional)
                    - log_query (optional, block):
                        - compute_query (optional, block):
                            - aggregation (required)
                            - facet (optional)
                            - interval (optional)
                        - group_by (optional, block):
                            - facet (optional)
                            - limit (optional)
                            - sort_query (optional, block):
                                - aggregation (required)
                                - facet (optional)
                                - order (required)
                        - index (required)
                        - multi_compute (optional, block):
                            - aggregation (required)
                            - facet (optional)
                            - interval (optional)
                        - search_query (optional)
                    - process_query (optional, block):
                        - filter_by (optional)
                        - limit (optional)
                        - metric (required)
                        - search_by (optional)
                    - q (optional)
                    - rum_query (optional, block):
                        - compute_query (optional, block):
                            - aggregation (required)
                            - facet (optional)
                            - interval (optional)
                        - group_by (optional, block):
                            - facet (optional)
                            - limit (optional)
                            - sort_query (optional, block):
                                - aggregation (required)
                                - facet (optional)
                                - order (required)
                        - index (required)
                        - multi_compute (optional, block):
                            - aggregation (required)
                            - facet (optional)
                            - interval (optional)
                        - search_query (optional)
                    - security_query (optional, block):
                        - compute_query (optional, block):
                            - aggregation (required)
                            - facet (optional)
                            - interval (optional)
                        - group_by (optional, block):
                            - facet (optional)
                            - limit (optional)
                            - sort_query (optional, block):
                                - aggregation (required)
                                - facet (optional)
                                - order (required)
                        - index (required)
                        - multi_compute (optional, block):
                            - aggregation (required)
                            - facet (optional)
                            - interval (optional)
                        - search_query (optional)
                - size (optional, block):
                    - apm_query (optional, block):
                        - compute_query (optional, block):
                            - aggregation (required)
                            - facet (optional)
                            - interval (optional)
                        - group_by (optional, block):
                            - facet (optional)
                            - limit (optional)
                            - sort_query (optional, block):
                                - aggregation (required)
                                - facet (optional)
                                - order (required)
                        - index (required)
                        - multi_compute (optional, block):
                            - aggregation (required)
                            - facet (optional)
                            - interval (optional)
                        - search_query (optional)
                    - log_query (optional, block):
                        - compute_query (optional, block):
                            - aggregation (required)
                            - facet (optional)
                            - interval (optional)
                        - group_by (optional, block):
                            - facet (optional)
                            - limit (optional)
                            - sort_query (optional, block):
                                - aggregation (required)
                                - facet (optional)
                                - order (required)
                        - index (required)
                        - multi_compute (optional, block):
                            - aggregation (required)
                            - facet (optional)
                            - interval (optional)
                        - search_query (optional)
                    - process_query (optional, block):
                        - filter_by (optional)
                        - limit (optional)
                        - metric (required)
                        - search_by (optional)
                    - q (optional)
                    - rum_query (optional, block):
                        - compute_query (optional, block):
                            - aggregation (required)
                            - facet (optional)
                            - interval (optional)
                        - group_by (optional, block):
                            - facet (optional)
                            - limit (optional)
                            - sort_query (optional, block):
                                - aggregation (required)
                                - facet (optional)
                                - order (required)
                        - index (required)
                        - multi_compute (optional, block):
                            - aggregation (required)
                            - facet (optional)
                            - interval (optional)
                        - search_query (optional)
                    - security_query (optional, block):
                        - compute_query (optional, block):
                            - aggregation (required)
                            - facet (optional)
                            - interval (optional)
                        - group_by (optional, block):
                            - facet (optional)
                            - limit (optional)
                            - sort_query (optional, block):
                                - aggregation (required)
                                - facet (optional)
                                - order (required)
                        - index (required)
                        - multi_compute (optional, block):
                            - aggregation (required)
                            - facet (optional)
                            - interval (optional)
                        - search_query (optional)
            - scope (optional)
            - style (optional, block):
                - fill_max (optional)
                - fill_min (optional)
                - palette (optional)
                - palette_flip (optional)
            - title (optional)
            - title_align (optional)
            - title_size (optional)
        - iframe_definition (optional, block):
            - url (required)
        - image_definition (optional, block):
            - has_background (optional)
            - has_border (optional)
            - horizontal_align (optional)
            - margin (optional)
            - sizing (optional)
            - url (required)
            - url_dark_theme (optional)
            - vertical_align (optional)
        - list_stream_definition (optional, block):
            - request (required, block):
                - columns (required, block):
                    - field (optional)
                    - width (optional)
                - description (optional)
                - query (required, block):
                    - clustering_pattern_field_path (optional)
                    - data_source (required)
                    - event_size (optional)
                    - group_by (optional, block):
                        - facet (required)
                    - indexes (optional)
                    - query_string (optional)
                    - sort (optional, block):
                        - column (required)
                        - description (optional)
                        - order (required)
                    - storage (optional)
                - response_format (required)
            - title (optional)
            - title_align (optional)
            - title_size (optional)
        - log_stream_definition (optional, block):
            - columns (optional)
            - hide_incomplete_cost_data (optional)
            - indexes (optional)
            - live_span (optional)
            - message_display (optional)
            - query (optional)
            - show_date_column (optional)
            - show_message_column (optional)
            - sort (optional, block):
                - column (required)
                - description (optional)
                - order (required)
            - title (optional)
            - title_align (optional)
            - title_size (optional)
        - manage_status_definition (optional, block):
            - color_preference (optional)
            - display_format (optional)
            - hide_zero_counts (optional)
            - query (required)
            - show_last_triggered (optional)
            - show_priority (optional)
            - sort (optional)
            - summary_type (optional)
            - title (optional)
            - title_align (optional)
            - title_size (optional)
        - note_definition (optional, block):
            - background_color (optional)
            - content (required)
            - description (optional)
            - font_size (optional)
            - has_padding (optional)
            - show_tick (optional)
            - text_align (optional)
            - tick_edge (optional)
            - tick_pos (optional)
            - vertical_align (optional)
        - query_table_definition (optional, block):
            - custom_link (optional, block):
                - is_hidden (optional)
                - label (optional)
                - link (optional)
                - override_label (optional)
            - description (optional)
            - has_search_bar (optional)
            - hide_incomplete_cost_data (optional)
            - live_span (optional)
            - request (optional, block):
                - aggregator (optional)
                - alias (optional)
                - apm_query (optional, block):
                    - compute_query (optional, block):
                        - aggregation (required)
                        - facet (optional)
                        - interval (optional)
                    - group_by (optional, block):
                        - facet (optional)
                        - limit (optional)
                        - sort_query (optional, block):
                            - aggregation (required)
                            - facet (optional)
                            - order (required)
                    - index (required)
                    - multi_compute (optional, block):
                        - aggregation (required)
                        - facet (optional)
                        - interval (optional)
                    - search_query (optional)
                - apm_stats_query (optional, block):
                    - columns (optional, block):
                        - alias (optional)
                        - cell_display_mode (optional)
                        - name (required)
                        - order (optional)
                    - env (required)
                    - name (required)
                    - primary_tag (required)
                    - resource (optional)
                    - row_type (required)
                    - service (required)
                - cell_display_mode (optional)
                - conditional_formats (optional, block):
                    - comparator (required)
                    - custom_bg_color (optional)
                    - custom_fg_color (optional)
                    - hide_value (optional)
                    - image_url (optional)
                    - metric (optional)
                    - palette (required)
                    - timeframe (optional)
                    - value (required)
                - formula (optional, block):
                    - alias (optional)
                    - cell_display_mode (optional)
                    - cell_display_mode_options (optional, block):
                        - trend_type (optional)
                        - y_scale (optional)
                    - conditional_formats (optional, block):
                        - comparator (required)
                        - custom_bg_color (optional)
                        - custom_fg_color (optional)
                        - hide_value (optional)
                        - image_url (optional)
                        - metric (optional)
                        - palette (required)
                        - timeframe (optional)
                        - value (required)
                    - formula_expression (required)
                    - limit (optional, block):
                        - count (optional)
                        - order (optional)
                    - number_format (optional, block):
                        - unit (required, block):
                            - canonical (optional, block):
                                - per_unit_name (optional)
                                - unit_name (required)
                            - custom (optional, block):
                                - label (required)
                        - unit_scale (optional, block):
                            - unit_name (required)
                    - style (optional, block):
                        - palette (optional)
                        - palette_index (optional)
                - limit (optional)
                - log_query (optional, block):
                    - compute_query (optional, block):
                        - aggregation (required)
                        - facet (optional)
                        - interval (optional)
                    - group_by (optional, block):
                        - facet (optional)
                        - limit (optional)
                        - sort_query (optional, block):
                            - aggregation (required)
                            - facet (optional)
                            - order (required)
                    - index (required)
                    - multi_compute (optional, block):
                        - aggregation (required)
                        - facet (optional)
                        - interval (optional)
                    - search_query (optional)
                - order (optional)
                - process_query (optional, block):
                    - filter_by (optional)
                    - limit (optional)
                    - metric (required)
                    - search_by (optional)
                - q (optional)
                - query (optional, block):
                    - apm_dependency_stats_query (optional, block):
                        - cross_org_uuids (optional)
                        - data_source (required)
                        - env (required)
                        - is_upstream (optional)
                        - name (required)
                        - operation_name (required)
                        - primary_tag_name (optional)
                        - primary_tag_value (optional)
                        - resource_name (required)
                        - service (required)
                        - stat (required)
                    - apm_resource_stats_query (optional, block):
                        - cross_org_uuids (optional)
                        - data_source (required)
                        - env (required)
                        - group_by (optional)
                        - name (required)
                        - operation_name (optional)
                        - primary_tag_name (optional)
                        - primary_tag_value (optional)
                        - resource_name (optional)
                        - service (required)
                        - stat (required)
                    - cloud_cost_query (optional, block):
                        - aggregator (optional)
                        - cross_org_uuids (optional)
                        - data_source (required)
                        - name (required)
                        - query (required)
                    - event_query (optional, block):
                        - compute (required, block):
                            - aggregation (required)
                            - interval (optional)
                            - metric (optional)
                        - cross_org_uuids (optional)
                        - data_source (required)
                        - group_by (optional, block):
                            - facet (required)
                            - limit (optional)
                            - sort (optional, block):
                                - aggregation (required)
                                - metric (optional)
                                - order (optional)
                        - group_by_fields (optional, block):
                            - fields (required)
                            - limit (optional)
                            - sort (optional, block):
                                - aggregation (required)
                                - metric (optional)
                                - order (optional)
                        - indexes (optional)
                        - name (required)
                        - search (optional, block):
                            - query (required)
                        - storage (optional)
                    - metric_query (optional, block):
                        - aggregator (optional)
                        - cross_org_uuids (optional)
                        - data_source (optional)
                        - name (required)
                        - query (required)
                        - semantic_mode (optional)
                    - process_query (optional, block):
                        - aggregator (optional)
                        - cross_org_uuids (optional)
                        - data_source (required)
                        - is_normalized_cpu (optional)
                        - limit (optional)
                        - metric (required)
                        - name (required)
                        - sort (optional)
                        - tag_filters (optional)
                        - text_filter (optional)
                    - slo_query (optional, block):
                        - additional_query_filters (optional)
                        - cross_org_uuids (optional)
                        - data_source (required)
                        - group_mode (optional)
                        - measure (required)
                        - name (optional)
                        - slo_id (required)
                        - slo_query_type (optional)
                - rum_query (optional, block):
                    - compute_query (optional, block):
                        - aggregation (required)
                        - facet (optional)
                        - interval (optional)
                    - group_by (optional, block):
                        - facet (optional)
                        - limit (optional)
                        - sort_query (optional, block):
                            - aggregation (required)
                            - facet (optional)
                            - order (required)
                    - index (required)
                    - multi_compute (optional, block):
                        - aggregation (required)
                        - facet (optional)
                        - interval (optional)
                    - search_query (optional)
                - security_query (optional, block):
                    - compute_query (optional, block):
                        - aggregation (required)
                        - facet (optional)
                        - interval (optional)
                    - group_by (optional, block):
                        - facet (optional)
                        - limit (optional)
                        - sort_query (optional, block):
                            - aggregation (required)
                            - facet (optional)
                            - order (required)
                    - index (required)
                    - multi_compute (optional, block):
                        - aggregation (required)
                        - facet (optional)
                        - interval (optional)
                    - search_query (optional)
                - text_formats (optional, block):
                    - text_format (optional, block):
                        - custom_bg_color (optional)
                        - custom_fg_color (optional)
                        - match (required, block):
                            - type (required)
                            - value (required)
                        - palette (optional)
                        - replace (optional, block):
                            - substring (optional)
                            - type (required)
                            - with (required)
            - title (optional)
            - title_align (optional)
            - title_size (optional)
        - query_value_definition (optional, block):
            - autoscale (optional)
            - custom_link (optional, block):
                - is_hidden (optional)
                - label (optional)
                - link (optional)
                - override_label (optional)
            - custom_unit (optional)
            - description (optional)
            - hide_incomplete_cost_data (optional)
            - live_span (optional)
            - precision (optional)
            - request (optional, block):
                - aggregator (optional)
                - apm_query (optional, block):
                    - compute_query (optional, block):
                        - aggregation (required)
                        - facet (optional)
                        - interval (optional)
                    - group_by (optional, block):
                        - facet (optional)
                        - limit (optional)
                        - sort_query (optional, block):
                            - aggregation (required)
                            - facet (optional)
                            - order (required)
                    - index (required)
                    - multi_compute (optional, block):
                        - aggregation (required)
                        - facet (optional)
                        - interval (optional)
                    - search_query (optional)
                - audit_query (optional, block):
                    - compute_query (optional, block):
                        - aggregation (required)
                        - facet (optional)
                        - interval (optional)
                    - group_by (optional, block):
                        - facet (optional)
                        - limit (optional)
                        - sort_query (optional, block):
                            - aggregation (required)
                            - facet (optional)
                            - order (required)
                    - index (required)
                    - multi_compute (optional, block):
                        - aggregation (required)
                        - facet (optional)
                        - interval (optional)
                    - search_query (optional)
                - conditional_formats (optional, block):
                    - comparator (required)
                    - custom_bg_color (optional)
                    - custom_fg_color (optional)
                    - hide_value (optional)
                    - image_url (optional)
                    - metric (optional)
                    - palette (required)
                    - timeframe (optional)
                    - value (required)
                - formula (optional, block):
                    - alias (optional)
                    - cell_display_mode (optional)
                    - conditional_formats (optional, block):
                        - comparator (required)
                        - custom_bg_color (optional)
                        - custom_fg_color (optional)
                        - hide_value (optional)
                        - image_url (optional)
                        - metric (optional)
                        - palette (required)
                        - timeframe (optional)
                        - value (required)
                    - formula_expression (required)
                    - limit (optional, block):
                        - count (optional)
                        - order (optional)
                    - number_format (optional, block):
                        - unit (required, block):
                            - canonical (optional, block):
                                - per_unit_name (optional)
                                - unit_name (required)
                            - custom (optional, block):
                                - label (required)
                        - unit_scale (optional, block):
                            - unit_name (required)
                    - style (optional, block):
                        - palette (optional)
                        - palette_index (optional)
                - log_query (optional, block):
                    - compute_query (optional, block):
                        - aggregation (required)
                        - facet (optional)
                        - interval (optional)
                    - group_by (optional, block):
                        - facet (optional)
                        - limit (optional)
                        - sort_query (optional, block):
                            - aggregation (required)
                            - facet (optional)
                            - order (required)
                    - index (required)
                    - multi_compute (optional, block):
                        - aggregation (required)
                        - facet (optional)
                        - interval (optional)
                    - search_query (optional)
                - process_query (optional, block):
                    - filter_by (optional)
                    - limit (optional)
                    - metric (required)
                    - search_by (optional)
                - q (optional)
                - query (optional, block):
                    - apm_dependency_stats_query (optional, block):
                        - cross_org_uuids (optional)
                        - data_source (required)
                        - env (required)
                        - is_upstream (optional)
                        - name (required)
                        - operation_name (required)
                        - primary_tag_name (optional)
                        - primary_tag_value (optional)
                        - resource_name (required)
                        - service (required)
                        - stat (required)
                    - apm_resource_stats_query (optional, block):
                        - cross_org_uuids (optional)
                        - data_source (required)
                        - env (required)
                        - group_by (optional)
                        - name (required)
                        - operation_name (optional)
                        - primary_tag_name (optional)
                        - primary_tag_value (optional)
                        - resource_name (optional)
                        - service (required)
                        - stat (required)
                    - cloud_cost_query (optional, block):
                        - aggregator (optional)
                        - cross_org_uuids (optional)
                        - data_source (required)
                        - name (required)
                        - query (required)
                    - event_query (optional, block):
                        - compute (required, block):
                            - aggregation (required)
                            - interval (optional)
                            - metric (optional)
                        - cross_org_uuids (optional)
                        - data_source (required)
                        - group_by (optional, block):
                            - facet (required)
                            - limit (optional)
                            - sort (optional, block):
                                - aggregation (required)
                                - metric (optional)
                                - order (optional)
                        - group_by_fields (optional, block):
                            - fields (required)
                            - limit (optional)
                            - sort (optional, block):
                                - aggregation (required)
                                - metric (optional)
                                - order (optional)
                        - indexes (optional)
                        - name (required)
                        - search (optional, block):
                            - query (required)
                        - storage (optional)
                    - metric_query (optional, block):
                        - aggregator (optional)
                        - cross_org_uuids (optional)
                        - data_source (optional)
                        - name (required)
                        - query (required)
                        - semantic_mode (optional)
                    - process_query (optional, block):
                        - aggregator (optional)
                        - cross_org_uuids (optional)
                        - data_source (required)
                        - is_normalized_cpu (optional)
                        - limit (optional)
                        - metric (required)
                        - name (required)
                        - sort (optional)
                        - tag_filters (optional)
                        - text_filter (optional)
                    - slo_query (optional, block):
                        - additional_query_filters (optional)
                        - cross_org_uuids (optional)
                        - data_source (required)
                        - group_mode (optional)
                        - measure (required)
                        - name (optional)
                        - slo_id (required)
                        - slo_query_type (optional)
                - rum_query (optional, block):
                    - compute_query (optional, block):
                        - aggregation (required)
                        - facet (optional)
                        - interval (optional)
                    - group_by (optional, block):
                        - facet (optional)
                        - limit (optional)
                        - sort_query (optional, block):
                            - aggregation (required)
                            - facet (optional)
                            - order (required)
                    - index (required)
                    - multi_compute (optional, block):
                        - aggregation (required)
                        - facet (optional)
                        - interval (optional)
                    - search_query (optional)
                - security_query (optional, block):
                    - compute_query (optional, block):
                        - aggregation (required)
                        - facet (optional)
                        - interval (optional)
                    - group_by (optional, block):
                        - facet (optional)
                        - limit (optional)
                        - sort_query (optional, block):
                            - aggregation (required)
                            - facet (optional)
                            - order (required)
                    - index (required)
                    - multi_compute (optional, block):
                        - aggregation (required)
                        - facet (optional)
                        - interval (optional)
                    - search_query (optional)
            - text_align (optional)
            - timeseries_background (optional, block):
                - type (required)
                - yaxis (optional, block):
                    - include_zero (optional)
                    - label (optional)
                    - max (optional)
                    - min (optional)
                    - scale (optional)
            - title (optional)
            - title_align (optional)
            - title_size (optional)
        - run_workflow_definition (optional, block):
            - custom_link (optional, block):
                - is_hidden (optional)
                - label (optional)
                - link (optional)
                - override_label (optional)
            - description (optional)
            - hide_incomplete_cost_data (optional)
            - input (optional, block):
                - name (required)
                - value (required)
            - live_span (optional)
            - title (optional)
            - title_align (optional)
            - title_size (optional)
            - workflow_id (required)
        - scatterplot_definition (optional, block):
            - color_by_groups (optional)
            - custom_link (optional, block):
                - is_hidden (optional)
                - label (optional)
                - link (optional)
                - override_label (optional)
            - description (optional)
            - hide_incomplete_cost_data (optional)
            - live_span (optional)
            - request (optional, block):
                - scatterplot_table (optional, block):
                    - formula (optional, block):
                        - alias (optional)
                        - dimension (required)
                        - formula_expression (required)
                    - query (optional, block):
                        - apm_dependency_stats_query (optional, block):
                            - cross_org_uuids (optional)
                            - data_source (required)
                            - env (required)
                            - is_upstream (optional)
                            - name (required)
                            - operation_name (required)
                            - primary_tag_name (optional)
                            - primary_tag_value (optional)
                            - resource_name (required)
                            - service (required)
                            - stat (required)
                        - apm_resource_stats_query (optional, block):
                            - cross_org_uuids (optional)
                            - data_source (required)
                            - env (required)
                            - group_by (optional)
                            - name (required)
                            - operation_name (optional)
                            - primary_tag_name (optional)
                            - primary_tag_value (optional)
                            - resource_name (optional)
                            - service (required)
                            - stat (required)
                        - cloud_cost_query (optional, block):
                            - aggregator (optional)
                            - cross_org_uuids (optional)
                            - data_source (required)
                            - name (required)
                            - query (required)
                        - event_query (optional, block):
                            - compute (required, block):
                                - aggregation (required)
                                - interval (optional)
                                - metric (optional)
                            - cross_org_uuids (optional)
                            - data_source (required)
                            - group_by (optional, block):
                                - facet (required)
                                - limit (optional)
                                - sort (optional, block):
                                    - aggregation (required)
                                    - metric (optional)
                                    - order (optional)
                            - group_by_fields (optional, block):
                                - fields (required)
                                - limit (optional)
                                - sort (optional, block):
                                    - aggregation (required)
                                    - metric (optional)
                                    - order (optional)
                            - indexes (optional)
                            - name (required)
                            - search (optional, block):
                                - query (required)
                            - storage (optional)
                        - metric_query (optional, block):
                            - aggregator (optional)
                            - cross_org_uuids (optional)
                            - data_source (optional)
                            - name (required)
                            - query (required)
                            - semantic_mode (optional)
                        - process_query (optional, block):
                            - aggregator (optional)
                            - cross_org_uuids (optional)
                            - data_source (required)
                            - is_normalized_cpu (optional)
                            - limit (optional)
                            - metric (required)
                            - name (required)
                            - sort (optional)
                            - tag_filters (optional)
                            - text_filter (optional)
                        - slo_query (optional, block):
                            - additional_query_filters (optional)
                            - cross_org_uuids (optional)
                            - data_source (required)
                            - group_mode (optional)
                            - measure (required)
                            - name (optional)
                            - slo_id (required)
                            - slo_query_type (optional)
                - x (optional, block):
                    - aggregator (optional)
                    - apm_query (optional, block):
                        - compute_query (optional, block):
                            - aggregation (required)
                            - facet (optional)
                            - interval (optional)
                        - group_by (optional, block):
                            - facet (optional)
                            - limit (optional)
                            - sort_query (optional, block):
                                - aggregation (required)
                                - facet (optional)
                                - order (required)
                        - index (required)
                        - multi_compute (optional, block):
                            - aggregation (required)
                            - facet (optional)
                            - interval (optional)
                        - search_query (optional)
                    - log_query (optional, block):
                        - compute_query (optional, block):
                            - aggregation (required)
                            - facet (optional)
                            - interval (optional)
                        - group_by (optional, block):
                            - facet (optional)
                            - limit (optional)
                            - sort_query (optional, block):
                                - aggregation (required)
                                - facet (optional)
                                - order (required)
                        - index (required)
                        - multi_compute (optional, block):
                            - aggregation (required)
                            - facet (optional)
                            - interval (optional)
                        - search_query (optional)
                    - process_query (optional, block):
                        - filter_by (optional)
                        - limit (optional)
                        - metric (required)
                        - search_by (optional)
                    - q (optional)
                    - rum_query (optional, block):
                        - compute_query (optional, block):
                            - aggregation (required)
                            - facet (optional)
                            - interval (optional)
                        - group_by (optional, block):
                            - facet (optional)
                            - limit (optional)
                            - sort_query (optional, block):
                                - aggregation (required)
                                - facet (optional)
                                - order (required)
                        - index (required)
                        - multi_compute (optional, block):
                            - aggregation (required)
                            - facet (optional)
                            - interval (optional)
                        - search_query (optional)
                    - security_query (optional, block):
                        - compute_query (optional, block):
                            - aggregation (required)
                            - facet (optional)
                            - interval (optional)
                        - group_by (optional, block):
                            - facet (optional)
                            - limit (optional)
                            - sort_query (optional, block):
                                - aggregation (required)
                                - facet (optional)
                                - order (required)
                        - index (required)
                        - multi_compute (optional, block):
                            - aggregation (required)
                            - facet (optional)
                            - interval (optional)
                        - search_query (optional)
                - y (optional, block):
                    - aggregator (optional)
                    - apm_query (optional, block):
                        - compute_query (optional, block):
                            - aggregation (required)
                            - facet (optional)
                            - interval (optional)
                        - group_by (optional, block):
                            - facet (optional)
                            - limit (optional)
                            - sort_query (optional, block):
                                - aggregation (required)
                                - facet (optional)
                                - order (required)
                        - index (required)
                        - multi_compute (optional, block):
                            - aggregation (required)
                            - facet (optional)
                            - interval (optional)
                        - search_query (optional)
                    - log_query (optional, block):
                        - compute_query (optional, block):
                            - aggregation (required)
                            - facet (optional)
                            - interval (optional)
                        - group_by (optional, block):
                            - facet (optional)
                            - limit (optional)
                            - sort_query (optional, block):
                                - aggregation (required)
                                - facet (optional)
                                - order (required)
                        - index (required)
                        - multi_compute (optional, block):
                            - aggregation (required)
                            - facet (optional)
                            - interval (optional)
                        - search_query (optional)
                    - process_query (optional, block):
                        - filter_by (optional)
                        - limit (optional)
                        - metric (required)
                        - search_by (optional)
                    - q (optional)
                    - rum_query (optional, block):
                        - compute_query (optional, block):
                            - aggregation (required)
                            - facet (optional)
                            - interval (optional)
                        - group_by (optional, block):
                            - facet (optional)
                            - limit (optional)
                            - sort_query (optional, block):
                                - aggregation (required)
                                - facet (optional)
                                - order (required)
                        - index (required)
                        - multi_compute (optional, block):
                            - aggregation (required)
                            - facet (optional)
                            - interval (optional)
                        - search_query (optional)
                    - security_query (optional, block):
                        - compute_query (optional, block):
                            - aggregation (required)
                            - facet (optional)
                            - interval (optional)
                        - group_by (optional, block):
                            - facet (optional)
                            - limit (optional)
                            - sort_query (optional, block):
                                - aggregation (required)
                                - facet (optional)
                                - order (required)
                        - index (required)
                        - multi_compute (optional, block):
                            - aggregation (required)
                            - facet (optional)
                            - interval (optional)
                        - search_query (optional)
            - title (optional)
            - title_align (optional)
            - title_size (optional)
            - xaxis (optional, block):
                - include_zero (optional)
                - label (optional)
                - max (optional)
                - min (optional)
                - scale (optional)
            - yaxis (optional, block):
                - include_zero (optional)
                - label (optional)
                - max (optional)
                - min (optional)
                - scale (optional)
        - service_level_objective_definition (optional, block):
            - additional_query_filters (optional)
            - description (optional)
            - global_time_target (optional)
            - show_error_budget (optional)
            - slo_id (required)
            - time_windows (required)
            - title (optional)
            - title_align (optional)
            - title_size (optional)
            - view_mode (required)
            - view_type (required)
        - servicemap_definition (optional, block):
            - custom_link (optional, block):
                - is_hidden (optional)
                - label (optional)
                - link (optional)
                - override_label (optional)
            - description (optional)
            - filters (required)
            - service (required)
            - title (optional)
            - title_align (optional)
            - title_size (optional)
        - slo_list_definition (optional, block):
            - request (required, block):
                - description (optional)
                - query (required, block):
                    - limit (optional)
                    - query_string (required)
                    - sort (optional, block):
                        - column (required)
                        - description (optional)
                        - order (required)
                - request_type (required)
            - title (optional)
            - title_align (optional)
            - title_size (optional)
        - sunburst_definition (optional, block):
            - custom_link (optional, block):
                - is_hidden (optional)
                - label (optional)
                - link (optional)
                - override_label (optional)
            - description (optional)
            - hide_incomplete_cost_data (optional)
            - hide_total (optional)
            - legend_inline (optional, block):
                - hide_percent (optional)
                - hide_value (optional)
                - type (required)
            - legend_table (optional, block):
                - type (required)
            - live_span (optional)
            - request (optional, block):
                - apm_query (optional, block):
                    - compute_query (optional, block):
                        - aggregation (required)
                        - facet (optional)
                        - interval (optional)
                    - group_by (optional, block):
                        - facet (optional)
                        - limit (optional)
                        - sort_query (optional, block):
                            - aggregation (required)
                            - facet (optional)
                            - order (required)
                    - index (required)
                    - multi_compute (optional, block):
                        - aggregation (required)
                        - facet (optional)
                        - interval (optional)
                    - search_query (optional)
                - audit_query (optional, block):
                    - compute_query (optional, block):
                        - aggregation (required)
                        - facet (optional)
                        - interval (optional)
                    - group_by (optional, block):
                        - facet (optional)
                        - limit (optional)
                        - sort_query (optional, block):
                            - aggregation (required)
                            - facet (optional)
                            - order (required)
                    - index (required)
                    - multi_compute (optional, block):
                        - aggregation (required)
                        - facet (optional)
                        - interval (optional)
                    - search_query (optional)
                - formula (optional, block):
                    - alias (optional)
                    - cell_display_mode (optional)
                    - conditional_formats (optional, block):
                        - comparator (required)
                        - custom_bg_color (optional)
                        - custom_fg_color (optional)
                        - hide_value (optional)
                        - image_url (optional)
                        - metric (optional)
                        - palette (required)
                        - timeframe (optional)
                        - value (required)
                    - formula_expression (required)
                    - limit (optional, block):
                        - count (optional)
                        - order (optional)
                    - number_format (optional, block):
                        - unit (required, block):
                            - canonical (optional, block):
                                - per_unit_name (optional)
                                - unit_name (required)
                            - custom (optional, block):
                                - label (required)
                        - unit_scale (optional, block):
                            - unit_name (required)
                    - style (optional, block):
                        - palette (optional)
                        - palette_index (optional)
                - log_query (optional, block):
                    - compute_query (optional, block):
                        - aggregation (required)
                        - facet (optional)
                        - interval (optional)
                    - group_by (optional, block):
                        - facet (optional)
                        - limit (optional)
                        - sort_query (optional, block):
                            - aggregation (required)
                            - facet (optional)
                            - order (required)
                    - index (required)
                    - multi_compute (optional, block):
                        - aggregation (required)
                        - facet (optional)
                        - interval (optional)
                    - search_query (optional)
                - network_query (optional, block):
                    - compute_query (optional, block):
                        - aggregation (required)
                        - facet (optional)
                        - interval (optional)
                    - group_by (optional, block):
                        - facet (optional)
                        - limit (optional)
                        - sort_query (optional, block):
                            - aggregation (required)
                            - facet (optional)
                            - order (required)
                    - index (required)
                    - multi_compute (optional, block):
                        - aggregation (required)
                        - facet (optional)
                        - interval (optional)
                    - search_query (optional)
                - process_query (optional, block):
                    - filter_by (optional)
                    - limit (optional)
                    - metric (required)
                    - search_by (optional)
                - q (optional)
                - query (optional, block):
                    - apm_dependency_stats_query (optional, block):
                        - cross_org_uuids (optional)
                        - data_source (required)
                        - env (required)
                        - is_upstream (optional)
                        - name (required)
                        - operation_name (required)
                        - primary_tag_name (optional)
                        - primary_tag_value (optional)
                        - resource_name (required)
                        - service (required)
                        - stat (required)
                    - apm_resource_stats_query (optional, block):
                        - cross_org_uuids (optional)
                        - data_source (required)
                        - env (required)
                        - group_by (optional)
                        - name (required)
                        - operation_name (optional)
                        - primary_tag_name (optional)
                        - primary_tag_value (optional)
                        - resource_name (optional)
                        - service (required)
                        - stat (required)
                    - cloud_cost_query (optional, block):
                        - aggregator (optional)
                        - cross_org_uuids (optional)
                        - data_source (required)
                        - name (required)
                        - query (required)
                    - event_query (optional, block):
                        - compute (required, block):
                            - aggregation (required)
                            - interval (optional)
                            - metric (optional)
                        - cross_org_uuids (optional)
                        - data_source (required)
                        - group_by (optional, block):
                            - facet (required)
                            - limit (optional)
                            - sort (optional, block):
                                - aggregation (required)
                                - metric (optional)
                                - order (optional)
                        - group_by_fields (optional, block):
                            - fields (required)
                            - limit (optional)
                            - sort (optional, block):
                                - aggregation (required)
                                - metric (optional)
                                - order (optional)
                        - indexes (optional)
                        - name (required)
                        - search (optional, block):
                            - query (required)
                        - storage (optional)
                    - metric_query (optional, block):
                        - aggregator (optional)
                        - cross_org_uuids (optional)
                        - data_source (optional)
                        - name (required)
                        - query (required)
                        - semantic_mode (optional)
                    - process_query (optional, block):
                        - aggregator (optional)
                        - cross_org_uuids (optional)
                        - data_source (required)
                        - is_normalized_cpu (optional)
                        - limit (optional)
                        - metric (required)
                        - name (required)
                        - sort (optional)
                        - tag_filters (optional)
                        - text_filter (optional)
                    - slo_query (optional, block):
                        - additional_query_filters (optional)
                        - cross_org_uuids (optional)
                        - data_source (required)
                        - group_mode (optional)
                        - measure (required)
                        - name (optional)
                        - slo_id (required)
                        - slo_query_type (optional)
                - rum_query (optional, block):
                    - compute_query (optional, block):
                        - aggregation (required)
                        - facet (optional)
                        - interval (optional)
                    - group_by (optional, block):
                        - facet (optional)
                        - limit (optional)
                        - sort_query (optional, block):
                            - aggregation (required)
                            - facet (optional)
                            - order (required)
                    - index (required)
                    - multi_compute (optional, block):
                        - aggregation (required)
                        - facet (optional)
                        - interval (optional)
                    - search_query (optional)
                - security_query (optional, block):
                    - compute_query (optional, block):
                        - aggregation (required)
                        - facet (optional)
                        - interval (optional)
                    - group_by (optional, block):
                        - facet (optional)
                        - limit (optional)
                        - sort_query (optional, block):
                            - aggregation (required)
                            - facet (optional)
                            - order (required)
                    - index (required)
                    - multi_compute (optional, block):
                        - aggregation (required)
                        - facet (optional)
                        - interval (optional)
                    - search_query (optional)
                - style (optional, block):
                    - palette (optional)
            - title (optional)
            - title_align (optional)
            - title_size (optional)
        - timeseries_definition (optional, block):
            - custom_link (optional, block):
                - is_hidden (optional)
                - label (optional)
                - link (optional)
                - override_label (optional)
            - description (optional)
            - event (optional, block):
                - q (required)
                - tags_execution (optional)
            - hide_incomplete_cost_data (optional)
            - legend_columns (optional)
            - legend_layout (optional)
            - legend_size (optional)
            - live_span (optional)
            - marker (optional, block):
                - display_type (optional)
                - label (optional)
                - value (required)
            - request (optional, block):
                - apm_query (optional, block):
                    - compute_query (optional, block):
                        - aggregation (required)
                        - facet (optional)
                        - interval (optional)
                    - group_by (optional, block):
                        - facet (optional)
                        - limit (optional)
                        - sort_query (optional, block):
                            - aggregation (required)
                            - facet (optional)
                            - order (required)
                    - index (required)
                    - multi_compute (optional, block):
                        - aggregation (required)
                        - facet (optional)
                        - interval (optional)
                    - search_query (optional)
                - audit_query (optional, block):
                    - compute_query (optional, block):
                        - aggregation (required)
                        - facet (optional)
                        - interval (optional)
                    - group_by (optional, block):
                        - facet (optional)
                        - limit (optional)
                        - sort_query (optional, block):
                            - aggregation (required)
                            - facet (optional)
                            - order (required)
                    - index (required)
                    - multi_compute (optional, block):
                        - aggregation (required)
                        - facet (optional)
                        - interval (optional)
                    - search_query (optional)
                - display_type (optional)
                - formula (optional, block):
                    - alias (optional)
                    - cell_display_mode (optional)
                    - conditional_formats (optional, block):
                        - comparator (required)
                        - custom_bg_color (optional)
                        - custom_fg_color (optional)
                        - hide_value (optional)
                        - image_url (optional)
                        - metric (optional)
                        - palette (required)
                        - timeframe (optional)
                        - value (required)
                    - formula_expression (required)
                    - limit (optional, block):
                        - count (optional)
                        - order (optional)
                    - number_format (optional, block):
                        - unit (required, block):
                            - canonical (optional, block):
                                - per_unit_name (optional)
                                - unit_name (required)
                            - custom (optional, block):
                                - label (required)
                        - unit_scale (optional, block):
                            - unit_name (required)
                    - style (optional, block):
                        - palette (optional)
                        - palette_index (optional)
                - log_query (optional, block):
                    - compute_query (optional, block):
                        - aggregation (required)
                        - facet (optional)
                        - interval (optional)
                    - group_by (optional, block):
                        - facet (optional)
                        - limit (optional)
                        - sort_query (optional, block):
                            - aggregation (required)
                            - facet (optional)
                            - order (required)
                    - index (required)
                    - multi_compute (optional, block):
                        - aggregation (required)
                        - facet (optional)
                        - interval (optional)
                    - search_query (optional)
                - metadata (optional, block):
                    - alias_name (optional)
                    - expression (required)
                - network_query (optional, block):
                    - compute_query (optional, block):
                        - aggregation (required)
                        - facet (optional)
                        - interval (optional)
                    - group_by (optional, block):
                        - facet (optional)
                        - limit (optional)
                        - sort_query (optional, block):
                            - aggregation (required)
                            - facet (optional)
                            - order (required)
                    - index (required)
                    - multi_compute (optional, block):
                        - aggregation (required)
                        - facet (optional)
                        - interval (optional)
                    - search_query (optional)
                - on_right_yaxis (optional)
                - process_query (optional, block):
                    - filter_by (optional)
                    - limit (optional)
                    - metric (required)
                    - search_by (optional)
                - q (optional)
                - query (optional, block):
                    - apm_dependency_stats_query (optional, block):
                        - cross_org_uuids (optional)
                        - data_source (required)
                        - env (required)
                        - is_upstream (optional)
                        - name (required)
                        - operation_name (required)
                        - primary_tag_name (optional)
                        - primary_tag_value (optional)
                        - resource_name (required)
                        - service (required)
                        - stat (required)
                    - apm_resource_stats_query (optional, block):
                        - cross_org_uuids (optional)
                        - data_source (required)
                        - env (required)
                        - group_by (optional)
                        - name (required)
                        - operation_name (optional)
                        - primary_tag_name (optional)
                        - primary_tag_value (optional)
                        - resource_name (optional)
                        - service (required)
                        - stat (required)
                    - cloud_cost_query (optional, block):
                        - aggregator (optional)
                        - cross_org_uuids (optional)
                        - data_source (required)
                        - name (required)
                        - query (required)
                    - event_query (optional, block):
                        - compute (required, block):
                            - aggregation (required)
                            - interval (optional)
                            - metric (optional)
                        - cross_org_uuids (optional)
                        - data_source (required)
                        - group_by (optional, block):
                            - facet (required)
                            - limit (optional)
                            - sort (optional, block):
                                - aggregation (required)
                                - metric (optional)
                                - order (optional)
                        - group_by_fields (optional, block):
                            - fields (required)
                            - limit (optional)
                            - sort (optional, block):
                                - aggregation (required)
                                - metric (optional)
                                - order (optional)
                        - indexes (optional)
                        - name (required)
                        - search (optional, block):
                            - query (required)
                        - storage (optional)
                    - metric_query (optional, block):
                        - aggregator (optional)
                        - cross_org_uuids (optional)
                        - data_source (optional)
                        - name (required)
                        - query (required)
                        - semantic_mode (optional)
                    - process_query (optional, block):
                        - aggregator (optional)
                        - cross_org_uuids (optional)
                        - data_source (required)
                        - is_normalized_cpu (optional)
                        - limit (optional)
                        - metric (required)
                        - name (required)
                        - sort (optional)
                        - tag_filters (optional)
                        - text_filter (optional)
                    - slo_query (optional, block):
                        - additional_query_filters (optional)
                        - cross_org_uuids (optional)
                        - data_source (required)
                        - group_mode (optional)
                        - measure (required)
                        - name (optional)
                        - slo_id (required)
                        - slo_query_type (optional)
                - rum_query (optional, block):
                    - compute_query (optional, block):
                        - aggregation (required)
                        - facet (optional)
                        - interval (optional)
                    - group_by (optional, block):
                        - facet (optional)
                        - limit (optional)
                        - sort_query (optional, block):
                            - aggregation (required)
                            - facet (optional)
                            - order (required)
                    - index (required)
                    - multi_compute (optional, block):
                        - aggregation (required)
                        - facet (optional)
                        - interval (optional)
                    - search_query (optional)
                - security_query (optional, block):
                    - compute_query (optional, block):
                        - aggregation (required)
                        - facet (optional)
                        - interval (optional)
                    - group_by (optional, block):
                        - facet (optional)
                        - limit (optional)
                        - sort_query (optional, block):
                            - aggregation (required)
                            - facet (optional)
                            - order (required)
                    - index (required)
                    - multi_compute (optional, block):
                        - aggregation (required)
                        - facet (optional)
                        - interval (optional)
                    - search_query (optional)
                - style (optional, block):
                    - has_value_labels (optional)
                    - line_type (optional)
                    - line_width (optional)
                    - order_by (optional)
                    - palette (optional)
            - right_yaxis (optional, block):
                - include_zero (optional)
                - label (optional)
                - max (optional)
                - min (optional)
                - scale (optional)
            - show_legend (optional)
            - title (optional)
            - title_align (optional)
            - title_size (optional)
            - yaxis (optional, block):
                - include_zero (optional)
                - label (optional)
                - max (optional)
                - min (optional)
                - scale (optional)
        - toplist_definition (optional, block):
            - custom_link (optional, block):
                - is_hidden (optional)
                - label (optional)
                - link (optional)
                - override_label (optional)
            - description (optional)
            - hide_incomplete_cost_data (optional)
            - live_span (optional)
            - request (optional, block):
                - apm_query (optional, block):
                    - compute_query (optional, block):
                        - aggregation (required)
                        - facet (optional)
                        - interval (optional)
                    - group_by (optional, block):
                        - facet (optional)
                        - limit (optional)
                        - sort_query (optional, block):
                            - aggregation (required)
                            - facet (optional)
                            - order (required)
                    - index (required)
                    - multi_compute (optional, block):
                        - aggregation (required)
                        - facet (optional)
                        - interval (optional)
                    - search_query (optional)
                - audit_query (optional, block):
                    - compute_query (optional, block):
                        - aggregation (required)
                        - facet (optional)
                        - interval (optional)
                    - group_by (optional, block):
                        - facet (optional)
                        - limit (optional)
                        - sort_query (optional, block):
                            - aggregation (required)
                            - facet (optional)
                            - order (required)
                    - index (required)
                    - multi_compute (optional, block):
                        - aggregation (required)
                        - facet (optional)
                        - interval (optional)
                    - search_query (optional)
                - conditional_formats (optional, block):
                    - comparator (required)
                    - custom_bg_color (optional)
                    - custom_fg_color (optional)
                    - hide_value (optional)
                    - image_url (optional)
                    - metric (optional)
                    - palette (required)
                    - timeframe (optional)
                    - value (required)
                - formula (optional, block):
                    - alias (optional)
                    - cell_display_mode (optional)
                    - conditional_formats (optional, block):
                        - comparator (required)
                        - custom_bg_color (optional)
                        - custom_fg_color (optional)
                        - hide_value (optional)
                        - image_url (optional)
                        - metric (optional)
                        - palette (required)
                        - timeframe (optional)
                        - value (required)
                    - formula_expression (required)
                    - limit (optional, block):
                        - count (optional)
                        - order (optional)
                    - number_format (optional, block):
                        - unit (required, block):
                            - canonical (optional, block):
                                - per_unit_name (optional)
                                - unit_name (required)
                            - custom (optional, block):
                                - label (required)
                        - unit_scale (optional, block):
                            - unit_name (required)
                    - style (optional, block):
                        - palette (optional)
                        - palette_index (optional)
                - log_query (optional, block):
                    - compute_query (optional, block):
                        - aggregation (required)
                        - facet (optional)
                        - interval (optional)
                    - group_by (optional, block):
                        - facet (optional)
                        - limit (optional)
                        - sort_query (optional, block):
                            - aggregation (required)
                            - facet (optional)
                            - order (required)
                    - index (required)
                    - multi_compute (optional, block):
                        - aggregation (required)
                        - facet (optional)
                        - interval (optional)
                    - search_query (optional)
                - process_query (optional, block):
                    - filter_by (optional)
                    - limit (optional)
                    - metric (required)
                    - search_by (optional)
                - q (optional)
                - query (optional, block):
                    - apm_dependency_stats_query (optional, block):
                        - cross_org_uuids (optional)
                        - data_source (required)
                        - env (required)
                        - is_upstream (optional)
                        - name (required)
                        - operation_name (required)
                        - primary_tag_name (optional)
                        - primary_tag_value (optional)
                        - resource_name (required)
                        - service (required)
                        - stat (required)
                    - apm_resource_stats_query (optional, block):
                        - cross_org_uuids (optional)
                        - data_source (required)
                        - env (required)
                        - group_by (optional)
                        - name (required)
                        - operation_name (optional)
                        - primary_tag_name (optional)
                        - primary_tag_value (optional)
                        - resource_name (optional)
                        - service (required)
                        - stat (required)
                    - cloud_cost_query (optional, block):
                        - aggregator (optional)
                        - cross_org_uuids (optional)
                        - data_source (required)
                        - name (required)
                        - query (required)
                    - event_query (optional, block):
                        - compute (required, block):
                            - aggregation (required)
                            - interval (optional)
                            - metric (optional)
                        - cross_org_uuids (optional)
                        - data_source (required)
                        - group_by (optional, block):
                            - facet (required)
                            - limit (optional)
                            - sort (optional, block):
                                - aggregation (required)
                                - metric (optional)
                                - order (optional)
                        - group_by_fields (optional, block):
                            - fields (required)
                            - limit (optional)
                            - sort (optional, block):
                                - aggregation (required)
                                - metric (optional)
                                - order (optional)
                        - indexes (optional)
                        - name (required)
                        - search (optional, block):
                            - query (required)
                        - storage (optional)
                    - metric_query (optional, block):
                        - aggregator (optional)
                        - cross_org_uuids (optional)
                        - data_source (optional)
                        - name (required)
                        - query (required)
                        - semantic_mode (optional)
                    - process_query (optional, block):
                        - aggregator (optional)
                        - cross_org_uuids (optional)
                        - data_source (required)
                        - is_normalized_cpu (optional)
                        - limit (optional)
                        - metric (required)
                        - name (required)
                        - sort (optional)
                        - tag_filters (optional)
                        - text_filter (optional)
                    - slo_query (optional, block):
                        - additional_query_filters (optional)
                        - cross_org_uuids (optional)
                        - data_source (required)
                        - group_mode (optional)
                        - measure (required)
                        - name (optional)
                        - slo_id (required)
                        - slo_query_type (optional)
                - rum_query (optional, block):
                    - compute_query (optional, block):
                        - aggregation (required)
                        - facet (optional)
                        - interval (optional)
                    - group_by (optional, block):
                        - facet (optional)
                        - limit (optional)
                        - sort_query (optional, block):
                            - aggregation (required)
                            - facet (optional)
                            - order (required)
                    - index (required)
                    - multi_compute (optional, block):
                        - aggregation (required)
                        - facet (optional)
                        - interval (optional)
                    - search_query (optional)
                - security_query (optional, block):
                    - compute_query (optional, block):
                        - aggregation (required)
                        - facet (optional)
                        - interval (optional)
                    - group_by (optional, block):
                        - facet (optional)
                        - limit (optional)
                        - sort_query (optional, block):
                            - aggregation (required)
                            - facet (optional)
                            - order (required)
                    - index (required)
                    - multi_compute (optional, block):
                        - aggregation (required)
                        - facet (optional)
                        - interval (optional)
                    - search_query (optional)
                - style (optional, block):
                    - palette (optional)
            - style (optional, block):
                - display (optional, block):
                    - type (required)
                - palette (optional)
                - scaling (optional)
            - title (optional)
            - title_align (optional)
            - title_size (optional)
        - topology_map_definition (optional, block):
            - custom_link (optional, block):
                - is_hidden (optional)
                - label (optional)
                - link (optional)
                - override_label (optional)
            - description (optional)
            - request (optional, block):
                - query (required, block):
                    - data_source (required)
                    - filters (required)
                    - service (required)
                - request_type (required)
            - title (optional)
            - title_align (optional)
            - title_size (optional)
        - trace_service_definition (optional, block):
            - display_format (optional)
            - env (required)
            - hide_incomplete_cost_data (optional)
            - live_span (optional)
            - service (required)
            - show_breakdown (optional)
            - show_distribution (optional)
            - show_errors (optional)
            - show_hits (optional)
            - show_latency (optional)
            - show_resource_list (optional)
            - size_format (optional)
            - span_name (required)
            - title (optional)
            - title_align (optional)
            - title_size (optional)
        - treemap_definition (optional, block):
            - custom_links (optional, block):
                - is_hidden (optional)
                - label (optional)
                - link (optional)
                - override_label (optional)
            - description (optional)
            - request (optional, block):
                - formula (optional, block):
                    - alias (optional)
                    - cell_display_mode (optional)
                    - conditional_formats (optional, block):
                        - comparator (required)
                        - custom_bg_color (optional)
                        - custom_fg_color (optional)
                        - hide_value (optional)
                        - image_url (optional)
                        - metric (optional)
                        - palette (required)
                        - timeframe (optional)
                        - value (required)
                    - formula_expression (required)
                    - limit (optional, block):
                        - count (optional)
                        - order (optional)
                    - number_format (optional, block):
                        - unit (required, block):
                            - canonical (optional, block):
                                - per_unit_name (optional)
                                - unit_name (required)
                            - custom (optional, block):
                                - label (required)
                        - unit_scale (optional, block):
                            - unit_name (required)
                    - style (optional, block):
                        - palette (optional)
                        - palette_index (optional)
                - query (optional, block):
                    - apm_dependency_stats_query (optional, block):
                        - cross_org_uuids (optional)
                        - data_source (required)
                        - env (required)
                        - is_upstream (optional)
                        - name (required)
                        - operation_name (required)
                        - primary_tag_name (optional)
                        - primary_tag_value (optional)
                        - resource_name (required)
                        - service (required)
                        - stat (required)
                    - apm_resource_stats_query (optional, block):
                        - cross_org_uuids (optional)
                        - data_source (required)
                        - env (required)
                        - group_by (optional)
                        - name (required)
                        - operation_name (optional)
                        - primary_tag_name (optional)
                        - primary_tag_value (optional)
                        - resource_name (optional)
                        - service (required)
                        - stat (required)
                    - cloud_cost_query (optional, block):
                        - aggregator (optional)
                        - cross_org_uuids (optional)
                        - data_source (required)
                        - name (required)
                        - query (required)
                    - event_query (optional, block):
                        - compute (required, block):
                            - aggregation (required)
                            - interval (optional)
                            - metric (optional)
                        - cross_org_uuids (optional)
                        - data_source (required)
                        - group_by (optional, block):
                            - facet (required)
                            - limit (optional)
                            - sort (optional, block):
                                - aggregation (required)
                                - metric (optional)
                                - order (optional)
                        - group_by_fields (optional, block):
                            - fields (required)
                            - limit (optional)
                            - sort (optional, block):
                                - aggregation (required)
                                - metric (optional)
                                - order (optional)
                        - indexes (optional)
                        - name (required)
                        - search (optional, block):
                            - query (required)
                        - storage (optional)
                    - metric_query (optional, block):
                        - aggregator (optional)
                        - cross_org_uuids (optional)
                        - data_source (optional)
                        - name (required)
                        - query (required)
                        - semantic_mode (optional)
                    - process_query (optional, block):
                        - aggregator (optional)
                        - cross_org_uuids (optional)
                        - data_source (required)
                        - is_normalized_cpu (optional)
                        - limit (optional)
                        - metric (required)
                        - name (required)
                        - sort (optional)
                        - tag_filters (optional)
                        - text_filter (optional)
                    - slo_query (optional, block):
                        - additional_query_filters (optional)
                        - cross_org_uuids (optional)
                        - data_source (required)
                        - group_mode (optional)
                        - measure (required)
                        - name (optional)
                        - slo_id (required)
                        - slo_query_type (optional)
            - title (optional)
        - widget_layout (optional, block):
            - height (required)
            - is_column_break (optional)
            - width (required)
            - x (required)
            - y (required)
EOT

  type = map(object({
    description = optional(string)
    live_span   = optional(string)
    name        = optional(string)
    show_title  = optional(bool)
    tags        = optional(set(string))
    layout = optional(object({
      height = optional(number)
      width  = optional(number)
      x      = optional(number)
      y      = optional(number)
    }))
    template_variables = optional(list(object({
      defaults = optional(list(string))
      name     = string
    })))
    widget = optional(list(object({
      alert_graph_definition = optional(object({
        alert_id                  = string
        hide_incomplete_cost_data = optional(bool)
        live_span                 = optional(string)
        title                     = optional(string)
        title_align               = optional(string)
        title_size                = optional(string)
        viz_type                  = string
      }))
      alert_value_definition = optional(object({
        alert_id    = string
        description = optional(string)
        precision   = optional(number)
        text_align  = optional(string)
        title       = optional(string)
        title_align = optional(string)
        title_size  = optional(string)
        unit        = optional(string)
      }))
      change_definition = optional(object({
        custom_link = optional(list(object({
          is_hidden      = optional(bool)
          label          = optional(string)
          link           = optional(string)
          override_label = optional(string)
        })))
        description               = optional(string)
        hide_incomplete_cost_data = optional(bool)
        live_span                 = optional(string)
        request = optional(list(object({
          apm_query = optional(object({
            compute_query = optional(object({
              aggregation = string
              facet       = optional(string)
              interval    = optional(number)
            }))
            group_by = optional(list(object({
              facet = optional(string)
              limit = optional(number)
              sort_query = optional(object({
                aggregation = string
                facet       = optional(string)
                order       = string
              }))
            })))
            index = string
            multi_compute = optional(list(object({
              aggregation = string
              facet       = optional(string)
              interval    = optional(number)
            })))
            search_query = optional(string)
          }))
          change_type = optional(string)
          compare_to  = optional(string)
          formula = optional(list(object({
            alias             = optional(string)
            cell_display_mode = optional(string)
            conditional_formats = optional(list(object({
              comparator      = string
              custom_bg_color = optional(string)
              custom_fg_color = optional(string)
              hide_value      = optional(bool)
              image_url       = optional(string)
              metric          = optional(string)
              palette         = string
              timeframe       = optional(string)
              value           = number
            })))
            formula_expression = string
            limit = optional(object({
              count = optional(number)
              order = optional(string)
            }))
            number_format = optional(object({
              unit = object({
                canonical = optional(object({
                  per_unit_name = optional(string)
                  unit_name     = string
                }))
                custom = optional(object({
                  label = string
                }))
              })
              unit_scale = optional(object({
                unit_name = string
              }))
            }))
            style = optional(object({
              palette       = optional(string)
              palette_index = optional(number)
            }))
          })))
          increase_good = optional(bool)
          log_query = optional(object({
            compute_query = optional(object({
              aggregation = string
              facet       = optional(string)
              interval    = optional(number)
            }))
            group_by = optional(list(object({
              facet = optional(string)
              limit = optional(number)
              sort_query = optional(object({
                aggregation = string
                facet       = optional(string)
                order       = string
              }))
            })))
            index = string
            multi_compute = optional(list(object({
              aggregation = string
              facet       = optional(string)
              interval    = optional(number)
            })))
            search_query = optional(string)
          }))
          order_by  = optional(string)
          order_dir = optional(string)
          process_query = optional(object({
            filter_by = optional(list(string))
            limit     = optional(number)
            metric    = string
            search_by = optional(string)
          }))
          q = optional(string)
          query = optional(list(object({
            apm_dependency_stats_query = optional(object({
              cross_org_uuids   = optional(list(string))
              data_source       = string
              env               = string
              is_upstream       = optional(bool)
              name              = string
              operation_name    = string
              primary_tag_name  = optional(string)
              primary_tag_value = optional(string)
              resource_name     = string
              service           = string
              stat              = string
            }))
            apm_resource_stats_query = optional(object({
              cross_org_uuids   = optional(list(string))
              data_source       = string
              env               = string
              group_by          = optional(list(string))
              name              = string
              operation_name    = optional(string)
              primary_tag_name  = optional(string)
              primary_tag_value = optional(string)
              resource_name     = optional(string)
              service           = string
              stat              = string
            }))
            cloud_cost_query = optional(object({
              aggregator      = optional(string)
              cross_org_uuids = optional(list(string))
              data_source     = string
              name            = string
              query           = string
            }))
            event_query = optional(object({
              compute = list(object({
                aggregation = string
                interval    = optional(number)
                metric      = optional(string)
              }))
              cross_org_uuids = optional(list(string))
              data_source     = string
              group_by = optional(list(object({
                facet = string
                limit = optional(number)
                sort = optional(object({
                  aggregation = string
                  metric      = optional(string)
                  order       = optional(string)
                }))
              })))
              group_by_fields = optional(object({
                fields = list(string)
                limit  = optional(number)
                sort = optional(object({
                  aggregation = string
                  metric      = optional(string)
                  order       = optional(string)
                }))
              }))
              indexes = optional(list(string))
              name    = string
              search = optional(object({
                query = string
              }))
              storage = optional(string)
            }))
            metric_query = optional(object({
              aggregator      = optional(string)
              cross_org_uuids = optional(list(string))
              data_source     = optional(string)
              name            = string
              query           = string
              semantic_mode   = optional(string)
            }))
            process_query = optional(object({
              aggregator        = optional(string)
              cross_org_uuids   = optional(list(string))
              data_source       = string
              is_normalized_cpu = optional(bool)
              limit             = optional(number)
              metric            = string
              name              = string
              sort              = optional(string)
              tag_filters       = optional(list(string))
              text_filter       = optional(string)
            }))
            slo_query = optional(object({
              additional_query_filters = optional(string)
              cross_org_uuids          = optional(list(string))
              data_source              = string
              group_mode               = optional(string)
              measure                  = string
              name                     = optional(string)
              slo_id                   = string
              slo_query_type           = optional(string)
            }))
          })))
          rum_query = optional(object({
            compute_query = optional(object({
              aggregation = string
              facet       = optional(string)
              interval    = optional(number)
            }))
            group_by = optional(list(object({
              facet = optional(string)
              limit = optional(number)
              sort_query = optional(object({
                aggregation = string
                facet       = optional(string)
                order       = string
              }))
            })))
            index = string
            multi_compute = optional(list(object({
              aggregation = string
              facet       = optional(string)
              interval    = optional(number)
            })))
            search_query = optional(string)
          }))
          security_query = optional(object({
            compute_query = optional(object({
              aggregation = string
              facet       = optional(string)
              interval    = optional(number)
            }))
            group_by = optional(list(object({
              facet = optional(string)
              limit = optional(number)
              sort_query = optional(object({
                aggregation = string
                facet       = optional(string)
                order       = string
              }))
            })))
            index = string
            multi_compute = optional(list(object({
              aggregation = string
              facet       = optional(string)
              interval    = optional(number)
            })))
            search_query = optional(string)
          }))
          show_present = optional(bool)
        })))
        title       = optional(string)
        title_align = optional(string)
        title_size  = optional(string)
      }))
      check_status_definition = optional(object({
        check                     = string
        group                     = optional(string)
        group_by                  = optional(list(string))
        grouping                  = string
        hide_incomplete_cost_data = optional(bool)
        live_span                 = optional(string)
        tags                      = optional(list(string))
        title                     = optional(string)
        title_align               = optional(string)
        title_size                = optional(string)
      }))
      distribution_definition = optional(object({
        description               = optional(string)
        hide_incomplete_cost_data = optional(bool)
        legend_size               = optional(string)
        live_span                 = optional(string)
        request = optional(list(object({
          apm_query = optional(object({
            compute_query = optional(object({
              aggregation = string
              facet       = optional(string)
              interval    = optional(number)
            }))
            group_by = optional(list(object({
              facet = optional(string)
              limit = optional(number)
              sort_query = optional(object({
                aggregation = string
                facet       = optional(string)
                order       = string
              }))
            })))
            index = string
            multi_compute = optional(list(object({
              aggregation = string
              facet       = optional(string)
              interval    = optional(number)
            })))
            search_query = optional(string)
          }))
          apm_stats_query = optional(object({
            columns = optional(list(object({
              alias             = optional(string)
              cell_display_mode = optional(string)
              name              = string
              order             = optional(string)
            })))
            env         = string
            name        = string
            primary_tag = string
            resource    = optional(string)
            row_type    = string
            service     = string
          }))
          log_query = optional(object({
            compute_query = optional(object({
              aggregation = string
              facet       = optional(string)
              interval    = optional(number)
            }))
            group_by = optional(list(object({
              facet = optional(string)
              limit = optional(number)
              sort_query = optional(object({
                aggregation = string
                facet       = optional(string)
                order       = string
              }))
            })))
            index = string
            multi_compute = optional(list(object({
              aggregation = string
              facet       = optional(string)
              interval    = optional(number)
            })))
            search_query = optional(string)
          }))
          process_query = optional(object({
            filter_by = optional(list(string))
            limit     = optional(number)
            metric    = string
            search_by = optional(string)
          }))
          q = optional(string)
          rum_query = optional(object({
            compute_query = optional(object({
              aggregation = string
              facet       = optional(string)
              interval    = optional(number)
            }))
            group_by = optional(list(object({
              facet = optional(string)
              limit = optional(number)
              sort_query = optional(object({
                aggregation = string
                facet       = optional(string)
                order       = string
              }))
            })))
            index = string
            multi_compute = optional(list(object({
              aggregation = string
              facet       = optional(string)
              interval    = optional(number)
            })))
            search_query = optional(string)
          }))
          security_query = optional(object({
            compute_query = optional(object({
              aggregation = string
              facet       = optional(string)
              interval    = optional(number)
            }))
            group_by = optional(list(object({
              facet = optional(string)
              limit = optional(number)
              sort_query = optional(object({
                aggregation = string
                facet       = optional(string)
                order       = string
              }))
            })))
            index = string
            multi_compute = optional(list(object({
              aggregation = string
              facet       = optional(string)
              interval    = optional(number)
            })))
            search_query = optional(string)
          }))
          style = optional(object({
            palette = optional(string)
          }))
        })))
        show_legend = optional(bool)
        title       = optional(string)
        title_align = optional(string)
        title_size  = optional(string)
        xaxis = optional(object({
          include_zero = optional(bool)
          max          = optional(string)
          min          = optional(string)
          scale        = optional(string)
        }))
        yaxis = optional(object({
          include_zero = optional(bool)
          label        = optional(string)
          max          = optional(string)
          min          = optional(string)
          scale        = optional(string)
        }))
      }))
      event_stream_definition = optional(object({
        description               = optional(string)
        event_size                = optional(string)
        hide_incomplete_cost_data = optional(bool)
        live_span                 = optional(string)
        query                     = string
        tags_execution            = optional(string)
        title                     = optional(string)
        title_align               = optional(string)
        title_size                = optional(string)
      }))
      event_timeline_definition = optional(object({
        description               = optional(string)
        hide_incomplete_cost_data = optional(bool)
        live_span                 = optional(string)
        query                     = string
        tags_execution            = optional(string)
        title                     = optional(string)
        title_align               = optional(string)
        title_size                = optional(string)
      }))
      free_text_definition = optional(object({
        color       = optional(string)
        description = optional(string)
        font_size   = optional(string)
        text        = string
        text_align  = optional(string)
      }))
      geomap_definition = optional(object({
        custom_link = optional(list(object({
          is_hidden      = optional(bool)
          label          = optional(string)
          link           = optional(string)
          override_label = optional(string)
        })))
        description               = optional(string)
        hide_incomplete_cost_data = optional(bool)
        live_span                 = optional(string)
        request = optional(list(object({
          formula = optional(list(object({
            alias             = optional(string)
            cell_display_mode = optional(string)
            conditional_formats = optional(list(object({
              comparator      = string
              custom_bg_color = optional(string)
              custom_fg_color = optional(string)
              hide_value      = optional(bool)
              image_url       = optional(string)
              metric          = optional(string)
              palette         = string
              timeframe       = optional(string)
              value           = number
            })))
            formula_expression = string
            limit = optional(object({
              count = optional(number)
              order = optional(string)
            }))
            number_format = optional(object({
              unit = object({
                canonical = optional(object({
                  per_unit_name = optional(string)
                  unit_name     = string
                }))
                custom = optional(object({
                  label = string
                }))
              })
              unit_scale = optional(object({
                unit_name = string
              }))
            }))
            style = optional(object({
              palette       = optional(string)
              palette_index = optional(number)
            }))
          })))
          log_query = optional(object({
            compute_query = optional(object({
              aggregation = string
              facet       = optional(string)
              interval    = optional(number)
            }))
            group_by = optional(list(object({
              facet = optional(string)
              limit = optional(number)
              sort_query = optional(object({
                aggregation = string
                facet       = optional(string)
                order       = string
              }))
            })))
            index = string
            multi_compute = optional(list(object({
              aggregation = string
              facet       = optional(string)
              interval    = optional(number)
            })))
            search_query = optional(string)
          }))
          q = optional(string)
          query = optional(list(object({
            apm_dependency_stats_query = optional(object({
              cross_org_uuids   = optional(list(string))
              data_source       = string
              env               = string
              is_upstream       = optional(bool)
              name              = string
              operation_name    = string
              primary_tag_name  = optional(string)
              primary_tag_value = optional(string)
              resource_name     = string
              service           = string
              stat              = string
            }))
            apm_resource_stats_query = optional(object({
              cross_org_uuids   = optional(list(string))
              data_source       = string
              env               = string
              group_by          = optional(list(string))
              name              = string
              operation_name    = optional(string)
              primary_tag_name  = optional(string)
              primary_tag_value = optional(string)
              resource_name     = optional(string)
              service           = string
              stat              = string
            }))
            cloud_cost_query = optional(object({
              aggregator      = optional(string)
              cross_org_uuids = optional(list(string))
              data_source     = string
              name            = string
              query           = string
            }))
            event_query = optional(object({
              compute = list(object({
                aggregation = string
                interval    = optional(number)
                metric      = optional(string)
              }))
              cross_org_uuids = optional(list(string))
              data_source     = string
              group_by = optional(list(object({
                facet = string
                limit = optional(number)
                sort = optional(object({
                  aggregation = string
                  metric      = optional(string)
                  order       = optional(string)
                }))
              })))
              group_by_fields = optional(object({
                fields = list(string)
                limit  = optional(number)
                sort = optional(object({
                  aggregation = string
                  metric      = optional(string)
                  order       = optional(string)
                }))
              }))
              indexes = optional(list(string))
              name    = string
              search = optional(object({
                query = string
              }))
              storage = optional(string)
            }))
            metric_query = optional(object({
              aggregator      = optional(string)
              cross_org_uuids = optional(list(string))
              data_source     = optional(string)
              name            = string
              query           = string
              semantic_mode   = optional(string)
            }))
            process_query = optional(object({
              aggregator        = optional(string)
              cross_org_uuids   = optional(list(string))
              data_source       = string
              is_normalized_cpu = optional(bool)
              limit             = optional(number)
              metric            = string
              name              = string
              sort              = optional(string)
              tag_filters       = optional(list(string))
              text_filter       = optional(string)
            }))
            slo_query = optional(object({
              additional_query_filters = optional(string)
              cross_org_uuids          = optional(list(string))
              data_source              = string
              group_mode               = optional(string)
              measure                  = string
              name                     = optional(string)
              slo_id                   = string
              slo_query_type           = optional(string)
            }))
          })))
          rum_query = optional(object({
            compute_query = optional(object({
              aggregation = string
              facet       = optional(string)
              interval    = optional(number)
            }))
            group_by = optional(list(object({
              facet = optional(string)
              limit = optional(number)
              sort_query = optional(object({
                aggregation = string
                facet       = optional(string)
                order       = string
              }))
            })))
            index = string
            multi_compute = optional(list(object({
              aggregation = string
              facet       = optional(string)
              interval    = optional(number)
            })))
            search_query = optional(string)
          }))
        })))
        style = optional(object({
          palette      = string
          palette_flip = bool
        }))
        title       = optional(string)
        title_align = optional(string)
        title_size  = optional(string)
        view = object({
          focus = string
        })
      }))
      heatmap_definition = optional(object({
        custom_link = optional(list(object({
          is_hidden      = optional(bool)
          label          = optional(string)
          link           = optional(string)
          override_label = optional(string)
        })))
        description = optional(string)
        event = optional(list(object({
          q              = string
          tags_execution = optional(string)
        })))
        hide_incomplete_cost_data = optional(bool)
        legend_size               = optional(string)
        live_span                 = optional(string)
        request = optional(list(object({
          apm_query = optional(object({
            compute_query = optional(object({
              aggregation = string
              facet       = optional(string)
              interval    = optional(number)
            }))
            group_by = optional(list(object({
              facet = optional(string)
              limit = optional(number)
              sort_query = optional(object({
                aggregation = string
                facet       = optional(string)
                order       = string
              }))
            })))
            index = string
            multi_compute = optional(list(object({
              aggregation = string
              facet       = optional(string)
              interval    = optional(number)
            })))
            search_query = optional(string)
          }))
          formula = optional(list(object({
            alias             = optional(string)
            cell_display_mode = optional(string)
            conditional_formats = optional(list(object({
              comparator      = string
              custom_bg_color = optional(string)
              custom_fg_color = optional(string)
              hide_value      = optional(bool)
              image_url       = optional(string)
              metric          = optional(string)
              palette         = string
              timeframe       = optional(string)
              value           = number
            })))
            formula_expression = string
            limit = optional(object({
              count = optional(number)
              order = optional(string)
            }))
            number_format = optional(object({
              unit = object({
                canonical = optional(object({
                  per_unit_name = optional(string)
                  unit_name     = string
                }))
                custom = optional(object({
                  label = string
                }))
              })
              unit_scale = optional(object({
                unit_name = string
              }))
            }))
            style = optional(object({
              palette       = optional(string)
              palette_index = optional(number)
            }))
          })))
          log_query = optional(object({
            compute_query = optional(object({
              aggregation = string
              facet       = optional(string)
              interval    = optional(number)
            }))
            group_by = optional(list(object({
              facet = optional(string)
              limit = optional(number)
              sort_query = optional(object({
                aggregation = string
                facet       = optional(string)
                order       = string
              }))
            })))
            index = string
            multi_compute = optional(list(object({
              aggregation = string
              facet       = optional(string)
              interval    = optional(number)
            })))
            search_query = optional(string)
          }))
          process_query = optional(object({
            filter_by = optional(list(string))
            limit     = optional(number)
            metric    = string
            search_by = optional(string)
          }))
          q = optional(string)
          query = optional(list(object({
            apm_dependency_stats_query = optional(object({
              cross_org_uuids   = optional(list(string))
              data_source       = string
              env               = string
              is_upstream       = optional(bool)
              name              = string
              operation_name    = string
              primary_tag_name  = optional(string)
              primary_tag_value = optional(string)
              resource_name     = string
              service           = string
              stat              = string
            }))
            apm_resource_stats_query = optional(object({
              cross_org_uuids   = optional(list(string))
              data_source       = string
              env               = string
              group_by          = optional(list(string))
              name              = string
              operation_name    = optional(string)
              primary_tag_name  = optional(string)
              primary_tag_value = optional(string)
              resource_name     = optional(string)
              service           = string
              stat              = string
            }))
            cloud_cost_query = optional(object({
              aggregator      = optional(string)
              cross_org_uuids = optional(list(string))
              data_source     = string
              name            = string
              query           = string
            }))
            event_query = optional(object({
              compute = list(object({
                aggregation = string
                interval    = optional(number)
                metric      = optional(string)
              }))
              cross_org_uuids = optional(list(string))
              data_source     = string
              group_by = optional(list(object({
                facet = string
                limit = optional(number)
                sort = optional(object({
                  aggregation = string
                  metric      = optional(string)
                  order       = optional(string)
                }))
              })))
              group_by_fields = optional(object({
                fields = list(string)
                limit  = optional(number)
                sort = optional(object({
                  aggregation = string
                  metric      = optional(string)
                  order       = optional(string)
                }))
              }))
              indexes = optional(list(string))
              name    = string
              search = optional(object({
                query = string
              }))
              storage = optional(string)
            }))
            metric_query = optional(object({
              aggregator      = optional(string)
              cross_org_uuids = optional(list(string))
              data_source     = optional(string)
              name            = string
              query           = string
              semantic_mode   = optional(string)
            }))
            process_query = optional(object({
              aggregator        = optional(string)
              cross_org_uuids   = optional(list(string))
              data_source       = string
              is_normalized_cpu = optional(bool)
              limit             = optional(number)
              metric            = string
              name              = string
              sort              = optional(string)
              tag_filters       = optional(list(string))
              text_filter       = optional(string)
            }))
            slo_query = optional(object({
              additional_query_filters = optional(string)
              cross_org_uuids          = optional(list(string))
              data_source              = string
              group_mode               = optional(string)
              measure                  = string
              name                     = optional(string)
              slo_id                   = string
              slo_query_type           = optional(string)
            }))
          })))
          rum_query = optional(object({
            compute_query = optional(object({
              aggregation = string
              facet       = optional(string)
              interval    = optional(number)
            }))
            group_by = optional(list(object({
              facet = optional(string)
              limit = optional(number)
              sort_query = optional(object({
                aggregation = string
                facet       = optional(string)
                order       = string
              }))
            })))
            index = string
            multi_compute = optional(list(object({
              aggregation = string
              facet       = optional(string)
              interval    = optional(number)
            })))
            search_query = optional(string)
          }))
          security_query = optional(object({
            compute_query = optional(object({
              aggregation = string
              facet       = optional(string)
              interval    = optional(number)
            }))
            group_by = optional(list(object({
              facet = optional(string)
              limit = optional(number)
              sort_query = optional(object({
                aggregation = string
                facet       = optional(string)
                order       = string
              }))
            })))
            index = string
            multi_compute = optional(list(object({
              aggregation = string
              facet       = optional(string)
              interval    = optional(number)
            })))
            search_query = optional(string)
          }))
          style = optional(object({
            palette = optional(string)
          }))
        })))
        show_legend = optional(bool)
        title       = optional(string)
        title_align = optional(string)
        title_size  = optional(string)
        yaxis = optional(object({
          include_zero = optional(bool)
          label        = optional(string)
          max          = optional(string)
          min          = optional(string)
          scale        = optional(string)
        }))
      }))
      hostmap_definition = optional(object({
        custom_link = optional(list(object({
          is_hidden      = optional(bool)
          label          = optional(string)
          link           = optional(string)
          override_label = optional(string)
        })))
        description     = optional(string)
        group           = optional(list(string))
        no_group_hosts  = optional(bool)
        no_metric_hosts = optional(bool)
        node_type       = optional(string)
        request = optional(object({
          fill = optional(list(object({
            apm_query = optional(object({
              compute_query = optional(object({
                aggregation = string
                facet       = optional(string)
                interval    = optional(number)
              }))
              group_by = optional(list(object({
                facet = optional(string)
                limit = optional(number)
                sort_query = optional(object({
                  aggregation = string
                  facet       = optional(string)
                  order       = string
                }))
              })))
              index = string
              multi_compute = optional(list(object({
                aggregation = string
                facet       = optional(string)
                interval    = optional(number)
              })))
              search_query = optional(string)
            }))
            log_query = optional(object({
              compute_query = optional(object({
                aggregation = string
                facet       = optional(string)
                interval    = optional(number)
              }))
              group_by = optional(list(object({
                facet = optional(string)
                limit = optional(number)
                sort_query = optional(object({
                  aggregation = string
                  facet       = optional(string)
                  order       = string
                }))
              })))
              index = string
              multi_compute = optional(list(object({
                aggregation = string
                facet       = optional(string)
                interval    = optional(number)
              })))
              search_query = optional(string)
            }))
            process_query = optional(object({
              filter_by = optional(list(string))
              limit     = optional(number)
              metric    = string
              search_by = optional(string)
            }))
            q = optional(string)
            rum_query = optional(object({
              compute_query = optional(object({
                aggregation = string
                facet       = optional(string)
                interval    = optional(number)
              }))
              group_by = optional(list(object({
                facet = optional(string)
                limit = optional(number)
                sort_query = optional(object({
                  aggregation = string
                  facet       = optional(string)
                  order       = string
                }))
              })))
              index = string
              multi_compute = optional(list(object({
                aggregation = string
                facet       = optional(string)
                interval    = optional(number)
              })))
              search_query = optional(string)
            }))
            security_query = optional(object({
              compute_query = optional(object({
                aggregation = string
                facet       = optional(string)
                interval    = optional(number)
              }))
              group_by = optional(list(object({
                facet = optional(string)
                limit = optional(number)
                sort_query = optional(object({
                  aggregation = string
                  facet       = optional(string)
                  order       = string
                }))
              })))
              index = string
              multi_compute = optional(list(object({
                aggregation = string
                facet       = optional(string)
                interval    = optional(number)
              })))
              search_query = optional(string)
            }))
          })))
          size = optional(list(object({
            apm_query = optional(object({
              compute_query = optional(object({
                aggregation = string
                facet       = optional(string)
                interval    = optional(number)
              }))
              group_by = optional(list(object({
                facet = optional(string)
                limit = optional(number)
                sort_query = optional(object({
                  aggregation = string
                  facet       = optional(string)
                  order       = string
                }))
              })))
              index = string
              multi_compute = optional(list(object({
                aggregation = string
                facet       = optional(string)
                interval    = optional(number)
              })))
              search_query = optional(string)
            }))
            log_query = optional(object({
              compute_query = optional(object({
                aggregation = string
                facet       = optional(string)
                interval    = optional(number)
              }))
              group_by = optional(list(object({
                facet = optional(string)
                limit = optional(number)
                sort_query = optional(object({
                  aggregation = string
                  facet       = optional(string)
                  order       = string
                }))
              })))
              index = string
              multi_compute = optional(list(object({
                aggregation = string
                facet       = optional(string)
                interval    = optional(number)
              })))
              search_query = optional(string)
            }))
            process_query = optional(object({
              filter_by = optional(list(string))
              limit     = optional(number)
              metric    = string
              search_by = optional(string)
            }))
            q = optional(string)
            rum_query = optional(object({
              compute_query = optional(object({
                aggregation = string
                facet       = optional(string)
                interval    = optional(number)
              }))
              group_by = optional(list(object({
                facet = optional(string)
                limit = optional(number)
                sort_query = optional(object({
                  aggregation = string
                  facet       = optional(string)
                  order       = string
                }))
              })))
              index = string
              multi_compute = optional(list(object({
                aggregation = string
                facet       = optional(string)
                interval    = optional(number)
              })))
              search_query = optional(string)
            }))
            security_query = optional(object({
              compute_query = optional(object({
                aggregation = string
                facet       = optional(string)
                interval    = optional(number)
              }))
              group_by = optional(list(object({
                facet = optional(string)
                limit = optional(number)
                sort_query = optional(object({
                  aggregation = string
                  facet       = optional(string)
                  order       = string
                }))
              })))
              index = string
              multi_compute = optional(list(object({
                aggregation = string
                facet       = optional(string)
                interval    = optional(number)
              })))
              search_query = optional(string)
            }))
          })))
        }))
        scope = optional(list(string))
        style = optional(object({
          fill_max     = optional(string)
          fill_min     = optional(string)
          palette      = optional(string)
          palette_flip = optional(bool)
        }))
        title       = optional(string)
        title_align = optional(string)
        title_size  = optional(string)
      }))
      iframe_definition = optional(object({
        url = string
      }))
      image_definition = optional(object({
        has_background   = optional(bool)
        has_border       = optional(bool)
        horizontal_align = optional(string)
        margin           = optional(string)
        sizing           = optional(string)
        url              = string
        url_dark_theme   = optional(string)
        vertical_align   = optional(string)
      }))
      list_stream_definition = optional(object({
        request = list(object({
          columns = list(object({
            field = optional(string)
            width = optional(string)
          }))
          description = optional(string)
          query = object({
            clustering_pattern_field_path = optional(string)
            data_source                   = string
            event_size                    = optional(string)
            group_by = optional(list(object({
              facet = string
            })))
            indexes      = optional(list(string))
            query_string = optional(string)
            sort = optional(object({
              column      = string
              description = optional(string)
              order       = string
            }))
            storage = optional(string)
          })
          response_format = string
        }))
        title       = optional(string)
        title_align = optional(string)
        title_size  = optional(string)
      }))
      log_stream_definition = optional(object({
        columns                   = optional(list(string))
        hide_incomplete_cost_data = optional(bool)
        indexes                   = optional(list(string))
        live_span                 = optional(string)
        message_display           = optional(string)
        query                     = optional(string)
        show_date_column          = optional(bool)
        show_message_column       = optional(bool)
        sort = optional(object({
          column      = string
          description = optional(string)
          order       = string
        }))
        title       = optional(string)
        title_align = optional(string)
        title_size  = optional(string)
      }))
      manage_status_definition = optional(object({
        color_preference    = optional(string)
        display_format      = optional(string)
        hide_zero_counts    = optional(bool)
        query               = string
        show_last_triggered = optional(bool)
        show_priority       = optional(bool)
        sort                = optional(string)
        summary_type        = optional(string)
        title               = optional(string)
        title_align         = optional(string)
        title_size          = optional(string)
      }))
      note_definition = optional(object({
        background_color = optional(string)
        content          = string
        description      = optional(string)
        font_size        = optional(string)
        has_padding      = optional(bool)
        show_tick        = optional(bool)
        text_align       = optional(string)
        tick_edge        = optional(string)
        tick_pos         = optional(string)
        vertical_align   = optional(string)
      }))
      query_table_definition = optional(object({
        custom_link = optional(list(object({
          is_hidden      = optional(bool)
          label          = optional(string)
          link           = optional(string)
          override_label = optional(string)
        })))
        description               = optional(string)
        has_search_bar            = optional(string)
        hide_incomplete_cost_data = optional(bool)
        live_span                 = optional(string)
        request = optional(list(object({
          aggregator = optional(string)
          alias      = optional(string)
          apm_query = optional(object({
            compute_query = optional(object({
              aggregation = string
              facet       = optional(string)
              interval    = optional(number)
            }))
            group_by = optional(list(object({
              facet = optional(string)
              limit = optional(number)
              sort_query = optional(object({
                aggregation = string
                facet       = optional(string)
                order       = string
              }))
            })))
            index = string
            multi_compute = optional(list(object({
              aggregation = string
              facet       = optional(string)
              interval    = optional(number)
            })))
            search_query = optional(string)
          }))
          apm_stats_query = optional(object({
            columns = optional(list(object({
              alias             = optional(string)
              cell_display_mode = optional(string)
              name              = string
              order             = optional(string)
            })))
            env         = string
            name        = string
            primary_tag = string
            resource    = optional(string)
            row_type    = string
            service     = string
          }))
          cell_display_mode = optional(list(string))
          conditional_formats = optional(list(object({
            comparator      = string
            custom_bg_color = optional(string)
            custom_fg_color = optional(string)
            hide_value      = optional(bool)
            image_url       = optional(string)
            metric          = optional(string)
            palette         = string
            timeframe       = optional(string)
            value           = number
          })))
          formula = optional(list(object({
            alias             = optional(string)
            cell_display_mode = optional(string)
            cell_display_mode_options = optional(object({
              trend_type = optional(string)
              y_scale    = optional(string)
            }))
            conditional_formats = optional(list(object({
              comparator      = string
              custom_bg_color = optional(string)
              custom_fg_color = optional(string)
              hide_value      = optional(bool)
              image_url       = optional(string)
              metric          = optional(string)
              palette         = string
              timeframe       = optional(string)
              value           = number
            })))
            formula_expression = string
            limit = optional(object({
              count = optional(number)
              order = optional(string)
            }))
            number_format = optional(object({
              unit = object({
                canonical = optional(object({
                  per_unit_name = optional(string)
                  unit_name     = string
                }))
                custom = optional(object({
                  label = string
                }))
              })
              unit_scale = optional(object({
                unit_name = string
              }))
            }))
            style = optional(object({
              palette       = optional(string)
              palette_index = optional(number)
            }))
          })))
          limit = optional(number)
          log_query = optional(object({
            compute_query = optional(object({
              aggregation = string
              facet       = optional(string)
              interval    = optional(number)
            }))
            group_by = optional(list(object({
              facet = optional(string)
              limit = optional(number)
              sort_query = optional(object({
                aggregation = string
                facet       = optional(string)
                order       = string
              }))
            })))
            index = string
            multi_compute = optional(list(object({
              aggregation = string
              facet       = optional(string)
              interval    = optional(number)
            })))
            search_query = optional(string)
          }))
          order = optional(string)
          process_query = optional(object({
            filter_by = optional(list(string))
            limit     = optional(number)
            metric    = string
            search_by = optional(string)
          }))
          q = optional(string)
          query = optional(list(object({
            apm_dependency_stats_query = optional(object({
              cross_org_uuids   = optional(list(string))
              data_source       = string
              env               = string
              is_upstream       = optional(bool)
              name              = string
              operation_name    = string
              primary_tag_name  = optional(string)
              primary_tag_value = optional(string)
              resource_name     = string
              service           = string
              stat              = string
            }))
            apm_resource_stats_query = optional(object({
              cross_org_uuids   = optional(list(string))
              data_source       = string
              env               = string
              group_by          = optional(list(string))
              name              = string
              operation_name    = optional(string)
              primary_tag_name  = optional(string)
              primary_tag_value = optional(string)
              resource_name     = optional(string)
              service           = string
              stat              = string
            }))
            cloud_cost_query = optional(object({
              aggregator      = optional(string)
              cross_org_uuids = optional(list(string))
              data_source     = string
              name            = string
              query           = string
            }))
            event_query = optional(object({
              compute = list(object({
                aggregation = string
                interval    = optional(number)
                metric      = optional(string)
              }))
              cross_org_uuids = optional(list(string))
              data_source     = string
              group_by = optional(list(object({
                facet = string
                limit = optional(number)
                sort = optional(object({
                  aggregation = string
                  metric      = optional(string)
                  order       = optional(string)
                }))
              })))
              group_by_fields = optional(object({
                fields = list(string)
                limit  = optional(number)
                sort = optional(object({
                  aggregation = string
                  metric      = optional(string)
                  order       = optional(string)
                }))
              }))
              indexes = optional(list(string))
              name    = string
              search = optional(object({
                query = string
              }))
              storage = optional(string)
            }))
            metric_query = optional(object({
              aggregator      = optional(string)
              cross_org_uuids = optional(list(string))
              data_source     = optional(string)
              name            = string
              query           = string
              semantic_mode   = optional(string)
            }))
            process_query = optional(object({
              aggregator        = optional(string)
              cross_org_uuids   = optional(list(string))
              data_source       = string
              is_normalized_cpu = optional(bool)
              limit             = optional(number)
              metric            = string
              name              = string
              sort              = optional(string)
              tag_filters       = optional(list(string))
              text_filter       = optional(string)
            }))
            slo_query = optional(object({
              additional_query_filters = optional(string)
              cross_org_uuids          = optional(list(string))
              data_source              = string
              group_mode               = optional(string)
              measure                  = string
              name                     = optional(string)
              slo_id                   = string
              slo_query_type           = optional(string)
            }))
          })))
          rum_query = optional(object({
            compute_query = optional(object({
              aggregation = string
              facet       = optional(string)
              interval    = optional(number)
            }))
            group_by = optional(list(object({
              facet = optional(string)
              limit = optional(number)
              sort_query = optional(object({
                aggregation = string
                facet       = optional(string)
                order       = string
              }))
            })))
            index = string
            multi_compute = optional(list(object({
              aggregation = string
              facet       = optional(string)
              interval    = optional(number)
            })))
            search_query = optional(string)
          }))
          security_query = optional(object({
            compute_query = optional(object({
              aggregation = string
              facet       = optional(string)
              interval    = optional(number)
            }))
            group_by = optional(list(object({
              facet = optional(string)
              limit = optional(number)
              sort_query = optional(object({
                aggregation = string
                facet       = optional(string)
                order       = string
              }))
            })))
            index = string
            multi_compute = optional(list(object({
              aggregation = string
              facet       = optional(string)
              interval    = optional(number)
            })))
            search_query = optional(string)
          }))
          text_formats = optional(list(object({
            text_format = optional(list(object({
              custom_bg_color = optional(string)
              custom_fg_color = optional(string)
              match = object({
                type  = string
                value = string
              })
              palette = optional(string)
              replace = optional(object({
                substring = optional(string)
                type      = string
                with      = string
              }))
            })))
          })))
        })))
        title       = optional(string)
        title_align = optional(string)
        title_size  = optional(string)
      }))
      query_value_definition = optional(object({
        autoscale = optional(bool)
        custom_link = optional(list(object({
          is_hidden      = optional(bool)
          label          = optional(string)
          link           = optional(string)
          override_label = optional(string)
        })))
        custom_unit               = optional(string)
        description               = optional(string)
        hide_incomplete_cost_data = optional(bool)
        live_span                 = optional(string)
        precision                 = optional(number)
        request = optional(list(object({
          aggregator = optional(string)
          apm_query = optional(object({
            compute_query = optional(object({
              aggregation = string
              facet       = optional(string)
              interval    = optional(number)
            }))
            group_by = optional(list(object({
              facet = optional(string)
              limit = optional(number)
              sort_query = optional(object({
                aggregation = string
                facet       = optional(string)
                order       = string
              }))
            })))
            index = string
            multi_compute = optional(list(object({
              aggregation = string
              facet       = optional(string)
              interval    = optional(number)
            })))
            search_query = optional(string)
          }))
          audit_query = optional(object({
            compute_query = optional(object({
              aggregation = string
              facet       = optional(string)
              interval    = optional(number)
            }))
            group_by = optional(list(object({
              facet = optional(string)
              limit = optional(number)
              sort_query = optional(object({
                aggregation = string
                facet       = optional(string)
                order       = string
              }))
            })))
            index = string
            multi_compute = optional(list(object({
              aggregation = string
              facet       = optional(string)
              interval    = optional(number)
            })))
            search_query = optional(string)
          }))
          conditional_formats = optional(list(object({
            comparator      = string
            custom_bg_color = optional(string)
            custom_fg_color = optional(string)
            hide_value      = optional(bool)
            image_url       = optional(string)
            metric          = optional(string)
            palette         = string
            timeframe       = optional(string)
            value           = number
          })))
          formula = optional(list(object({
            alias             = optional(string)
            cell_display_mode = optional(string)
            conditional_formats = optional(list(object({
              comparator      = string
              custom_bg_color = optional(string)
              custom_fg_color = optional(string)
              hide_value      = optional(bool)
              image_url       = optional(string)
              metric          = optional(string)
              palette         = string
              timeframe       = optional(string)
              value           = number
            })))
            formula_expression = string
            limit = optional(object({
              count = optional(number)
              order = optional(string)
            }))
            number_format = optional(object({
              unit = object({
                canonical = optional(object({
                  per_unit_name = optional(string)
                  unit_name     = string
                }))
                custom = optional(object({
                  label = string
                }))
              })
              unit_scale = optional(object({
                unit_name = string
              }))
            }))
            style = optional(object({
              palette       = optional(string)
              palette_index = optional(number)
            }))
          })))
          log_query = optional(object({
            compute_query = optional(object({
              aggregation = string
              facet       = optional(string)
              interval    = optional(number)
            }))
            group_by = optional(list(object({
              facet = optional(string)
              limit = optional(number)
              sort_query = optional(object({
                aggregation = string
                facet       = optional(string)
                order       = string
              }))
            })))
            index = string
            multi_compute = optional(list(object({
              aggregation = string
              facet       = optional(string)
              interval    = optional(number)
            })))
            search_query = optional(string)
          }))
          process_query = optional(object({
            filter_by = optional(list(string))
            limit     = optional(number)
            metric    = string
            search_by = optional(string)
          }))
          q = optional(string)
          query = optional(list(object({
            apm_dependency_stats_query = optional(object({
              cross_org_uuids   = optional(list(string))
              data_source       = string
              env               = string
              is_upstream       = optional(bool)
              name              = string
              operation_name    = string
              primary_tag_name  = optional(string)
              primary_tag_value = optional(string)
              resource_name     = string
              service           = string
              stat              = string
            }))
            apm_resource_stats_query = optional(object({
              cross_org_uuids   = optional(list(string))
              data_source       = string
              env               = string
              group_by          = optional(list(string))
              name              = string
              operation_name    = optional(string)
              primary_tag_name  = optional(string)
              primary_tag_value = optional(string)
              resource_name     = optional(string)
              service           = string
              stat              = string
            }))
            cloud_cost_query = optional(object({
              aggregator      = optional(string)
              cross_org_uuids = optional(list(string))
              data_source     = string
              name            = string
              query           = string
            }))
            event_query = optional(object({
              compute = list(object({
                aggregation = string
                interval    = optional(number)
                metric      = optional(string)
              }))
              cross_org_uuids = optional(list(string))
              data_source     = string
              group_by = optional(list(object({
                facet = string
                limit = optional(number)
                sort = optional(object({
                  aggregation = string
                  metric      = optional(string)
                  order       = optional(string)
                }))
              })))
              group_by_fields = optional(object({
                fields = list(string)
                limit  = optional(number)
                sort = optional(object({
                  aggregation = string
                  metric      = optional(string)
                  order       = optional(string)
                }))
              }))
              indexes = optional(list(string))
              name    = string
              search = optional(object({
                query = string
              }))
              storage = optional(string)
            }))
            metric_query = optional(object({
              aggregator      = optional(string)
              cross_org_uuids = optional(list(string))
              data_source     = optional(string)
              name            = string
              query           = string
              semantic_mode   = optional(string)
            }))
            process_query = optional(object({
              aggregator        = optional(string)
              cross_org_uuids   = optional(list(string))
              data_source       = string
              is_normalized_cpu = optional(bool)
              limit             = optional(number)
              metric            = string
              name              = string
              sort              = optional(string)
              tag_filters       = optional(list(string))
              text_filter       = optional(string)
            }))
            slo_query = optional(object({
              additional_query_filters = optional(string)
              cross_org_uuids          = optional(list(string))
              data_source              = string
              group_mode               = optional(string)
              measure                  = string
              name                     = optional(string)
              slo_id                   = string
              slo_query_type           = optional(string)
            }))
          })))
          rum_query = optional(object({
            compute_query = optional(object({
              aggregation = string
              facet       = optional(string)
              interval    = optional(number)
            }))
            group_by = optional(list(object({
              facet = optional(string)
              limit = optional(number)
              sort_query = optional(object({
                aggregation = string
                facet       = optional(string)
                order       = string
              }))
            })))
            index = string
            multi_compute = optional(list(object({
              aggregation = string
              facet       = optional(string)
              interval    = optional(number)
            })))
            search_query = optional(string)
          }))
          security_query = optional(object({
            compute_query = optional(object({
              aggregation = string
              facet       = optional(string)
              interval    = optional(number)
            }))
            group_by = optional(list(object({
              facet = optional(string)
              limit = optional(number)
              sort_query = optional(object({
                aggregation = string
                facet       = optional(string)
                order       = string
              }))
            })))
            index = string
            multi_compute = optional(list(object({
              aggregation = string
              facet       = optional(string)
              interval    = optional(number)
            })))
            search_query = optional(string)
          }))
        })))
        text_align = optional(string)
        timeseries_background = optional(object({
          type = string
          yaxis = optional(object({
            include_zero = optional(bool)
            label        = optional(string)
            max          = optional(string)
            min          = optional(string)
            scale        = optional(string)
          }))
        }))
        title       = optional(string)
        title_align = optional(string)
        title_size  = optional(string)
      }))
      run_workflow_definition = optional(object({
        custom_link = optional(list(object({
          is_hidden      = optional(bool)
          label          = optional(string)
          link           = optional(string)
          override_label = optional(string)
        })))
        description               = optional(string)
        hide_incomplete_cost_data = optional(bool)
        input = optional(list(object({
          name  = string
          value = string
        })))
        live_span   = optional(string)
        title       = optional(string)
        title_align = optional(string)
        title_size  = optional(string)
        workflow_id = string
      }))
      scatterplot_definition = optional(object({
        color_by_groups = optional(list(string))
        custom_link = optional(list(object({
          is_hidden      = optional(bool)
          label          = optional(string)
          link           = optional(string)
          override_label = optional(string)
        })))
        description               = optional(string)
        hide_incomplete_cost_data = optional(bool)
        live_span                 = optional(string)
        request = optional(object({
          scatterplot_table = optional(list(object({
            formula = optional(list(object({
              alias              = optional(string)
              dimension          = string
              formula_expression = string
            })))
            query = optional(list(object({
              apm_dependency_stats_query = optional(object({
                cross_org_uuids   = optional(list(string))
                data_source       = string
                env               = string
                is_upstream       = optional(bool)
                name              = string
                operation_name    = string
                primary_tag_name  = optional(string)
                primary_tag_value = optional(string)
                resource_name     = string
                service           = string
                stat              = string
              }))
              apm_resource_stats_query = optional(object({
                cross_org_uuids   = optional(list(string))
                data_source       = string
                env               = string
                group_by          = optional(list(string))
                name              = string
                operation_name    = optional(string)
                primary_tag_name  = optional(string)
                primary_tag_value = optional(string)
                resource_name     = optional(string)
                service           = string
                stat              = string
              }))
              cloud_cost_query = optional(object({
                aggregator      = optional(string)
                cross_org_uuids = optional(list(string))
                data_source     = string
                name            = string
                query           = string
              }))
              event_query = optional(object({
                compute = list(object({
                  aggregation = string
                  interval    = optional(number)
                  metric      = optional(string)
                }))
                cross_org_uuids = optional(list(string))
                data_source     = string
                group_by = optional(list(object({
                  facet = string
                  limit = optional(number)
                  sort = optional(object({
                    aggregation = string
                    metric      = optional(string)
                    order       = optional(string)
                  }))
                })))
                group_by_fields = optional(object({
                  fields = list(string)
                  limit  = optional(number)
                  sort = optional(object({
                    aggregation = string
                    metric      = optional(string)
                    order       = optional(string)
                  }))
                }))
                indexes = optional(list(string))
                name    = string
                search = optional(object({
                  query = string
                }))
                storage = optional(string)
              }))
              metric_query = optional(object({
                aggregator      = optional(string)
                cross_org_uuids = optional(list(string))
                data_source     = optional(string)
                name            = string
                query           = string
                semantic_mode   = optional(string)
              }))
              process_query = optional(object({
                aggregator        = optional(string)
                cross_org_uuids   = optional(list(string))
                data_source       = string
                is_normalized_cpu = optional(bool)
                limit             = optional(number)
                metric            = string
                name              = string
                sort              = optional(string)
                tag_filters       = optional(list(string))
                text_filter       = optional(string)
              }))
              slo_query = optional(object({
                additional_query_filters = optional(string)
                cross_org_uuids          = optional(list(string))
                data_source              = string
                group_mode               = optional(string)
                measure                  = string
                name                     = optional(string)
                slo_id                   = string
                slo_query_type           = optional(string)
              }))
            })))
          })))
          x = optional(list(object({
            aggregator = optional(string)
            apm_query = optional(object({
              compute_query = optional(object({
                aggregation = string
                facet       = optional(string)
                interval    = optional(number)
              }))
              group_by = optional(list(object({
                facet = optional(string)
                limit = optional(number)
                sort_query = optional(object({
                  aggregation = string
                  facet       = optional(string)
                  order       = string
                }))
              })))
              index = string
              multi_compute = optional(list(object({
                aggregation = string
                facet       = optional(string)
                interval    = optional(number)
              })))
              search_query = optional(string)
            }))
            log_query = optional(object({
              compute_query = optional(object({
                aggregation = string
                facet       = optional(string)
                interval    = optional(number)
              }))
              group_by = optional(list(object({
                facet = optional(string)
                limit = optional(number)
                sort_query = optional(object({
                  aggregation = string
                  facet       = optional(string)
                  order       = string
                }))
              })))
              index = string
              multi_compute = optional(list(object({
                aggregation = string
                facet       = optional(string)
                interval    = optional(number)
              })))
              search_query = optional(string)
            }))
            process_query = optional(object({
              filter_by = optional(list(string))
              limit     = optional(number)
              metric    = string
              search_by = optional(string)
            }))
            q = optional(string)
            rum_query = optional(object({
              compute_query = optional(object({
                aggregation = string
                facet       = optional(string)
                interval    = optional(number)
              }))
              group_by = optional(list(object({
                facet = optional(string)
                limit = optional(number)
                sort_query = optional(object({
                  aggregation = string
                  facet       = optional(string)
                  order       = string
                }))
              })))
              index = string
              multi_compute = optional(list(object({
                aggregation = string
                facet       = optional(string)
                interval    = optional(number)
              })))
              search_query = optional(string)
            }))
            security_query = optional(object({
              compute_query = optional(object({
                aggregation = string
                facet       = optional(string)
                interval    = optional(number)
              }))
              group_by = optional(list(object({
                facet = optional(string)
                limit = optional(number)
                sort_query = optional(object({
                  aggregation = string
                  facet       = optional(string)
                  order       = string
                }))
              })))
              index = string
              multi_compute = optional(list(object({
                aggregation = string
                facet       = optional(string)
                interval    = optional(number)
              })))
              search_query = optional(string)
            }))
          })))
          y = optional(list(object({
            aggregator = optional(string)
            apm_query = optional(object({
              compute_query = optional(object({
                aggregation = string
                facet       = optional(string)
                interval    = optional(number)
              }))
              group_by = optional(list(object({
                facet = optional(string)
                limit = optional(number)
                sort_query = optional(object({
                  aggregation = string
                  facet       = optional(string)
                  order       = string
                }))
              })))
              index = string
              multi_compute = optional(list(object({
                aggregation = string
                facet       = optional(string)
                interval    = optional(number)
              })))
              search_query = optional(string)
            }))
            log_query = optional(object({
              compute_query = optional(object({
                aggregation = string
                facet       = optional(string)
                interval    = optional(number)
              }))
              group_by = optional(list(object({
                facet = optional(string)
                limit = optional(number)
                sort_query = optional(object({
                  aggregation = string
                  facet       = optional(string)
                  order       = string
                }))
              })))
              index = string
              multi_compute = optional(list(object({
                aggregation = string
                facet       = optional(string)
                interval    = optional(number)
              })))
              search_query = optional(string)
            }))
            process_query = optional(object({
              filter_by = optional(list(string))
              limit     = optional(number)
              metric    = string
              search_by = optional(string)
            }))
            q = optional(string)
            rum_query = optional(object({
              compute_query = optional(object({
                aggregation = string
                facet       = optional(string)
                interval    = optional(number)
              }))
              group_by = optional(list(object({
                facet = optional(string)
                limit = optional(number)
                sort_query = optional(object({
                  aggregation = string
                  facet       = optional(string)
                  order       = string
                }))
              })))
              index = string
              multi_compute = optional(list(object({
                aggregation = string
                facet       = optional(string)
                interval    = optional(number)
              })))
              search_query = optional(string)
            }))
            security_query = optional(object({
              compute_query = optional(object({
                aggregation = string
                facet       = optional(string)
                interval    = optional(number)
              }))
              group_by = optional(list(object({
                facet = optional(string)
                limit = optional(number)
                sort_query = optional(object({
                  aggregation = string
                  facet       = optional(string)
                  order       = string
                }))
              })))
              index = string
              multi_compute = optional(list(object({
                aggregation = string
                facet       = optional(string)
                interval    = optional(number)
              })))
              search_query = optional(string)
            }))
          })))
        }))
        title       = optional(string)
        title_align = optional(string)
        title_size  = optional(string)
        xaxis = optional(object({
          include_zero = optional(bool)
          label        = optional(string)
          max          = optional(string)
          min          = optional(string)
          scale        = optional(string)
        }))
        yaxis = optional(object({
          include_zero = optional(bool)
          label        = optional(string)
          max          = optional(string)
          min          = optional(string)
          scale        = optional(string)
        }))
      }))
      service_level_objective_definition = optional(object({
        additional_query_filters = optional(string)
        description              = optional(string)
        global_time_target       = optional(string)
        show_error_budget        = optional(bool)
        slo_id                   = string
        time_windows             = list(string)
        title                    = optional(string)
        title_align              = optional(string)
        title_size               = optional(string)
        view_mode                = string
        view_type                = string
      }))
      servicemap_definition = optional(object({
        custom_link = optional(list(object({
          is_hidden      = optional(bool)
          label          = optional(string)
          link           = optional(string)
          override_label = optional(string)
        })))
        description = optional(string)
        filters     = list(string)
        service     = string
        title       = optional(string)
        title_align = optional(string)
        title_size  = optional(string)
      }))
      slo_list_definition = optional(object({
        request = object({
          description = optional(string)
          query = object({
            limit        = optional(number)
            query_string = string
            sort = optional(object({
              column      = string
              description = optional(string)
              order       = string
            }))
          })
          request_type = string
        })
        title       = optional(string)
        title_align = optional(string)
        title_size  = optional(string)
      }))
      sunburst_definition = optional(object({
        custom_link = optional(list(object({
          is_hidden      = optional(bool)
          label          = optional(string)
          link           = optional(string)
          override_label = optional(string)
        })))
        description               = optional(string)
        hide_incomplete_cost_data = optional(bool)
        hide_total                = optional(bool)
        legend_inline = optional(object({
          hide_percent = optional(bool)
          hide_value   = optional(bool)
          type         = string
        }))
        legend_table = optional(object({
          type = string
        }))
        live_span = optional(string)
        request = optional(list(object({
          apm_query = optional(object({
            compute_query = optional(object({
              aggregation = string
              facet       = optional(string)
              interval    = optional(number)
            }))
            group_by = optional(list(object({
              facet = optional(string)
              limit = optional(number)
              sort_query = optional(object({
                aggregation = string
                facet       = optional(string)
                order       = string
              }))
            })))
            index = string
            multi_compute = optional(list(object({
              aggregation = string
              facet       = optional(string)
              interval    = optional(number)
            })))
            search_query = optional(string)
          }))
          audit_query = optional(object({
            compute_query = optional(object({
              aggregation = string
              facet       = optional(string)
              interval    = optional(number)
            }))
            group_by = optional(list(object({
              facet = optional(string)
              limit = optional(number)
              sort_query = optional(object({
                aggregation = string
                facet       = optional(string)
                order       = string
              }))
            })))
            index = string
            multi_compute = optional(list(object({
              aggregation = string
              facet       = optional(string)
              interval    = optional(number)
            })))
            search_query = optional(string)
          }))
          formula = optional(list(object({
            alias             = optional(string)
            cell_display_mode = optional(string)
            conditional_formats = optional(list(object({
              comparator      = string
              custom_bg_color = optional(string)
              custom_fg_color = optional(string)
              hide_value      = optional(bool)
              image_url       = optional(string)
              metric          = optional(string)
              palette         = string
              timeframe       = optional(string)
              value           = number
            })))
            formula_expression = string
            limit = optional(object({
              count = optional(number)
              order = optional(string)
            }))
            number_format = optional(object({
              unit = object({
                canonical = optional(object({
                  per_unit_name = optional(string)
                  unit_name     = string
                }))
                custom = optional(object({
                  label = string
                }))
              })
              unit_scale = optional(object({
                unit_name = string
              }))
            }))
            style = optional(object({
              palette       = optional(string)
              palette_index = optional(number)
            }))
          })))
          log_query = optional(object({
            compute_query = optional(object({
              aggregation = string
              facet       = optional(string)
              interval    = optional(number)
            }))
            group_by = optional(list(object({
              facet = optional(string)
              limit = optional(number)
              sort_query = optional(object({
                aggregation = string
                facet       = optional(string)
                order       = string
              }))
            })))
            index = string
            multi_compute = optional(list(object({
              aggregation = string
              facet       = optional(string)
              interval    = optional(number)
            })))
            search_query = optional(string)
          }))
          network_query = optional(object({
            compute_query = optional(object({
              aggregation = string
              facet       = optional(string)
              interval    = optional(number)
            }))
            group_by = optional(list(object({
              facet = optional(string)
              limit = optional(number)
              sort_query = optional(object({
                aggregation = string
                facet       = optional(string)
                order       = string
              }))
            })))
            index = string
            multi_compute = optional(list(object({
              aggregation = string
              facet       = optional(string)
              interval    = optional(number)
            })))
            search_query = optional(string)
          }))
          process_query = optional(object({
            filter_by = optional(list(string))
            limit     = optional(number)
            metric    = string
            search_by = optional(string)
          }))
          q = optional(string)
          query = optional(list(object({
            apm_dependency_stats_query = optional(object({
              cross_org_uuids   = optional(list(string))
              data_source       = string
              env               = string
              is_upstream       = optional(bool)
              name              = string
              operation_name    = string
              primary_tag_name  = optional(string)
              primary_tag_value = optional(string)
              resource_name     = string
              service           = string
              stat              = string
            }))
            apm_resource_stats_query = optional(object({
              cross_org_uuids   = optional(list(string))
              data_source       = string
              env               = string
              group_by          = optional(list(string))
              name              = string
              operation_name    = optional(string)
              primary_tag_name  = optional(string)
              primary_tag_value = optional(string)
              resource_name     = optional(string)
              service           = string
              stat              = string
            }))
            cloud_cost_query = optional(object({
              aggregator      = optional(string)
              cross_org_uuids = optional(list(string))
              data_source     = string
              name            = string
              query           = string
            }))
            event_query = optional(object({
              compute = list(object({
                aggregation = string
                interval    = optional(number)
                metric      = optional(string)
              }))
              cross_org_uuids = optional(list(string))
              data_source     = string
              group_by = optional(list(object({
                facet = string
                limit = optional(number)
                sort = optional(object({
                  aggregation = string
                  metric      = optional(string)
                  order       = optional(string)
                }))
              })))
              group_by_fields = optional(object({
                fields = list(string)
                limit  = optional(number)
                sort = optional(object({
                  aggregation = string
                  metric      = optional(string)
                  order       = optional(string)
                }))
              }))
              indexes = optional(list(string))
              name    = string
              search = optional(object({
                query = string
              }))
              storage = optional(string)
            }))
            metric_query = optional(object({
              aggregator      = optional(string)
              cross_org_uuids = optional(list(string))
              data_source     = optional(string)
              name            = string
              query           = string
              semantic_mode   = optional(string)
            }))
            process_query = optional(object({
              aggregator        = optional(string)
              cross_org_uuids   = optional(list(string))
              data_source       = string
              is_normalized_cpu = optional(bool)
              limit             = optional(number)
              metric            = string
              name              = string
              sort              = optional(string)
              tag_filters       = optional(list(string))
              text_filter       = optional(string)
            }))
            slo_query = optional(object({
              additional_query_filters = optional(string)
              cross_org_uuids          = optional(list(string))
              data_source              = string
              group_mode               = optional(string)
              measure                  = string
              name                     = optional(string)
              slo_id                   = string
              slo_query_type           = optional(string)
            }))
          })))
          rum_query = optional(object({
            compute_query = optional(object({
              aggregation = string
              facet       = optional(string)
              interval    = optional(number)
            }))
            group_by = optional(list(object({
              facet = optional(string)
              limit = optional(number)
              sort_query = optional(object({
                aggregation = string
                facet       = optional(string)
                order       = string
              }))
            })))
            index = string
            multi_compute = optional(list(object({
              aggregation = string
              facet       = optional(string)
              interval    = optional(number)
            })))
            search_query = optional(string)
          }))
          security_query = optional(object({
            compute_query = optional(object({
              aggregation = string
              facet       = optional(string)
              interval    = optional(number)
            }))
            group_by = optional(list(object({
              facet = optional(string)
              limit = optional(number)
              sort_query = optional(object({
                aggregation = string
                facet       = optional(string)
                order       = string
              }))
            })))
            index = string
            multi_compute = optional(list(object({
              aggregation = string
              facet       = optional(string)
              interval    = optional(number)
            })))
            search_query = optional(string)
          }))
          style = optional(object({
            palette = optional(string)
          }))
        })))
        title       = optional(string)
        title_align = optional(string)
        title_size  = optional(string)
      }))
      timeseries_definition = optional(object({
        custom_link = optional(list(object({
          is_hidden      = optional(bool)
          label          = optional(string)
          link           = optional(string)
          override_label = optional(string)
        })))
        description = optional(string)
        event = optional(list(object({
          q              = string
          tags_execution = optional(string)
        })))
        hide_incomplete_cost_data = optional(bool)
        legend_columns            = optional(set(string))
        legend_layout             = optional(string)
        legend_size               = optional(string)
        live_span                 = optional(string)
        marker = optional(list(object({
          display_type = optional(string)
          label        = optional(string)
          value        = string
        })))
        request = optional(list(object({
          apm_query = optional(object({
            compute_query = optional(object({
              aggregation = string
              facet       = optional(string)
              interval    = optional(number)
            }))
            group_by = optional(list(object({
              facet = optional(string)
              limit = optional(number)
              sort_query = optional(object({
                aggregation = string
                facet       = optional(string)
                order       = string
              }))
            })))
            index = string
            multi_compute = optional(list(object({
              aggregation = string
              facet       = optional(string)
              interval    = optional(number)
            })))
            search_query = optional(string)
          }))
          audit_query = optional(object({
            compute_query = optional(object({
              aggregation = string
              facet       = optional(string)
              interval    = optional(number)
            }))
            group_by = optional(list(object({
              facet = optional(string)
              limit = optional(number)
              sort_query = optional(object({
                aggregation = string
                facet       = optional(string)
                order       = string
              }))
            })))
            index = string
            multi_compute = optional(list(object({
              aggregation = string
              facet       = optional(string)
              interval    = optional(number)
            })))
            search_query = optional(string)
          }))
          display_type = optional(string)
          formula = optional(list(object({
            alias             = optional(string)
            cell_display_mode = optional(string)
            conditional_formats = optional(list(object({
              comparator      = string
              custom_bg_color = optional(string)
              custom_fg_color = optional(string)
              hide_value      = optional(bool)
              image_url       = optional(string)
              metric          = optional(string)
              palette         = string
              timeframe       = optional(string)
              value           = number
            })))
            formula_expression = string
            limit = optional(object({
              count = optional(number)
              order = optional(string)
            }))
            number_format = optional(object({
              unit = object({
                canonical = optional(object({
                  per_unit_name = optional(string)
                  unit_name     = string
                }))
                custom = optional(object({
                  label = string
                }))
              })
              unit_scale = optional(object({
                unit_name = string
              }))
            }))
            style = optional(object({
              palette       = optional(string)
              palette_index = optional(number)
            }))
          })))
          log_query = optional(object({
            compute_query = optional(object({
              aggregation = string
              facet       = optional(string)
              interval    = optional(number)
            }))
            group_by = optional(list(object({
              facet = optional(string)
              limit = optional(number)
              sort_query = optional(object({
                aggregation = string
                facet       = optional(string)
                order       = string
              }))
            })))
            index = string
            multi_compute = optional(list(object({
              aggregation = string
              facet       = optional(string)
              interval    = optional(number)
            })))
            search_query = optional(string)
          }))
          metadata = optional(list(object({
            alias_name = optional(string)
            expression = string
          })))
          network_query = optional(object({
            compute_query = optional(object({
              aggregation = string
              facet       = optional(string)
              interval    = optional(number)
            }))
            group_by = optional(list(object({
              facet = optional(string)
              limit = optional(number)
              sort_query = optional(object({
                aggregation = string
                facet       = optional(string)
                order       = string
              }))
            })))
            index = string
            multi_compute = optional(list(object({
              aggregation = string
              facet       = optional(string)
              interval    = optional(number)
            })))
            search_query = optional(string)
          }))
          on_right_yaxis = optional(bool)
          process_query = optional(object({
            filter_by = optional(list(string))
            limit     = optional(number)
            metric    = string
            search_by = optional(string)
          }))
          q = optional(string)
          query = optional(list(object({
            apm_dependency_stats_query = optional(object({
              cross_org_uuids   = optional(list(string))
              data_source       = string
              env               = string
              is_upstream       = optional(bool)
              name              = string
              operation_name    = string
              primary_tag_name  = optional(string)
              primary_tag_value = optional(string)
              resource_name     = string
              service           = string
              stat              = string
            }))
            apm_resource_stats_query = optional(object({
              cross_org_uuids   = optional(list(string))
              data_source       = string
              env               = string
              group_by          = optional(list(string))
              name              = string
              operation_name    = optional(string)
              primary_tag_name  = optional(string)
              primary_tag_value = optional(string)
              resource_name     = optional(string)
              service           = string
              stat              = string
            }))
            cloud_cost_query = optional(object({
              aggregator      = optional(string)
              cross_org_uuids = optional(list(string))
              data_source     = string
              name            = string
              query           = string
            }))
            event_query = optional(object({
              compute = list(object({
                aggregation = string
                interval    = optional(number)
                metric      = optional(string)
              }))
              cross_org_uuids = optional(list(string))
              data_source     = string
              group_by = optional(list(object({
                facet = string
                limit = optional(number)
                sort = optional(object({
                  aggregation = string
                  metric      = optional(string)
                  order       = optional(string)
                }))
              })))
              group_by_fields = optional(object({
                fields = list(string)
                limit  = optional(number)
                sort = optional(object({
                  aggregation = string
                  metric      = optional(string)
                  order       = optional(string)
                }))
              }))
              indexes = optional(list(string))
              name    = string
              search = optional(object({
                query = string
              }))
              storage = optional(string)
            }))
            metric_query = optional(object({
              aggregator      = optional(string)
              cross_org_uuids = optional(list(string))
              data_source     = optional(string)
              name            = string
              query           = string
              semantic_mode   = optional(string)
            }))
            process_query = optional(object({
              aggregator        = optional(string)
              cross_org_uuids   = optional(list(string))
              data_source       = string
              is_normalized_cpu = optional(bool)
              limit             = optional(number)
              metric            = string
              name              = string
              sort              = optional(string)
              tag_filters       = optional(list(string))
              text_filter       = optional(string)
            }))
            slo_query = optional(object({
              additional_query_filters = optional(string)
              cross_org_uuids          = optional(list(string))
              data_source              = string
              group_mode               = optional(string)
              measure                  = string
              name                     = optional(string)
              slo_id                   = string
              slo_query_type           = optional(string)
            }))
          })))
          rum_query = optional(object({
            compute_query = optional(object({
              aggregation = string
              facet       = optional(string)
              interval    = optional(number)
            }))
            group_by = optional(list(object({
              facet = optional(string)
              limit = optional(number)
              sort_query = optional(object({
                aggregation = string
                facet       = optional(string)
                order       = string
              }))
            })))
            index = string
            multi_compute = optional(list(object({
              aggregation = string
              facet       = optional(string)
              interval    = optional(number)
            })))
            search_query = optional(string)
          }))
          security_query = optional(object({
            compute_query = optional(object({
              aggregation = string
              facet       = optional(string)
              interval    = optional(number)
            }))
            group_by = optional(list(object({
              facet = optional(string)
              limit = optional(number)
              sort_query = optional(object({
                aggregation = string
                facet       = optional(string)
                order       = string
              }))
            })))
            index = string
            multi_compute = optional(list(object({
              aggregation = string
              facet       = optional(string)
              interval    = optional(number)
            })))
            search_query = optional(string)
          }))
          style = optional(object({
            has_value_labels = optional(bool)
            line_type        = optional(string)
            line_width       = optional(string)
            order_by         = optional(string)
            palette          = optional(string)
          }))
        })))
        right_yaxis = optional(object({
          include_zero = optional(bool)
          label        = optional(string)
          max          = optional(string)
          min          = optional(string)
          scale        = optional(string)
        }))
        show_legend = optional(bool)
        title       = optional(string)
        title_align = optional(string)
        title_size  = optional(string)
        yaxis = optional(object({
          include_zero = optional(bool)
          label        = optional(string)
          max          = optional(string)
          min          = optional(string)
          scale        = optional(string)
        }))
      }))
      toplist_definition = optional(object({
        custom_link = optional(list(object({
          is_hidden      = optional(bool)
          label          = optional(string)
          link           = optional(string)
          override_label = optional(string)
        })))
        description               = optional(string)
        hide_incomplete_cost_data = optional(bool)
        live_span                 = optional(string)
        request = optional(list(object({
          apm_query = optional(object({
            compute_query = optional(object({
              aggregation = string
              facet       = optional(string)
              interval    = optional(number)
            }))
            group_by = optional(list(object({
              facet = optional(string)
              limit = optional(number)
              sort_query = optional(object({
                aggregation = string
                facet       = optional(string)
                order       = string
              }))
            })))
            index = string
            multi_compute = optional(list(object({
              aggregation = string
              facet       = optional(string)
              interval    = optional(number)
            })))
            search_query = optional(string)
          }))
          audit_query = optional(object({
            compute_query = optional(object({
              aggregation = string
              facet       = optional(string)
              interval    = optional(number)
            }))
            group_by = optional(list(object({
              facet = optional(string)
              limit = optional(number)
              sort_query = optional(object({
                aggregation = string
                facet       = optional(string)
                order       = string
              }))
            })))
            index = string
            multi_compute = optional(list(object({
              aggregation = string
              facet       = optional(string)
              interval    = optional(number)
            })))
            search_query = optional(string)
          }))
          conditional_formats = optional(list(object({
            comparator      = string
            custom_bg_color = optional(string)
            custom_fg_color = optional(string)
            hide_value      = optional(bool)
            image_url       = optional(string)
            metric          = optional(string)
            palette         = string
            timeframe       = optional(string)
            value           = number
          })))
          formula = optional(list(object({
            alias             = optional(string)
            cell_display_mode = optional(string)
            conditional_formats = optional(list(object({
              comparator      = string
              custom_bg_color = optional(string)
              custom_fg_color = optional(string)
              hide_value      = optional(bool)
              image_url       = optional(string)
              metric          = optional(string)
              palette         = string
              timeframe       = optional(string)
              value           = number
            })))
            formula_expression = string
            limit = optional(object({
              count = optional(number)
              order = optional(string)
            }))
            number_format = optional(object({
              unit = object({
                canonical = optional(object({
                  per_unit_name = optional(string)
                  unit_name     = string
                }))
                custom = optional(object({
                  label = string
                }))
              })
              unit_scale = optional(object({
                unit_name = string
              }))
            }))
            style = optional(object({
              palette       = optional(string)
              palette_index = optional(number)
            }))
          })))
          log_query = optional(object({
            compute_query = optional(object({
              aggregation = string
              facet       = optional(string)
              interval    = optional(number)
            }))
            group_by = optional(list(object({
              facet = optional(string)
              limit = optional(number)
              sort_query = optional(object({
                aggregation = string
                facet       = optional(string)
                order       = string
              }))
            })))
            index = string
            multi_compute = optional(list(object({
              aggregation = string
              facet       = optional(string)
              interval    = optional(number)
            })))
            search_query = optional(string)
          }))
          process_query = optional(object({
            filter_by = optional(list(string))
            limit     = optional(number)
            metric    = string
            search_by = optional(string)
          }))
          q = optional(string)
          query = optional(list(object({
            apm_dependency_stats_query = optional(object({
              cross_org_uuids   = optional(list(string))
              data_source       = string
              env               = string
              is_upstream       = optional(bool)
              name              = string
              operation_name    = string
              primary_tag_name  = optional(string)
              primary_tag_value = optional(string)
              resource_name     = string
              service           = string
              stat              = string
            }))
            apm_resource_stats_query = optional(object({
              cross_org_uuids   = optional(list(string))
              data_source       = string
              env               = string
              group_by          = optional(list(string))
              name              = string
              operation_name    = optional(string)
              primary_tag_name  = optional(string)
              primary_tag_value = optional(string)
              resource_name     = optional(string)
              service           = string
              stat              = string
            }))
            cloud_cost_query = optional(object({
              aggregator      = optional(string)
              cross_org_uuids = optional(list(string))
              data_source     = string
              name            = string
              query           = string
            }))
            event_query = optional(object({
              compute = list(object({
                aggregation = string
                interval    = optional(number)
                metric      = optional(string)
              }))
              cross_org_uuids = optional(list(string))
              data_source     = string
              group_by = optional(list(object({
                facet = string
                limit = optional(number)
                sort = optional(object({
                  aggregation = string
                  metric      = optional(string)
                  order       = optional(string)
                }))
              })))
              group_by_fields = optional(object({
                fields = list(string)
                limit  = optional(number)
                sort = optional(object({
                  aggregation = string
                  metric      = optional(string)
                  order       = optional(string)
                }))
              }))
              indexes = optional(list(string))
              name    = string
              search = optional(object({
                query = string
              }))
              storage = optional(string)
            }))
            metric_query = optional(object({
              aggregator      = optional(string)
              cross_org_uuids = optional(list(string))
              data_source     = optional(string)
              name            = string
              query           = string
              semantic_mode   = optional(string)
            }))
            process_query = optional(object({
              aggregator        = optional(string)
              cross_org_uuids   = optional(list(string))
              data_source       = string
              is_normalized_cpu = optional(bool)
              limit             = optional(number)
              metric            = string
              name              = string
              sort              = optional(string)
              tag_filters       = optional(list(string))
              text_filter       = optional(string)
            }))
            slo_query = optional(object({
              additional_query_filters = optional(string)
              cross_org_uuids          = optional(list(string))
              data_source              = string
              group_mode               = optional(string)
              measure                  = string
              name                     = optional(string)
              slo_id                   = string
              slo_query_type           = optional(string)
            }))
          })))
          rum_query = optional(object({
            compute_query = optional(object({
              aggregation = string
              facet       = optional(string)
              interval    = optional(number)
            }))
            group_by = optional(list(object({
              facet = optional(string)
              limit = optional(number)
              sort_query = optional(object({
                aggregation = string
                facet       = optional(string)
                order       = string
              }))
            })))
            index = string
            multi_compute = optional(list(object({
              aggregation = string
              facet       = optional(string)
              interval    = optional(number)
            })))
            search_query = optional(string)
          }))
          security_query = optional(object({
            compute_query = optional(object({
              aggregation = string
              facet       = optional(string)
              interval    = optional(number)
            }))
            group_by = optional(list(object({
              facet = optional(string)
              limit = optional(number)
              sort_query = optional(object({
                aggregation = string
                facet       = optional(string)
                order       = string
              }))
            })))
            index = string
            multi_compute = optional(list(object({
              aggregation = string
              facet       = optional(string)
              interval    = optional(number)
            })))
            search_query = optional(string)
          }))
          style = optional(object({
            palette = optional(string)
          }))
        })))
        style = optional(list(object({
          display = optional(list(object({
            type = string
          })))
          palette = optional(string)
          scaling = optional(string)
        })))
        title       = optional(string)
        title_align = optional(string)
        title_size  = optional(string)
      }))
      topology_map_definition = optional(object({
        custom_link = optional(list(object({
          is_hidden      = optional(bool)
          label          = optional(string)
          link           = optional(string)
          override_label = optional(string)
        })))
        description = optional(string)
        request = optional(list(object({
          query = list(object({
            data_source = string
            filters     = list(string)
            service     = string
          }))
          request_type = string
        })))
        title       = optional(string)
        title_align = optional(string)
        title_size  = optional(string)
      }))
      trace_service_definition = optional(object({
        display_format            = optional(string)
        env                       = string
        hide_incomplete_cost_data = optional(bool)
        live_span                 = optional(string)
        service                   = string
        show_breakdown            = optional(bool)
        show_distribution         = optional(bool)
        show_errors               = optional(bool)
        show_hits                 = optional(bool)
        show_latency              = optional(bool)
        show_resource_list        = optional(bool)
        size_format               = optional(string)
        span_name                 = string
        title                     = optional(string)
        title_align               = optional(string)
        title_size                = optional(string)
      }))
      treemap_definition = optional(object({
        custom_links = optional(list(object({
          is_hidden      = optional(bool)
          label          = optional(string)
          link           = optional(string)
          override_label = optional(string)
        })))
        description = optional(string)
        request = optional(list(object({
          formula = optional(list(object({
            alias             = optional(string)
            cell_display_mode = optional(string)
            conditional_formats = optional(list(object({
              comparator      = string
              custom_bg_color = optional(string)
              custom_fg_color = optional(string)
              hide_value      = optional(bool)
              image_url       = optional(string)
              metric          = optional(string)
              palette         = string
              timeframe       = optional(string)
              value           = number
            })))
            formula_expression = string
            limit = optional(object({
              count = optional(number)
              order = optional(string)
            }))
            number_format = optional(object({
              unit = object({
                canonical = optional(object({
                  per_unit_name = optional(string)
                  unit_name     = string
                }))
                custom = optional(object({
                  label = string
                }))
              })
              unit_scale = optional(object({
                unit_name = string
              }))
            }))
            style = optional(object({
              palette       = optional(string)
              palette_index = optional(number)
            }))
          })))
          query = optional(list(object({
            apm_dependency_stats_query = optional(object({
              cross_org_uuids   = optional(list(string))
              data_source       = string
              env               = string
              is_upstream       = optional(bool)
              name              = string
              operation_name    = string
              primary_tag_name  = optional(string)
              primary_tag_value = optional(string)
              resource_name     = string
              service           = string
              stat              = string
            }))
            apm_resource_stats_query = optional(object({
              cross_org_uuids   = optional(list(string))
              data_source       = string
              env               = string
              group_by          = optional(list(string))
              name              = string
              operation_name    = optional(string)
              primary_tag_name  = optional(string)
              primary_tag_value = optional(string)
              resource_name     = optional(string)
              service           = string
              stat              = string
            }))
            cloud_cost_query = optional(object({
              aggregator      = optional(string)
              cross_org_uuids = optional(list(string))
              data_source     = string
              name            = string
              query           = string
            }))
            event_query = optional(object({
              compute = list(object({
                aggregation = string
                interval    = optional(number)
                metric      = optional(string)
              }))
              cross_org_uuids = optional(list(string))
              data_source     = string
              group_by = optional(list(object({
                facet = string
                limit = optional(number)
                sort = optional(object({
                  aggregation = string
                  metric      = optional(string)
                  order       = optional(string)
                }))
              })))
              group_by_fields = optional(object({
                fields = list(string)
                limit  = optional(number)
                sort = optional(object({
                  aggregation = string
                  metric      = optional(string)
                  order       = optional(string)
                }))
              }))
              indexes = optional(list(string))
              name    = string
              search = optional(object({
                query = string
              }))
              storage = optional(string)
            }))
            metric_query = optional(object({
              aggregator      = optional(string)
              cross_org_uuids = optional(list(string))
              data_source     = optional(string)
              name            = string
              query           = string
              semantic_mode   = optional(string)
            }))
            process_query = optional(object({
              aggregator        = optional(string)
              cross_org_uuids   = optional(list(string))
              data_source       = string
              is_normalized_cpu = optional(bool)
              limit             = optional(number)
              metric            = string
              name              = string
              sort              = optional(string)
              tag_filters       = optional(list(string))
              text_filter       = optional(string)
            }))
            slo_query = optional(object({
              additional_query_filters = optional(string)
              cross_org_uuids          = optional(list(string))
              data_source              = string
              group_mode               = optional(string)
              measure                  = string
              name                     = optional(string)
              slo_id                   = string
              slo_query_type           = optional(string)
            }))
          })))
        })))
        title = optional(string)
      }))
      widget_layout = optional(object({
        height          = number
        is_column_break = optional(bool)
        width           = number
        x               = number
        y               = number
      }))
    })))
  }))
  validation {
    condition = alltrue([
      for k, v in var.powerpacks : (
        v.widget == null || alltrue([for item in v.widget : (item.change_definition == null || (item.change_definition.request == null || alltrue([for item in item.change_definition.request : (item.query == null || alltrue([for item in item.query : (item.event_query == null || (length(item.event_query.compute) >= 1))]))])))])
      )
    ])
    error_message = "Each compute list must contain at least 1 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.powerpacks : (
        v.widget == null || alltrue([for item in v.widget : (item.geomap_definition == null || (item.geomap_definition.request == null || alltrue([for item in item.geomap_definition.request : (item.query == null || alltrue([for item in item.query : (item.event_query == null || (length(item.event_query.compute) >= 1))]))])))])
      )
    ])
    error_message = "Each compute list must contain at least 1 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.powerpacks : (
        v.widget == null || alltrue([for item in v.widget : (item.heatmap_definition == null || (item.heatmap_definition.request == null || alltrue([for item in item.heatmap_definition.request : (item.query == null || alltrue([for item in item.query : (item.event_query == null || (length(item.event_query.compute) >= 1))]))])))])
      )
    ])
    error_message = "Each compute list must contain at least 1 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.powerpacks : (
        v.widget == null || alltrue([for item in v.widget : (item.list_stream_definition == null || (length(item.list_stream_definition.request) >= 1))])
      )
    ])
    error_message = "Each request list must contain at least 1 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.powerpacks : (
        v.widget == null || alltrue([for item in v.widget : (item.list_stream_definition == null || (alltrue([for item in item.list_stream_definition.request : (length(item.columns) >= 1)])))])
      )
    ])
    error_message = "Each columns list must contain at least 1 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.powerpacks : (
        v.widget == null || alltrue([for item in v.widget : (item.query_table_definition == null || (item.query_table_definition.request == null || alltrue([for item in item.query_table_definition.request : (item.query == null || alltrue([for item in item.query : (item.event_query == null || (length(item.event_query.compute) >= 1))]))])))])
      )
    ])
    error_message = "Each compute list must contain at least 1 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.powerpacks : (
        v.widget == null || alltrue([for item in v.widget : (item.query_value_definition == null || (item.query_value_definition.request == null || alltrue([for item in item.query_value_definition.request : (item.query == null || alltrue([for item in item.query : (item.event_query == null || (length(item.event_query.compute) >= 1))]))])))])
      )
    ])
    error_message = "Each compute list must contain at least 1 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.powerpacks : (
        v.widget == null || alltrue([for item in v.widget : (item.scatterplot_definition == null || (item.scatterplot_definition.request == null || (item.scatterplot_definition.request.scatterplot_table == null || alltrue([for item in item.scatterplot_definition.request.scatterplot_table : (item.query == null || alltrue([for item in item.query : (item.event_query == null || (length(item.event_query.compute) >= 1))]))]))))])
      )
    ])
    error_message = "Each compute list must contain at least 1 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.powerpacks : (
        v.widget == null || alltrue([for item in v.widget : (item.sunburst_definition == null || (item.sunburst_definition.request == null || alltrue([for item in item.sunburst_definition.request : (item.query == null || alltrue([for item in item.query : (item.event_query == null || (length(item.event_query.compute) >= 1))]))])))])
      )
    ])
    error_message = "Each compute list must contain at least 1 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.powerpacks : (
        v.widget == null || alltrue([for item in v.widget : (item.timeseries_definition == null || (item.timeseries_definition.request == null || alltrue([for item in item.timeseries_definition.request : (item.query == null || alltrue([for item in item.query : (item.event_query == null || (length(item.event_query.compute) >= 1))]))])))])
      )
    ])
    error_message = "Each compute list must contain at least 1 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.powerpacks : (
        v.widget == null || alltrue([for item in v.widget : (item.toplist_definition == null || (item.toplist_definition.request == null || alltrue([for item in item.toplist_definition.request : (item.query == null || alltrue([for item in item.query : (item.event_query == null || (length(item.event_query.compute) >= 1))]))])))])
      )
    ])
    error_message = "Each compute list must contain at least 1 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.powerpacks : (
        v.widget == null || alltrue([for item in v.widget : (item.topology_map_definition == null || (item.topology_map_definition.request == null || alltrue([for item in item.topology_map_definition.request : (length(item.query) >= 1)])))])
      )
    ])
    error_message = "Each query list must contain at least 1 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.powerpacks : (
        v.widget == null || alltrue([for item in v.widget : (item.treemap_definition == null || (item.treemap_definition.request == null || alltrue([for item in item.treemap_definition.request : (item.query == null || alltrue([for item in item.query : (item.event_query == null || (length(item.event_query.compute) >= 1))]))])))])
      )
    ])
    error_message = "Each compute list must contain at least 1 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.powerpacks : (
        v.layout == null || (v.layout.x == null || (v.layout.x >= 0))
      )
    ])
    error_message = "must be at least 0"
  }
  validation {
    condition = alltrue([
      for k, v in var.powerpacks : (
        v.layout == null || (v.layout.y == null || (v.layout.y >= 0))
      )
    ])
    error_message = "must be at least 0"
  }
  validation {
    condition = alltrue([
      for k, v in var.powerpacks : (
        v.layout == null || (v.layout.width == null || (v.layout.width >= 1))
      )
    ])
    error_message = "must be at least 1"
  }
  validation {
    condition = alltrue([
      for k, v in var.powerpacks : (
        v.layout == null || (v.layout.height == null || (v.layout.height >= 1))
      )
    ])
    error_message = "must be at least 1"
  }
  # Note: 1 additional provider-side validator is enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

