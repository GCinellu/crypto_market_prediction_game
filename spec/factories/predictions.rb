FactoryGirl.define do
  factory :prediction do
    user :user
    amount 1.5
    expiration DateTime.now + 1
    coin 'BTC'
  end
end
