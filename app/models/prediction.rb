class Prediction < ApplicationRecord
  belongs_to :user

  validates :expiring_at, presence: true

  validate :expiration_in_the_past?
  validate :too_far_in_the_future?

  validates :coin,     presence: true, inclusion: { in: Coins.list }
  validates :exchange, presence: true, inclusion: { in: Exchanges.list }
  validates :currency, presence: true, inclusion: { in: Currencies.list }

  def check_current_value
    ExchangePrice.where(currency: self.currency, coin: self.coin).last
  end

  private

  def expiration_in_the_past?
    if expiring_at and DateTime.now > expiring_at
      errors.add(:expiring_at, "can't be in the past dude, come on")
    end
  end

  def too_far_in_the_future?
    if expiring_at and expiring_at > DateTime.now + 7
      errors.add(:expiring_at, "You need to reason in short terms my friend, max 7 days")
    end
  end
end
