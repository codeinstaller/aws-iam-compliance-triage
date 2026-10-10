# AWS IAM Compliance Triage Engine

Hi, I'm Cherif.  
Working on cloud security and automation projects.  
I build practical tools that help with AWS security posture, evidence collection, and turning technical findings into clear reports.

## Project Overview
A lightweight SQL project that scans synthetic AWS IAM credential reports to find active vulnerabilities, prioritizes them by risk, and proves they are fixed with a final retest.

### What It Detects
- **IAM.4**: Active access keys on the root account (Critical)
- **IAM.5**: IAM users with console passwords but no MFA (Medium)
- **IAM.3**: Active access keys older than 90 days (Medium)

### How It Works
1. Load the "before" credential report into DuckDB
2. Detect findings and build a prioritized triage queue
3. Load the "after" report (post-remediation)
4. Retest and export both findings so you can show zero open issues

### Tools Used
- DuckDB CLI 1.5.5
- SQL
- Visual Studio Code
- Windows PowerShell

## Skills Demonstrated
- AWS IAM security controls
- SQL for evidence analysis and prioritization
- Compliance triage (risk scoring + remediation tracking)
- Before/after verification of fixes

## Keywords
AWS, IAM, Cloud Security, Compliance, SQL, DuckDB, Least Privilege, Access Keys, MFA, Cloud Governance, Evidence Collection

## Files
- `sql/` — the query workflow
- `data/` — synthetic credential reports (before and after)
- `output/` — exported findings
