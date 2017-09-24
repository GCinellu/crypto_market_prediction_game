require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do
    User.delete_all
  end

  after(:each) do
    User.delete_all
  end

  context 'validation'do
    context 'username' do
      it "should not be valid if username is empty" do
        user = FactoryGirl.build(:user_no_username)

        expect(user.valid?).to eq false
      end

      it "should not be valid if username is shortes than 4 characters" do
        user = FactoryGirl.build(:user_valid, username: 'two')

        expect(user.valid?).to eq false
      end

      it "should not be valid if username is longer than 20 characters" do
        user = FactoryGirl.build(:user_valid, username: 'super mega long username that I would rather not store')

        expect(user.valid?).to eq false
      end

      it "should be unique" do
        user = FactoryGirl.create(:user_valid, email: 'test@unique.com')
        expect(user.valid?).to eq true

        user_two = FactoryGirl.build(:user_valid, email: 'different@unique.com')
        expect(user_two.valid?).to eq false
      end
    end

    context 'email' do
      it "should not be valid if email is empty" do
        user = FactoryGirl.build(:user_no_email)

        expect(user.valid?).to eq false
      end

      it "should not be valid if email is not a valid email format" do
        user = FactoryGirl.build(:user_valid, email: 'not an email indeed')
        expect(user.valid?).to eq false

        user = FactoryGirl.build(:user_valid)
        expect(user.valid?).to eq true
      end

      it "should be unique" do
        user = FactoryGirl.create(:user_valid, username: 'unique')
        expect(user.valid?).to eq true

        user_two = FactoryGirl.build(:user_valid, username: 'different')
        expect(user_two.valid?).to eq false
      end
    end

    context 'password' do
      it "should not be valid if password is empty" do
        user = FactoryGirl.build(:user_no_password)

        expect(user.valid?).to eq false
      end
    end
  end

  context 'token' do

  end

  context 'valid_token?'

end
