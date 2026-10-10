CREATE OR REPLACE TABLE run_context AS
SELECT DATE '2026-09-19' AS analysis_date;

CREATE OR REPLACE TABLE credential_report_before AS
SELECT *
FROM read_csv(
    'data/iam_credential_report_before.csv',
    all_varchar = true
);

SELECT COUNT(*) AS evidence_rows
FROM credential_report_before;

SELECT
    'IAM.5' AS control_id,
    user AS principal,
    arn AS resource_arn,
    'Console password is enabled but MFA is not active' AS evidence,
    'Enable MFA for the IAM user' AS recommended_action
FROM credential_report_before
WHERE NOT contains(user, 'root_account')
  AND password_enabled = 'true'
  AND mfa_active = 'false';