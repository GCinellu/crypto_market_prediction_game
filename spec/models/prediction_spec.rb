require 'rails_helper'

RSpec.describe Prediction, type: :model do
  before(:each) do
    User.destroy_all
    ExchangePrice.destroy_all
    Prediction.destroy_all

    @user = FactoryGirl.create(:user_valid)
    @prediction = FactoryGirl.build(:prediction, user: @user)
  end

  context 'validation' do
    context 'expiring_at' do
      it 'should be valid if in the future' do
        @prediction.expiring_at = DateTime.now + 4

        expect(@prediction.valid?).to eq true
      end

      it 'should not be valid and throw an error if the field is missing' do
        @prediction.expiring_at = nil
        expect(@prediction.valid?).to eq false
      end

      it 'should not be valid and throw an error if the date is more than a week in the future' do
        (1..12).each do |index|
          @prediction.expiring_at = DateTime.now + index

          expect(@prediction.valid?).to eq (index <= 7)
        end
      end

      it 'should not be valid and throw an error if the date is in the past' do
        @prediction.expiring_at = DateTime.now - 1
        expect(@prediction.valid?).to eq false
      end
    end

    context 'coin' do
      it 'should be valid if value is known' do
        @prediction.coin = 'BTC'

        expect(@prediction.valid?).to eq true
      end

      it 'should not be valid and throw an error if field is missing' do
        @prediction.coin = nil
        expect(@prediction.valid?).to eq false
      end

      it 'should not be valid and throw an error if value is unknown' do
        @prediction.coin = 'Defo not a coin'
        expect(@prediction.valid?).to eq false
      end
    end

    context 'exchange' do
      it 'should be valid if value is known' do
        @prediction.exchange = 'Coinbase'
        expect(@prediction.valid?).to eq true
      end

      it 'should not be valid and throw an error if field is missing' do
        @prediction.exchange = nil
        expect(@prediction.valid?).to eq false
      end

      it 'should not be valid and throw an error if value is unknown' do
        @prediction.exchange = 'Dodgy Exchange'
        expect(@prediction.valid?).to eq false
      end
    end

    context 'currency' do
      it 'should be valid if value is known' do
        @prediction.currency = 'USD'
        expect(@prediction.valid?).to eq true
      end

      it 'should not be valid and throw an error if field is missing' do
        @prediction.currency = nil
        expect(@prediction.valid?).to eq false
      end

      it 'should not be valid and throw an error if value is unknown' do
        @prediction.currency = 'Dodgy Exchange'
        expect(@prediction.valid?).to eq false
      end
    end

    context 'current_value' do
      it 'should be valid if value is present' do
        expect(@prediction.valid?).to eq true
      end

      it 'should not be valid and throw an error if field is missing' do
        @prediction.current_value = nil
        expect(@prediction.valid?).to eq false
      end
    end
  end
end
