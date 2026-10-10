# Build an AWS IAM Compliance Engine

**Project Link:** [View Project](https://nextwork.ai/projects/8f691823-720b-4e4b-bf9c-1bcbfe917fe9)

**Author:** Cherif Rahman

---

![Image](https://nextwork.ai/charmed_violet_joyful_custard-apple/uploads/8f691823-720b-4e4b-bf9c-1bcbfe917fe9_19o9lvk0)

## Defining the Cloud Governance Mission

### The compliance challenge this engine solves

I'm building an Amazon Web Services IAM  compliance engine with SQL, and why because some companies have some trouble when it comes to logs, and what I wanna do is find problems and create a solution for this project.

## Preparing a Local SQL Audit Workspace

### Setting up a reproducible local audit environment

In this step, I'm basically trying to install DuckDB CLI into Windows PowerShell so DuckDB is an open-source database anjd I'm going to create a local project workspace in Visual Studio Code then create a persistent database that returns a ready status.

![Image](https://nextwork.ai/charmed_violet_joyful_custard-apple/uploads/8f691823-720b-4e4b-bf9c-1bcbfe917fe9_decm1caa)

### Verifying DuckDB and the project workspace are ready

It basically shows a small database saying that it's ready and  gives me a file of it that proves that my audit workspace is ready.

## Turning Raw IAM Evidence into an MFA Finding

### Loading AWS-shaped credential evidence for analysis

For this step I'm trying to create a IAM report then load a synthetic evidence on a fixed analysis so that I can run the missing MFA control to inspect the finding for alice.

### Preserving source evidence with text-based ingestion

I preserved the source fields as text because they were formatted incorrectly, and that was the section with the problems. I was able to transfer the path from VS Code because I got confused, but now I'm glad I know the cause and why, so if I get this error again, it will be easier and won't take as long.

![Image](https://nextwork.ai/charmed_violet_joyful_custard-apple/uploads/8f691823-720b-4e4b-bf9c-1bcbfe917fe9_vw1tkbr4)

### Tracing the evidence behind alice's IAM.5 failure

I observed that Alice does not have MFA enabled, which caused the errors that have been shown in the image. MFA is to protect users from potential hackers getting into the accounts. This is why it is crucial to have MFA enabled, so it wouldn't be a hassle to fix it once a hacker gets in.

## Exposing the Access-Key Coverage Gap

### Testing the limitation of a first-slot-only key check

In this step, I'm trying a code where it checks for a key that is expired. If it reaches the 90-day deadline, it is unusable because if AWS doesn't implement it, companies that haven't checked their credential hygiene are at risk. 

![Image](https://nextwork.ai/charmed_violet_joyful_custard-apple/uploads/8f691823-720b-4e4b-bf9c-1bcbfe917fe9_a9t3t2rc)

### Showing why bob's second access key was missed

I proved the gap by comparing with Bob's first key, since it's disabled, it's listed as false, and his second key is labeled as true, since the query only checks key one, so Bob is completely missing from the SQL results.

## Normalizing Credentials into a Prioritized Triage Queue

### Creating reusable control logic across both key slots

In this step, for Bob's databases, I'm trying to rearrange his access keys so his old one won't be hidden. This time, it is arranged so it shows up, and by rearranging, I can see both of them. It'll also be severity-ranked to show how quickly it becomes a security risk.

## Proving Remediation and Publishing Sanitized Evidence

### Retesting controls against remediated IAM evidence

In this step, I'm retesting the three controls so that I can do remediation on the security threats that I found, and the database is telling me that I need to fix them, like deleting root access or enabling MFA for a user.

![Image](https://nextwork.ai/charmed_violet_joyful_custard-apple/uploads/8f691823-720b-4e4b-bf9c-1bcbfe917fe9_7863dywt)

![Image](https://nextwork.ai/charmed_violet_joyful_custard-apple/uploads/8f691823-720b-4e4b-bf9c-1bcbfe917fe9_32e4pe4y)

### Demonstrating closure safely with synthetic evidence

The repository proves remediation by using a mock user. It stays safe because exposing real AWS keys would be a critical security risk. To prove the fix, we use 'before' and 'after' CSV files. Anyone can run our SQL code against these files to watch the active findings drop from 4 to 0.

## Extending Coverage to Unused IAM Credentials

### Applying normalized evidence to the IAM.8 unused-credential check

## Reflecting on the Compliance Engineering Workflow

### Tools and governance concepts applied

The key tools I used included SQL, which lets you query databases and view account severity in AWS. Key concepts I learnt include SQL and knowing about IAM because it teaches me how some users can exploit their roles, and it is implemented to detect unauthorized access and remove roles from users or flag any suspicious activities.

### Project timeline and key challenge

This project took me approximately 3 days. The most challenging part was when I was trying to run the file and DuckDB couldn't find it; then I realized it was a naming error that I had forgotten to implement and a database view error in which the SQL Script was missing a query.

### Next steps in cloud security learning

I did this project today to learn how to create an AWS Identity and Access Management system with SQL that businesses/startups can use. Another skill I want to learn is CI/CD pipelines because I'm interested in what they do and how they are implemented in systems.

---
