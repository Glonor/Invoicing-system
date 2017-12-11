FactoryBot.define do
  factory :event do
    title "MyString"
    description "MyText"
    billed false
    start_time "2017-12-05 12:54:00"
    end_time "2017-12-05 12:54:00"
    client
  end
end
