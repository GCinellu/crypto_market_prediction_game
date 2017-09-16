class ExchangePrice < ApplicationRecord
  @allowed_exchanges = ['Coinbase']
  @allowed_coins = ['BTC']
  @allowed_currencies = ['EUR', 'USD']

  validates :exchange, inclusion: { in: @allowed_exchanges }
  validates :coin, inclusion: { in: @allowed_coins }
  validates :currency, inclusion: { in: @allowed_currencies }
end
