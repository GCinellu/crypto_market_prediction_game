class ApplicationController < ActionController::API
  include ActionController::Serialization

  protected

  def authenticate_user!
    error_message = "Invalid Token"
    token = request.headers["Auth-Token"]

    raise error_message unless token

    decoded_token = JsonWebToken.decode(token)
    raise error_message unless decoded_token

    user_id = decoded_token['id']
    user = User.find_by(id: user_id)
    raise error_message unless user

    raise error_message unless user.valid_token?(token)

    @current_user = user
    true
  rescue Exception => error
    render json: { error: error }
  end
end
