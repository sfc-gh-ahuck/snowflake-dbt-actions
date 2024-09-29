{% macro clone_database(source_db, target_db, recreate=false, grant_all_to_role="") %}
    {% set sql -%}
        CREATE {% if recreate -%}OR REPLACE DATABASE{% else -%}DATABASE IF NOT EXISTS{% endif -%}  {{ target_db }} CLONE {{ source_db }};
        
        {% if grant_all_to_role is defined and grant_all_to_role|length -%}
            GRANT all ON database {{ target_db }}                       to role {{ grant_all_to_role }};
            GRANT all ON all schemas in database {{ target_db }}        to role {{ grant_all_to_role }};
            GRANT all ON all tables in database {{ target_db }}         to role {{ grant_all_to_role }};
            GRANT all ON all views in database {{ target_db }}          to role {{ grant_all_to_role }};

            GRANT all ON future schemas in database {{ target_db }} to role {{ grant_all_to_role }};
            GRANT all ON future tables in database {{ target_db }}  to role {{ grant_all_to_role }};
            GRANT all ON future views in database {{ target_db }}   to role {{ grant_all_to_role }};
        {% endif -%}
    
    {%- endset %}
    
    {% do run_query(sql) %}
{% endmacro %}

{% macro create_database(database_name, recreate=false) %}
    {% set sql -%}
        CREATE 
            {% if recreate -%} 
                OR REPLACE DATABASE 
            {% else -%} 
                DATABASE IF NOT EXISTS 
            {% endif -%} 
        {{ database_name }};
    {%- endset %}
    
    {% do run_query(sql) %}
{% endmacro %}
