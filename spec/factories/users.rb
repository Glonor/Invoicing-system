FactoryBot.define do
  factory :admin, class: User do
    first_name "Admin"
    last_name "User"
    sequence(:email) { |n| "admin#{n}@example.com" }
    password_digest User.digest('password')
    admin true
    fiscal_code "0123456789AQWEDS"
    address "MyString"
    city "MyString"
    district "MyString"
    postal_code "MyString"
    phone "0123456789"
  end

  factory :user do
    first_name "Neil"
    last_name "Armstrong"
    sequence(:email) { |n| "user#{n}@example.com" }
    password_digest User.digest('password')
    admin false
    fiscal_code "0123456789AQWEDS"
    address "MyString"
    city "MyString"
    district "MyString"
    postal_code "MyString"
    phone "023456465781"
  end
end
