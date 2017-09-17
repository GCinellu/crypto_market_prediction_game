FactoryGirl.define do
  factory :predicted do
    user            :user

    coin            "BTC"
    exchange        "Coinbase"
    currency        "EUR"
    prediction_type "Absolute"

    change_in_price  1.5
    value_at_time    3300.00

    expired_at       DateTime.now + 1
  end
end
