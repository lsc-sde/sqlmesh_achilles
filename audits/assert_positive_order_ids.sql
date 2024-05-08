Audit (
  name assert_positive_order_ids
);

SELECT
  *
FROM @this_model
WHERE
  person_id < 0