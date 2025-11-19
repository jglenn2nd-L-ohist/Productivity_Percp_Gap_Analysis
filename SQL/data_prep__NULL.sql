-- Reveal any entries that have NULL values in the relevant categories
SELECT
    COUNT(*) AS total_rows,
    SUM(CASE WHEN screen_time_before_sleep IS NULL THEN 1 ELSE 0 END) AS missing_screen_time,
    SUM(CASE WHEN sleep_hours IS NULL THEN 1 ELSE 0 END) AS missing_sleep_hours,
    SUM(CASE WHEN perceived_productivity_score IS NULL THEN 1 ELSE 0 END) AS missing_perceived_prod,
    SUM(CASE WHEN actual_productivity_score IS NULL THEN 1 ELSE 0 END) AS missing_actual_prod
FROM
    `avian-destiny-473116-a6.soc_med_v_prod.productivity_index`





