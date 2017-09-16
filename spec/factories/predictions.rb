FactoryGirl.define do
  factory :prediction do
    user            :user

    coin            'BTC'
    exchange        'Coinbase'
    prediction_type 'Absolute'

    change_in_price  1.5
    current_value    3300.00

    expiration       DateTime.now + 1
  end
end
