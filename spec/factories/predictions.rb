FactoryGirl.define do
  factory :prediction do
    user            :user

    coin            "BTC"
    exchange        "Coinbase"
    currency        "EUR"
    prediction_type "Absolute"

    change_in_price  1.5

    expiring_at       DateTime.now + 1
  end
end
