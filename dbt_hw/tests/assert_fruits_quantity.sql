SELECT
    *
FROM
    {{ ref('fruits_join') }}
WHERE
    quantity < 0
