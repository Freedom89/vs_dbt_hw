SELECT
    DATE(datehour) AS DATE,
    COUNT(*) AS COUNT
FROM
    {{ source(
        'bqpublic',
        'pageviews_2020'
    ) }}
WHERE
    DATE(datehour) = "2020-01-01"
GROUP BY
    1
