SELECT
    *
FROM
    {{ ref('fruits') }}
    LEFT JOIN (
        SELECT
            *
        FROM
            {{ ref('orders') }}
    ) USING (fruit)
