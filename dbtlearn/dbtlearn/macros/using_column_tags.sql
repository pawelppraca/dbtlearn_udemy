{% set customer_tags = get_column_tags('customer_id') %}
Tags dla customer_id: {{ customer_tags }}


{% macro column_has_tag(column_name, tag) %}
    {% set tags = get_column_tags(column_name) %}
    {{ return(tag in tags) }}
{% endmacro %}