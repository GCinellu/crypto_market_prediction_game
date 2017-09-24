require 'rails_helper'

RSpec.describe PredictedsController, type: :controller do
  before(:each) do
    User.destroy_all
    Predicted.destroy_all

    @user = FactoryGirl.create(:user_valid)

    request.headers.merge! valid_headers
  end

  let(:valid_headers) {
    {
      "Auth-Token": @user.token
    }
  }

  describe "GET #index" do
    it "returns http success" do
      FactoryGirl.create(:predicted, user: @user)

      get :index
      expect(response).to have_http_status(:success)

      expect(JSON.parse(response.body).length).to eq @user.predicteds.length
    end

    it "should return a set of serialized objects" do
      FactoryGirl.create(:predicted, user: @user)
      FactoryGirl.create(:predicted, user: @user)
      FactoryGirl.create(:predicted, user: @user)

      get :index

      parsed_response = JSON.parse(response.body)
      random_element = parsed_response.sample

      expect(random_element.keys.count).to eq 8

      expect(random_element['coin'].blank?).to eq false
      expect(random_element['exchange'].blank?).to eq false
      expect(random_element['currency'].blank?).to eq false
      expect(random_element['prediction_type'].blank?).to eq false
      expect(random_element['change_in_price'].blank?).to eq false
      expect(random_element['value_at_expiration'].blank?).to eq false
      expect(random_element['value_at_time'].blank?).to eq false
      expect(random_element['expired_at'].blank?).to eq false
    end
  end

  describe "GET #show" do
    it "returns http success" do
      predicted = FactoryGirl.create(:predicted, user: @user)

      get :show, params: { id: predicted.id }
      expect(response).to have_http_status(:success)
    end

    it "should expose only a subset of attributes" do
      predicted = FactoryGirl.create(:predicted, user: @user)

      get :show, params: { id: predicted.id }

      parsed_response = JSON.parse(response.body)
      expect(parsed_response.keys.count).to eq 8

      expect(parsed_response['coin'].blank?).to eq false
      expect(parsed_response['exchange'].blank?).to eq false
      expect(parsed_response['currency'].blank?).to eq false
      expect(parsed_response['prediction_type'].blank?).to eq false
      expect(parsed_response['change_in_price'].blank?).to eq false
      expect(parsed_response['value_at_expiration'].blank?).to eq false
      expect(parsed_response['value_at_time'].blank?).to eq false
      expect(parsed_response['expired_at'].blank?).to eq false
    end
  end
end
