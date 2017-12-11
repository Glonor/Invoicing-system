FactoryBot.define do
  factory :invoice do
    user
    client
    issue_date "2017-11-26 11:02:23"
    total_amount "9.99"
  end
end
