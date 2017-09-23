class ExchangePrice < ApplicationRecord
  validates :exchange, inclusion: { in: Exchanges.list }
  validates :coin, inclusion: { in: Coins.list }
  validates :currency, inclusion: { in: Currencies.list }
end
