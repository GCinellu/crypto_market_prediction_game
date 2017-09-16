require 'rails_helper'

RSpec.describe Predicted, type: :model do
  before(:each) do
    User.destroy_all

    @user = FactoryGirl.create(:user_valid)
    @predicted = FactoryGirl.build(:predicted, user: @user)
  end

  context 'validation' do
    context 'expiring' do
      it 'should throw an error if field is missing' do
        @predicted.expiration = nil
        expect(@predicted.valid?).to eq false
      end
    end

    context 'coin' do
      it 'should throw an error if field is missing' do
        @predicted.coin = nil
        expect(@predicted.valid?).to eq false
      end

      it 'should throw an error if value is unknown' do
        @predicted.coin = 'Defo not a coin'
        expect(@predicted.valid?).to eq false
      end

      it 'should be valid if value is known' do
        @predicted.coin = 'BTC'
        expect(@predicted.valid?).to eq true
      end
    end
  end
end
