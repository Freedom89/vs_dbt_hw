WITH raw_count AS (
    SELECT
        DATE(datehour) AS DATE,
        title,
        COUNT(*) AS n_views
    FROM
        {{ source(
            'bqpublic',
            'pageviews_2020'
        ) }}
    WHERE
        DATE(datehour) BETWEEN "{{ var('start_date') }}"
        AND "{{ var('end_date') }}"
    GROUP BY
        1,
        2
),
count_rank AS(
    SELECT
        *,
        ROW_NUMBER() over(
            PARTITION BY DATE
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
