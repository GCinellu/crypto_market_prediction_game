FactoryGirl.define do
  factory :exchange_price do
    trait :btc_etc_coinbase do
      exchange  'Coinbase'
      currency  'EUR'
      coin      'BTC'

      spot      10
      sell      10
      buy       10
    end

    factory :valid_exchange_price, traits: [:btc_etc_coinbase]
  end
end