\# RaceDay — Part 1: System Planning and Database



\## Description

RaceDay is a full-stack web-based event management system for South African road running, walking, and cycling events. This part covers the system's data model, API endpoint plan, and database schema before any application code is written.



\## Roles

\- \*\*Organiser\*\* – can create, edit, and delete events, manage event categories, capture participant results, and view all event enrolments.

\- \*\*Participant\*\* – can create an account, browse events, enter an event by selecting a category, view their own enrolments, and track their personal results.



\## Contents of /docs

\- `ERD.png` – Entity Relationship Diagram for the RaceDay database (6 entities: User, Event, Category, Route, Enrolment, Result)

\- `endpoint-plan.md` – Full API endpoint plan covering authentication, user profile, events, categories, enrolments, and results

\- `RaceDay.sql` – SQL script creating and seeding the full database schema, tested in SQL Server Management Studio



\## CI/CD

A GitHub Actions workflow (`.github/workflows/docs-check.yml`) validates that the `/docs` folder and its required files exist on every push.



\*\*Build status:\*\*

!\[CI/CD Green Build](docs/ci-success.png)



\## Video Walkthrough

\[INSERT YOUR UNLISTED YOUTUBE LINK HERE ONCE RECORDED]



The video covers: the planning documents, the ERD design decisions, the endpoint plan choices, and a live run-through of the SQL script in SSMS.

