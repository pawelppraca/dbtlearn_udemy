{% macro get_column_tags(column_name) %}
    {% set column = model.columns.get(column_name, {}) %}
    {% if column and 'tags' in column %}
        {{ return(column.tags) }}
    {% else %}
        {{ return([]) }}
    {% endif %}
{% endmacro %}