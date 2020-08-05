# README

run with 
rails s

list all doctors
GET http://localhost:3000/doctors

delete appointment
DELETE	http://localhost:3000/doctors/:id	

add appointment
POST	http://localhost:3000/appointments/

list all appoitnments for doctor on day
GET http://localhost:3000/doctors/:id/:date

notes: 
TESTS NEEDS TESTS
params not sanitized, need to sanitize.

using the assumption that patients will also exist eventually

within 15 min intervals, no more than 3 of the same datetime - kinda complicated?
probably too niche for basic validations:

no more than 3: 
search db for entries with the same datetime, if <2, we good, validation success
if is 3 or more, then validation fails

15 minute intervals:
this should probably be handled in the front, but if it escapes, then should probably filter datetime/ time into 15 min intervals, also in validations

I've sunk more than an hour into getting date/time stuff set up, so I'm going to pseudocode a bit of it to get the ball rolling. 