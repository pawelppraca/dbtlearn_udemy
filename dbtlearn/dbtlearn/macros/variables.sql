{% macro learn_variables() %}
  
    {% set imie = "Pawel" %}
    {{ log("Hello " ~ imie, info=True)}}

    {{log("Hello dbt user: " ~ var("user_name","NO USERNAME IS SET!!!") ~"!'", info=True)}}
  

{% endmacro %}