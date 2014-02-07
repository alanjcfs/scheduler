FactoryGirl.define do
  factory :schedule do
    date        Date.parse("2014-01-15")
    time_start  Time.parse("12:00:00")
    time_end    Time.parse("12:00:00")
    quantity    8
    activity

    factory :sold_out_schedule do
      reserved  8
    end

    factory :unavailable_schedule do
      available false
    end
  end
end
