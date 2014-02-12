scheduler
=========

This application currently uses SQLite, which requires no setup. It uses
factory_girl, minitest-spec-rails, and guard for automated testing.

`rake db:setup` should create the database and seed it using `db/seeds.rb`,
which will add two vendors, several activities and schedules. Faker could also
be used, but hasn't been added.


API Documentation
-----------------

API covering the following cases:

    Data model for activities -- no need to go crazy, it can be really simple and just have an Activity name and a Vendor name (e.g. activity = “surf lesson” and vendor = “Joe the Surf Instructor”)
    Ability to add and remove activity availability
    API ability to check activity day availability over a range (e.g. what days are available between 10/10/13 and 11/10/13?)
    API ability to check activity availability within a day (e.g. what times are available on 10/15/13?)
    API ability to create bookings against activities with availability (= reduce remaining availability)
    Automated tests hitting the API for all the different cases

### Vendors actions

1. List of Vendors

  GET "/vendors", the response will be

    { "vendors": [ list_of_vendors ] }

2. Show Vendor

  GET "/vendors/123/show", the response will be

    { "vendor": [{"id": 123,
    "name": "Joe the Surf Instructor" }]}

3. Create Vendor

  POST to "/vendors" with

    { "vendor": { "name": "Dana" } }

  The response will be a serialized vendor if successful or errors if not.

### Activities actions

Creating an activity requires an admin namespace.

POST to "/admin/activities" with

    { "activity": { "name": "Surfing" }}

Getting a list of activities:

GET "/activities?date\_start=2014-01-01&date\_end=2014-01-31" to get all
activities in the month of January.

The response will look like:

    {"activities"=>[{"id"=>1, "name"=>"Surfing Lesson",
     "schedules"=>[{"id"=>1, "date"=>"2014-01-15", "time_start"=>"2000-01-01T20:00:00Z",
     "time_end"=>"2000-01-01T20:00:00Z", "quantity"=>8, "activity_id"=>1, "reserved"=>0,
     "sold_out"=>false, "available"=>true}]}]}

GET "/activities" alone will return all activities.

### Schedules actions

Admin Tasks:

Creating a schedule:

    POST to "/admin/schedules" with params["schedule"] object that has
    the date, time_start, time_end, quantity, activity_id, and price.

To make a schedule unavailable:

    PATCH to "/admin/schedules/123/change_availability"
    with {"schedule": { "available": false" }}

The `change_availability` action will only accept available as the permitted
parameter.

User tasks

1. To obtain a list of schedules for an activity:

    GET "/activities/123/schedules"

2. To obtain a schedule information (the nesting is shallow, there is always
   one unique schedule so we don't need to have the activity\_id, but we do
   include the activity information):

    GET "/schedules/123"

3. Sometimes a schedule is not available, but can be viewed. To know whether
   it is available or not, check `response["schedule"]["available"]`.

### Creating a booking

POST to "/bookings" with

    { booking: { schedule_id: 123 },
      travelers: [{ name: "Benjamin" }, { name: "Jonathan" }] }

It will return the booking or a JSON error.
