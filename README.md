scheduler
=========

This application currently uses SQLite, which requires no setup. It uses
factory_girl, minitest-spec-rails, and guard for automated testing.

`rake db:setup` should create the database and seed it using `db/seeds.rb`,
which will add two vendors, several activities and schedules. Faker could also
be used, but hasn't been added.
