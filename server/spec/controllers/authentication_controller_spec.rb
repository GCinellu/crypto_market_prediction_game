require 'rails_helper'

RSpec.describe AuthenticationController, type: :controller do
  describe "POST #login" do
    before(:all) do
      User.destroy_all

      @user = FactoryGirl.create(:user_valid)
    end

    it "returns user's informations when credentials are correct" do
      post :login, params: { email: @user.email, password: 'popsicles'}

      body = JSON.parse(response.body)

      expect(response).to have_http_status(:success)

      expect(body['email']).to eq @user.email
      expect(body['username']).to eq @user.username
    end

    it "should return only a subset of parameters" do
      post :login, params: { email: @user.email, password: 'popsicles'}

      body = JSON.parse(response.body)

      expect(body.keys.count).to eq 3

      expect(body['email'].blank?).to eq false
      expect(body['username'].blank?).to eq false
      expect(body['token'].blank?).to eq false
    end

    it "returns a generic error message with wrong credentials" do
      post :login, params: { email: @user.email, password: 'popsicles2'}

      body = JSON.parse(response.body)

      expect(response).to have_http_status(404)
      expect(body['error']).to eq 'Wrong credentials'
    end
  end

  describe "POST #signup" do
    before(:each) do
      User.destroy_all

      @user = FactoryGirl.build(:user_valid)
    end

    it "returns user's informations when signup is successful" do
      post :signup, params: { user: { email: @user.email, username: @user.username, password: 'popsicles'}}

      body = JSON.parse(response.body)

      expect(response).to have_http_status(:success)
      expect(body['email']).to eq @user.email
      expect(body['username']).to eq @user.username
    end

    it "should return only a subset of parameters" do
      post :signup, params: { user: { email: @user.email, username: @user.username, password: 'popsicles'}}

      body = JSON.parse(response.body)

      expect(body.keys.count).to eq 3

      expect(body['email'].blank?).to eq false
      expect(body['username'].blank?).to eq false
      expect(body['token'].blank?).to eq false
    end

    it "returns an error when parameters are missing" do
      post :signup, params: { user: { email: @user.email, password: 'popsicles'}}
      expect(response).to have_http_status(404)

      post :signup, params: { user: { username: @user.username, password: 'popsicles'}}
      expect(response).to have_http_status(404)
    end
  end

end
