# Restful-Booker API Testing — Postman + Newman

A manual and automated API-testing portfolio project using the public [Restful-Booker demo API](https://restful-booker.herokuapp.com/). The collection covers authentication, booking CRUD, negative cases, response validation, and deletion verification.

## Test coverage

| Area | Coverage |
|---|---|
| Authentication | Valid credentials; invalid credentials and token handling |
| Read | List bookings; retrieve a booking; nonexistent booking ID |
| Create | Valid booking; missing required field |
| Update | Valid update; invalid-token rejection |
| Delete | Valid deletion; invalid-token rejection; verify deleted booking is no longer found |

## Assertions

- Expected HTTP status codes for each scenario
- Response time below 3,000 ms
- Response body fields and data types
- Created/updated values match the request
- Invalid tokens are rejected
- Deleted booking is no longer retrievable

## Run locally

Requirements: Node.js and npm.

Install the project's local test dependencies:

```bash
npm install
```

Run the collection and generate an HTML report:

```bash
npm run test:api
```

The HTML report is written to `newman/final-run-report.html`. The script can also be run in WSL/Linux:

```bash
./newman/run-newman.sh
```

The suite calls a public demo API, so results can vary with service availability and shared demo data. Do not run against production systems or use real credentials.

## Continuous integration

GitHub Actions runs the Newman collection on pushes to `main`, pull requests targeting `main`, and manual workflow dispatches. The HTML report is uploaded as a workflow artifact even when an assertion fails, so failures remain visible rather than being silently treated as success.

The missing-`firstname` regression accepts either the expected 4xx validation response or the currently observed 500 response so the suite can continue, but it emits a visible Newman warning when the 500 occurs. This is defect monitoring, not evidence that the API behavior is correct. Tighten the assertion to 4xx-only after the API is fixed.

## Known API behaviour / defect

The last recorded run on 2 October 2026 contained 12 requests and 41 assertions: 40 passed and 1 failed. The failing regression check is intentional: sending `POST /booking` without `firstname` returned `500 Internal Server Error`, while a client-side validation error (4xx) is expected. This is a defect finding, not a passing test.

Other observed behaviours in that run:
- Invalid credentials on `POST /auth` returned `200 OK` with a reason message and no token.
- `DELETE /booking/{id}` returned `201 Created`.

These observations are tied to that run and may change because the API is a public demo service. Re-run the suite before quoting current results. The committed HTML report is a historical artifact, not proof of a fresh run.

## Repository contents

- `postman/` — Postman collection and environment
- `newman/` — command-line runner and saved HTML report
- `package.json` — local Newman dependencies and test command

## Portfolio note

This project demonstrates API test design, positive and negative scenarios, reusable environment variables, response assertions, automated execution, and defect reporting.
