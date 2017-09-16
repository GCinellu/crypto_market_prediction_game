class Prediction < ApplicationRecord
  belongs_to :user

  validates :expiration, presence: true
  validate :expiration_in_the_past?

  validates :coin, presence: true, inclusion: { in: Coins.list }

  private

  def expiration_in_the_past?
    if expiration and DateTime.now > expiration
      errors.add(:expiration, "can't be in the past")
    end
  end
end
