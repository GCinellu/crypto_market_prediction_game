FactoryGirl.define do
  factory :predicted do
    user            :user

    coin            'BTC'
    exchange        'Coinbase'
    prediction_type 'Absolute'

    change_in_price  1.5
    value_at_time    3300.00

    expiration       DateTime.now + 1
  end
end
