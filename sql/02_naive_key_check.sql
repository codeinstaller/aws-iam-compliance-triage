SELECT
    user AS principal,
    1 AS key_slot,
    date_diff(
        'day',
        TRY_CAST(left(access_key_1_last_rotated, 10) AS DATE),
        (SELECT analysis_date FROM run_context)
    ) AS credential_age_days
FROM credential_report_before
WHERE NOT contains(user, 'root_account')
  AND access_key_1_active = 'true'
  AND date_diff(
        'day',
        TRY_CAST(left(access_key_1_last_rotated, 10) AS DATE),
        (SELECT analysis_date FROM run_context)
      ) > 90
ORDER BY principal;