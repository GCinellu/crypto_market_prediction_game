class AuthenticationController < ApplicationController
  def login
    user = User.find_by_email!(params[:email])

    raise unless user.password == params[:password]

    response = success_response(user)

    render json: response
  rescue Exception => error
    # render json: { error: error }, status: 200
    render json: { error: 'Wrong credentials' }, status: 200
  end

  def signup
    user = User.create!(user_params)

    response = success_response(user)

    render json: response
  rescue Exception => error
    render json: { error: error }, status: 404
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :username)
  end

  def success_response user
    {
      email: user.email,
      username: user.username,
      token: user.token
    }
  end
end
