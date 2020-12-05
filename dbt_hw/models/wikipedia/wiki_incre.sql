{{ config(
    materialized = 'incremental',
    incremental_strategy = "insert_overwrite",
    partition_by ={ "field" :"partition_date",
    "data_type" :"date" }
) }}

WITH raw_count AS (

    SELECT
        DATE(datehour) AS partition_date,
        title,
        COUNT(*) AS n_views
    FROM
        {{ source(
            'bqpublic',
            'pageviews_2020'
        ) }}
    WHERE
        DATE(datehour) = "{{ var('date_input') }}"
    GROUP BY
        1,
        2
),
count_rank AS(
    SELECT
        *,
        ROW_NUMBER() over(
            PARTITION BY partition_date
            ORDER BY
                n_views DESC
        ) AS rn
    FROM
        raw_count
)
SELECT
    *
FROM
    count_rank
WHERE
    rn <= 20
