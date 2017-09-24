require 'rails_helper'

RSpec.describe PredictionsController, type: :controller do
  before(:each) do
    User.destroy_all
    Prediction.destroy_all
    ExchangePrice.destroy_all

    @user = FactoryGirl.create(:user_valid)

    request.headers.merge! valid_headers
  end

  let(:valid_attributes) {
    {
      coin: 'BTC',
      exchange: 'Coinbase',
      currency: 'EUR',
      prediction_type: 'Absolute',
      change_in_price: 300,
      expiring_at: Time.now + 40,
    }
  }

  let(:invalid_attributes) {
    {
      coin: 'XYYYX',
      exchange: 'Somewhere never herd of',
      currency: 'USDDDX',
      prediction_type: 'Absolute',
      change_in_price: 300,
      expiring_at: Time.now + 40
    }
  }

  let(:valid_headers) {
    {
      "Auth-Token": @user.token
    }
  }

  describe "GET #index" do
    it "returns a success response" do
      get :index, params: {}
      expect(response).to be_success
    end

    it "returns the list of user's predictions" do
      get :index, params: {}

      response_length = JSON.parse(response.body).length
      expect(response_length).to eq @user.predictions.count
    end

    it "should have every element in the list serialized" do
      FactoryGirl.create(:prediction, user: @user)
      FactoryGirl.create(:prediction, user: @user)
      FactoryGirl.create(:prediction, user: @user)

      get :index, params: {}

      parsed_response = JSON.parse(response.body)
      random_element = parsed_response.sample

      expect(random_element.keys.count).to eq 7

      expect(random_element['coin'].blank?).to eq false
      expect(random_element['exchange'].blank?).to eq false
      expect(random_element['currency'].blank?).to eq false
      expect(random_element['prediction_type'].blank?).to eq false
      expect(random_element['change_in_price'].blank?).to eq false
      expect(random_element['current_value'].blank?).to eq false
      expect(random_element['expiring_at'].blank?).to eq false
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      prediction = FactoryGirl.create(:prediction, user: @user)

      get :show, params: { id: prediction.id }
      expect(response).to be_success
    end

    it "returns the prediction with the given id" do
      prediction = FactoryGirl.create(:prediction, user: @user)

      get :show, params: { id: prediction.id }

      parsed_response = JSON.parse(response.body)

      expect(parsed_response['coin']).to eq prediction.coin
      expect(parsed_response['exchange']).to eq prediction.exchange
      expect(parsed_response['currency']).to eq prediction.currency
    end

    it "should return only the wanted values" do
      prediction = FactoryGirl.create(:prediction, user: @user)

      get :show, params: { id: prediction.id }

      parsed_response = JSON.parse(response.body)
      expect(parsed_response.keys.count).to eq 7

      expect(parsed_response['coin'].blank?).to eq false
      expect(parsed_response['exchange'].blank?).to eq false
      expect(parsed_response['currency'].blank?).to eq false
      expect(parsed_response['prediction_type'].blank?).to eq false
      expect(parsed_response['change_in_price'].blank?).to eq false
      expect(parsed_response['current_value'].blank?).to eq false
      expect(parsed_response['expiring_at'].blank?).to eq false
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Prediction" do
        FactoryGirl.create(:valid_exchange_price)

        expect {
          post :create, params: { prediction: valid_attributes }
        }.to change(Prediction, :count).by(1)
      end

      it "returns a json with the Prediction's data" do
        FactoryGirl.create(:valid_exchange_price)

        post :create, params: { prediction: valid_attributes }

        parsed_response = JSON.parse(response.body)
        expect(parsed_response.keys.count).to eq 2

        prediction = parsed_response['prediction']
        expect(prediction.keys.count).to eq 7

        expect(prediction['coin'].blank?).to eq false
        expect(prediction['exchange'].blank?).to eq false
        expect(prediction['currency'].blank?).to eq false
        expect(prediction['prediction_type'].blank?).to eq false
        expect(prediction['change_in_price'].blank?).to eq false
        expect(prediction['current_value'].blank?).to eq false
        expect(prediction['expiring_at'].blank?).to eq false
      end
    end

    context "with invalid params" do
      it "returns a success response" do
        FactoryGirl.create(:valid_exchange_price)

        post :create, params: { prediction: invalid_attributes}
        expect(response).to be_success
      end

      it "returns a json describing the error" do
        post :create, params: { prediction: invalid_attributes}

        expect(JSON.parse(response.body)['error']).to eq 'Validation failed: Coin is not included in the list, Exchange is not included in the list, Currency is not included in the list'
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested prediction" do
      prediction = FactoryGirl.create(:prediction, user: @user)

      expect {
        delete :destroy, params: {id: prediction.id }
      }.to change(Prediction, :count).by(-1)
    end

    it "returns the destroyed prediction" do
      prediction = FactoryGirl.create(:prediction, user: @user)

      delete :destroy, params: {id: prediction.id }

      parsed_response = JSON.parse(response.body)

      expect(parsed_response.keys.count).to eq 7

      expect(parsed_response['coin'].blank?).to eq false
      expect(parsed_response['exchange'].blank?).to eq false
      expect(parsed_response['currency'].blank?).to eq false
      expect(parsed_response['prediction_type'].blank?).to eq false
      expect(parsed_response['change_in_price'].blank?).to eq false
      expect(parsed_response['current_value'].blank?).to eq false
      expect(parsed_response['expiring_at'].blank?).to eq false
    end
  end
end
