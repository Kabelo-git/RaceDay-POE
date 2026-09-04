\# RaceDay API Endpoint Plan



\## Authentication

| Method | Route | Description | Role Required | Request Body | Expected Response |

|--------|-------|--------------|----------------|----------------|---------------------|

| POST | /api/auth/register | Register a new user | None | { fullName, email, password, role } | 201 Created, user object (no password) |

| POST | /api/auth/login | Log in and receive a token | None | { email, password } | 200 OK, JWT token |



\## User Profile

| Method | Route | Description | Role Required | Request Body | Expected Response |

|--------|-------|--------------|----------------|----------------|---------------------|

| GET | /api/users/me | Get logged-in user's profile | Organiser or Participant | None | 200 OK, user object |

| PUT | /api/users/me | Update logged-in user's profile | Organiser or Participant | { fullName, email } | 200 OK, updated user |



\## Events

| Method | Route | Description | Role Required | Request Body | Expected Response |

|--------|-------|--------------|----------------|----------------|---------------------|

| GET | /api/events | List all upcoming events | Organiser or Participant | None | 200 OK, array of events |

| GET | /api/events/{id} | Get a single event's details | Organiser or Participant | None | 200 OK, event object |

| POST | /api/events | Create a new event | Organiser | { eventName, eventDate, location, description } | 201 Created, event object |

| PUT | /api/events/{id} | Edit an event | Organiser | { eventName, eventDate, location, description } | 200 OK, updated event |

| DELETE | /api/events/{id} | Delete an event | Organiser | None | 204 No Content |



\## Categories

| Method | Route | Description | Role Required | Request Body | Expected Response |

|--------|-------|--------------|----------------|----------------|---------------------|

| GET | /api/events/{eventId}/categories | List categories for an event | Organiser or Participant | None | 200 OK, array of categories |

| POST | /api/events/{eventId}/categories | Add a category to an event | Organiser | { categoryName, distance, price } | 201 Created, category object |

| PUT | /api/categories/{id} | Edit a category | Organiser | { categoryName, distance, price } | 200 OK, updated category |

| DELETE | /api/categories/{id} | Delete a category | Organiser | None | 204 No Content |



\## Event Enrolments

| Method | Route | Description | Role Required | Request Body | Expected Response |

|--------|-------|--------------|----------------|----------------|---------------------|

| POST | /api/enrolments | Enrol in an event category | Participant | { categoryId } | 201 Created, enrolment object |

| GET | /api/enrolments/me | View own enrolments | Participant | None | 200 OK, array of enrolments |

| GET | /api/events/{eventId}/enrolments | View all enrolments for an event | Organiser | None | 200 OK, array of enrolments |

| DELETE | /api/enrolments/{id} | Cancel an enrolment | Participant | None | 204 No Content |



\## Resultss

| Method | Route | Description | Role Required | Request Body | Expected Response |

|--------|-------|--------------|----------------|----------------|---------------------|

| POST | /api/results | Capture a participant's result | Organiser | { enrolmentId, finishTime, position } | 201 Created, result object |

| GET | /api/results/me | View own race results | Participant | None | 200 OK, array of results |

| GET | /api/events/{eventId}/results | View all results for an event | Organiser | None | 200 OK, array of results |

 
## Notes 
Endpoint plan reviewed against functional requirements before Part 2. 
