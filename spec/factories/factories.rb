FactoryGirl.define do
  
  factory :airline do
    name "example"
  end

  factory :flight do
    number 0
    airline_id 0
  end

end