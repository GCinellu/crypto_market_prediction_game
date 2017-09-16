class Predicted < ApplicationRecord
  belongs_to :user

  validates :expiration, presence: true

  validates :coin,     presence: true, inclusion: { in: Coins.list }
  validates :exchange, presence: true, inclusion: { in: Exchanges.list }
end
