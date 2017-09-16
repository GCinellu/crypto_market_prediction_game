class Prediction < ApplicationRecord
  belongs_to :user

  validates :expiration, presence: true

  validate :expiration_in_the_past?
  validate :too_far_in_the_future?

  validates :coin,     presence: true, inclusion: { in: Coins.list }
  validates :exchange, presence: true, inclusion: { in: Exchanges.list }

  private

  def expiration_in_the_past?
    if expiration and DateTime.now > expiration
      errors.add(:expiration, "can't be in the past dude, come on")
    end
  end

  def too_far_in_the_future?
    if expiration and expiration > DateTime.now + 7
      errors.add(:expiration, "You need to reason in short terms my friend, max 7 days")
    end
  end
end
