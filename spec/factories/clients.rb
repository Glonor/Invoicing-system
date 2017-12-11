FactoryBot.define do
  factory :client do
    first_name "Sterling"
    last_name "Archer"
    sequence(:email) { |n| "client#{n}@example.com" }
    association :user, factory: :user
    tariff "9.99"
    fiscal_code "0123456789AQWEDS"
    address "MyString"
    city "MyString"
    district "MyString"
    postal_code "MyString"
    phone "MyString"
  end

  factory :client_two, class: Client do
    first_name "Sterling"
    last_name "Archer"
    sequence(:email) { |n| "client#{n}@example.com" }
    association :user, factory: :user
    tariff "9.99"
    fiscal_code "0123456789AQWEDS"
    address "MyString"
    city "MyString"
    district "MyString"
    postal_code "MyString"
    phone "MyString"
  end

end
