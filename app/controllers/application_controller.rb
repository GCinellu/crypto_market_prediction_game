class ApplicationController < ActionController::API
  protected

  def authenticate_user!
    error_message = "Invalid Token"
    token = request.headers["Auth-Token"]

    raise error_message unless token

    decoded_token = JsonWebToken.decode(token)
    raise error_message unless decoded_token

    user_id = decoded_token['id']
    user_created_at = decoded_token['creation_date']

    user = User.find_by(id: user_id)
    raise error_message unless user

    date_check = Time.at(user.created_at).to_i == Time.at(DateTime.parse(user_created_at)).to_i
    raise error_message unless date_check
    raise error_message unless user.valid_token?(token)

    true
  rescue Exception => error
    render json: { error: error }
  end

  def current_user
  end
end
