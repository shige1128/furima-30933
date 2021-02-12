FactoryBot.define do
  factory :order_history do
    postal_code    { '111-1111' }
    area           { 2 }
    municipalities { '横浜市' }
    address_number { '1−1' }
    building       { 'メゾン一刻' }
    phone_number   { Faker::Number.number(digits: 10) }
    token          { 'tok_abcdefghijk00000000000000000' }
    user_id        { 1 }
    product_id     { 1 }
  end
end
