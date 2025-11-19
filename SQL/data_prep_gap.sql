SELECT
    perceived_productivity_score,
    actual_productivity_score
FROM
    `avian-destiny-473116-a6.soc_med_v_prod.productivity_index`
WHERE
    perceived_productivity_score NOT BETWEEN 1 AND 10
    OR actual_productivity_score NOT BETWEEN 1 AND 10;

-- Update/Correct the invalid scores (e.g., setting them to NULL)
UPDATE
    `avian-destiny-473116-a6.soc_med_v_prod.productivity_index`
SET
    perceived_productivity_score = NULL
WHERE
    perceived_productivity_score NOT BETWEEN 1 AND 10;




