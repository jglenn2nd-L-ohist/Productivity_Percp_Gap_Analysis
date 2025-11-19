-- ADD column to reveal productivity gap
ALTER TABLE
    `avian-destiny-473116-a6.soc_med_v_prod.productivity_index`
ADD COLUMN
    productivity_gap NUMERIC;

-- POPULATE column productivity gap & UPDATE table
UPDATE
  `avian-destiny-473116-a6`.`soc_med_v_prod`.`productivity_index`
SET
  productivity_gap = CAST(perceived_productivity_score - actual_productivity_score AS NUMERIC)
WHERE
  perceived_productivity_score IS NOT NULL
  AND actual_productivity_score IS NOT NULL;



