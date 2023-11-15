FactoryBot.define do
  factory :picture_book do
    purchase_date { Date.current.strftime}
    breed {"succulent"}
    price { 111111111111111}
    shop {"aaaaaaaaaaaaaaaaaaaa"}
    association :user
  end
end
