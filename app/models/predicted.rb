class Predicted < ApplicationRecord
  belongs_to :user

  validates :expired_at, presence: true

  validates :coin,     presence: true, inclusion: { in: Coins.list }
  validates :exchange, presence: true, inclusion: { in: Exchanges.list }
  validates :currency, presence: true, inclusion: { in: Currencies.list }
end
