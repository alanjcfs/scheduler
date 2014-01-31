# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

vendors = [{name: "Joe the Surfer"},
           {name: "Sarah the Snowboarder"},
           {name: "Sam the Racer"}]

vendors = Vendor.create(vendors)

vendors.each do |vendor|
  vendor.activities.create(name: "#{vendor.name}'s Lesson")
end

Activity.all.each do |activity|
  activity.schedules.create(date: 2.days.ago,
                           time_start: Time.parse("12:00:00"),
                           time_end: Time.parse("14:00:00"),
                           quantity: 8)
end
