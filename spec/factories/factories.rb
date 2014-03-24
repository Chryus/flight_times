FactoryGirl.define do
  
  factory :airline do
    name "example"
  end

  factory :flight do
    number 0
    airline_id 0
  end

  factory :arrival do 
    date "01/12/13"
    scheduled_time "10:00"
    actual_time 0
    flight_id 0
    origin_airport_id 0 
    destination_airport_id 0
  end

  factory :time_parser do 
    arrival_times_array []
  end

end