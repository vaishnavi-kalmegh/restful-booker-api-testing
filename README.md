# Restful-Booker API Testing — Postman + Newman

A QA API automation package covering authentication and CRUD operations against Restful-Booker.

## Coverage
- POST /auth — valid and invalid credentials
- GET /booking — list bookings
- GET /booking/{id} — read created booking and nonexistent ID
- POST /booking — create valid booking and missing-field negative case
- PUT /booking/{id} — valid update and invalid-token negative case
- DELETE /booking/{id} — valid delete, invalid-token negative case, post-delete verification

## Automated checks
- HTTP status codes
- response time < 3000 ms
- required fields/types
- request/response consistency
- missing-field validation
- invalid-token rejection

## Run with Newman
```bash
npm install -g newman
./newman/run-newman.sh
```

The current agent environment could not resolve the public Restful-Booker hostname and Newman is not installed locally, so the included run report is explicitly marked `NOT_EXECUTED` rather than fabricating results.
