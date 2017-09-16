require 'rails_helper'

RSpec.describe Prediction, type: :model do
  before(:each) do
    User.destroy_all

    @user = FactoryGirl.create(:user_valid)
    @prediction = FactoryGirl.build(:prediction, user: @user)
  end

  context 'validation' do
    context 'expiring' do
      it 'should throw an error if field is missing' do
        @prediction.expiration = nil
        expect(@prediction.valid?).to eq false
      end

      it 'should be valid if in the future' do
        @prediction.expiration = DateTime.now + 1
        expect(@prediction.valid?).to eq true
      end

      it 'should be valid and throw an error if in the past' do
        @prediction.expiration = DateTime.now - 1
        expect(@prediction.valid?).to eq false
      end
    end

    context 'coin' do
      it 'should throw an error if field is missing' do
        @prediction.coin = nil
        expect(@prediction.valid?).to eq false
      end

      it 'should throw an error if value is unknown' do
        @prediction.coin = 'Defo not a coin'
        expect(@prediction.valid?).to eq false
      end

      it 'should be valid if value is known' do
        @prediction.coin = 'BTC'
        expect(@prediction.valid?).to eq true
      end
    end
  end
end
