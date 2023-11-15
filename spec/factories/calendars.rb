FactoryBot.define do
  factory :calendar do
    date_type { 0 }
    record_date {1.week.from_now}
    association :user
  end
end
