FactoryBot.define do
  factory :item do
    title {'オーイェー'}
    concept {'パーリーピーポー'}
    category_id {2}
    status_id {3}
    delivery_id {2}
    area_id {2}
    day_id {3}
    price {350}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/apple-touch-icon.png'), filename: 'apple-touch-icon.png')
    end
  end
end
