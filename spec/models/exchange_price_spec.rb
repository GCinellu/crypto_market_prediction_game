require 'rails_helper'

RSpec.describe ExchangePrice, type: :model do
  context "validating the exchange name" do
    it "should accept a known exchange name upon saving" do
      expect(FactoryGirl.build(:valid_exchange_price, exchange: 'Coinbase')).to be_valid
    end

    it "should decline an unknown exchange name upon saving and throw an error" do
      expect(FactoryGirl.build(:valid_exchange_price, exchange: 'Evil Exchange')).to_not be_valid
      expect(FactoryGirl.build(:valid_exchange_price, exchange: 'CoinbaseEvil Exchange')).to_not be_valid
    end
  end

  context "validating the coin name" do
    it "should accept a known coin upon saving" do
      expect(FactoryGirl.build(:valid_exchange_price, coin: 'BTC')).to be_valid
    end

    it "should decline an unknown coin upon saving and throw an error" do
      expect(FactoryGirl.build(:valid_exchange_price, coin: 'INVALID_COIN')).to_not be_valid
      expect(FactoryGirl.build(:valid_exchange_price, coin: 'BTC123')).to_not be_valid
    end
  end

  context "validating the currency" do
    it "should accept a known currency upon saving" do
      expect(FactoryGirl.build(:valid_exchange_price, currency: 'USD')).to be_valid
      expect(FactoryGirl.build(:valid_exchange_price, currency: 'EUR')).to be_valid
    end

    it "should decline an unknown currency upon saving and throw an error" do
      expect(FactoryGirl.build(:valid_exchange_price, currency: 'EURBANANA')).to_not be_valid
      expect(FactoryGirl.build(:valid_exchange_price, currency: 'XYS_CURRENCY')).to_not be_valid
    end
  end
end
