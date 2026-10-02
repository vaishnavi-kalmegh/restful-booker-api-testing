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

## Latest run results

- Requests: 12 (0 failed)
- Assertions: 41 (40 passed, 1 failed)
- Total duration: 5.7s
- Average response time: 326ms (min 204ms, max 963ms)
- Report: newman/final-run-report.html

## Defect found

POST /booking with the firstname field missing returns 500 Internal Server Error. Expected a 4xx client error (400 or 422). The assertion "Missing required field is rejected" is intentionally left failing to reflect this.

## Other observations

- POST /auth with invalid credentials returns 200 OK with a reason message instead of 401.
- DELETE /booking/{id} returns 201 Created, where 200 or 204 would be expected.

Tests accept the current behaviour.

## How to run

### Windows

1. Install Node.js.
2. Install Newman and the HTML extra reporter:
   ```bash
   npm install -g newman newman-reporter-htmlextra
   ```
3. Run the collection:
   ```bash
   newman run postman\Restful-Booker-API-Automation.postman_collection.json -e postman\Restful-Booker-Environment.postman_environment.json -r cli,htmlextra --reporter-htmlextra-export newman\final-run-report.html
   ```

## Run with Newman
```bash
npm install -g newman
./newman/run-newman.sh
```
