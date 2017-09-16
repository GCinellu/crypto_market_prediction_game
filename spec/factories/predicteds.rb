FactoryGirl.define do
  factory :predicted do
    user :user
    amount 1.5
    expiration DateTime.now + 1
    coin 'BTC'
    coin_price_at_datetime 1.5
  end
end
