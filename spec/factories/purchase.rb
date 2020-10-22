FactoryBot.define do
  factory :purchase do
    token           { "tok_abcdefghijk00000000000000000" }
    postal_code     { '123-4567' }
    prefecture_id   { 1 }
    city            { Faker::Address.city }
    address         { Faker::Address.street_address } 
    building_name   { Faker::Address.building_number }
    phone_number    { "09011111111" }  
  end
end
