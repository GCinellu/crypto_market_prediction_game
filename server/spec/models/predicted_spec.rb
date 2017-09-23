require 'rails_helper'

RSpec.describe Predicted, type: :model do
  before(:each) do
    User.destroy_all

    @user = FactoryGirl.create(:user_valid)
    @predicted = FactoryGirl.build(:predicted, user: @user)
  end

  context 'validation' do
    context 'expiring_at' do
      it 'should be valid if field is present' do
        @predicted.expired_at = DateTime.now + 1
        expect(@predicted.valid?).to eq true
      end

      it 'should not be valid and throw an error if field is missing' do
        @predicted.expired_at = nil
        expect(@predicted.valid?).to eq false
      end
    end

    context 'coin' do
      it 'should be valid if value is known' do
        @predicted.coin = 'BTC'
        expect(@predicted.valid?).to eq true
      end

      it 'should not be valid and throw an error if field is missing' do
        @predicted.coin = nil
        expect(@predicted.valid?).to eq false
      end

      it 'should not be valid and throw an error if value is unknown' do
        @predicted.coin = 'Defo not a coin'
        expect(@predicted.valid?).to eq false
      end
    end

    context 'exchange' do
      it 'should be valid if value is known' do
        @predicted.exchange = 'Coinbase'
        expect(@predicted.valid?).to eq true
      end

      it 'should not be valid and throw an error if field is missing' do
        @predicted.exchange = nil
        expect(@predicted.valid?).to eq false
      end

      it 'should not be valid and throw an error if value is unknown' do
        @predicted.exchange = 'Malicious AF Exchange'
        expect(@predicted.valid?).to eq false
      end
    end

    context 'currency' do
      it 'should be valid if value is known' do
        @predicted.currency = 'USD'
        expect(@predicted.valid?).to eq true
      end

      it 'should not be valid and throw an error if field is missing' do
        @predicted.currency = nil
        expect(@predicted.valid?).to eq false
      end

      it 'should not be valid and throw an error if value is unknown' do
        @predicted.currency = 'XYZ123'
        expect(@predicted.valid?).to eq false
      end
    end

    context 'difference' do
      xit 'should tell how close the user was in its prediction' do
        prediction = FactoryGirl.create(:prediction, user: @user)
        predicted = FactoryGirl.create(:predicted, user: @user)
        difference = @predicted.difference
        expect(@predicted.valid?).to eq false
      end
    end
  end
end
