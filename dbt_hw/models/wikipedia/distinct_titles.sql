SELECT
    COUNT(DISTINCT(title)) AS count_titles
FROM
    {{ ref('wiki_vars') }}
