FactoryGirl.define do
  factory :predicted do
    user            :user

    coin            "BTC"
    exchange        "Coinbase"
    currency        "EUR"
    prediction_type "Absolute"

    change_in_price     300
    value_at_time       3000
    value_at_expiration 3200

    expired_at       DateTime.now - 1
  end
end
