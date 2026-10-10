CREATE OR REPLACE VIEW access_keys_before AS
SELECT
    user,
    arn,
    1 AS key_slot,
    access_key_1_active AS active,
    TRY_CAST(left(access_key_1_last_rotated, 10) AS DATE) AS last_rotated
FROM credential_report_before
UNION ALL
SELECT
    user,
    arn,
    2 AS key_slot,
    access_key_2_active AS active,
    TRY_CAST(left(access_key_2_last_rotated, 10) AS DATE) AS last_rotated
FROM credential_report_before;


CREATE OR REPLACE VIEW findings_before AS
SELECT
    'IAM.4' AS control_id,
    'IAM root user access key should not exist' AS control_name,
    'CRITICAL' AS severity,
    1 AS severity_rank,
    user AS principal,
    arn AS resource_arn,
    CAST(NULL AS INTEGER) AS key_slot,
    CAST(NULL AS BIGINT) AS credential_age_days,
    'Cloud Platform' AS owner_team,
    'Root user has an active access key' AS evidence,
    'Delete every access key associated with the root user' AS recommended_action
FROM credential_report_before
WHERE contains(user, 'root_account')
  AND (access_key_1_active = 'true' OR access_key_2_active = 'true')

UNION ALL


SELECT
    'IAM.5' AS control_id,
    'MFA should be enabled for all IAM users that have a console password' AS control_name,
    'MEDIUM' AS severity,
    2 AS severity_rank,
    user AS principal,
    arn AS resource_arn,
    CAST(NULL AS INTEGER) AS key_slot,
    CAST(NULL AS BIGINT) AS credential_age_days,
    'Identity Operations' AS owner_team,
    'Console password is enabled but MFA is not active' AS evidence,
    'Enable MFA for the IAM user' AS recommended_action
FROM credential_report_before
WHERE NOT contains(user, 'root_account')
  AND password_enabled = 'true'
  AND mfa_active = 'false'

UNION ALL


SELECT
    'IAM.3' AS control_id,
    'IAM users'' access keys should be rotated every 90 days or less' AS control_name,
    'MEDIUM' AS severity,
    2 AS severity_rank,
    user AS principal,
    arn AS resource_arn,
    key_slot,
    date_diff('day', last_rotated, analysis_date) AS credential_age_days,
    'Identity Operations' AS owner_team,
    'Active access key is older than 90 days' AS evidence,
    'Rotate the access key and update every dependent workload' AS recommended_action
FROM access_keys_before
CROSS JOIN run_context
WHERE NOT contains(user, 'root_account')
  AND active = 'true'
  AND last_rotated IS NOT NULL
  AND date_diff('day', last_rotated, analysis_date) > 90;


  
SELECT
    control_id,
    severity,
    principal,
    key_slot,
    credential_age_days,
    owner_team,
    evidence,
    recommended_action
FROM findings_before
ORDER BY severity_rank, principal, key_slot;