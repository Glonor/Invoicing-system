FactoryBot.define do
  factory :event do
    title "MyString"
    description "MyText"
    billed nil
    start_time "2017-12-05 12:00:00"
    end_time "2017-12-05 13:00:00"
    association :client, factory: :client
  end
end
