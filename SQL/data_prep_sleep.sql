-- Confirm sleep hours are within reason (<1 or >16)
-- Flag or filter out impossible sleep hours (e.g., less than 1 hour or more than 16 hours)
SELECT
    *
FROM
    `avian-destiny-473116-a6.soc_med_v_prod.productivity_index`
WHERE
    sleep_hours < 1 OR sleep_hours > 16;





