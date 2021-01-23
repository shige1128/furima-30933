FactoryBot.define do
  factory :product do
    products_name {Faker::Lorem.characters(number: 40)}
    text          {Faker::Lorem.characters(number: 1000)}
    category_id   {2}
    status_id     {2}
    shipping_id   {2}  
    area_id       {2}
    days_id       {2}
    price         {5000}
    association :user

    after(:build) do |product|
      product.image.attach(io: File.open('public/images/test_banana.jpg'), filename: 'test_banana.jpg')
    end
  end
end
