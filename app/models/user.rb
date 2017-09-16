class User < ApplicationRecord
  include BCrypt

  has_secure_password
  validates :username, :email, :password, presence: true
  validates :username, :email, uniqueness: true

  validates :username, length: { in: 4..20 }

  validates_email_format_of :email, :message => 'Not a valid email'

  def password
    @password ||= Password.new(password_digest)
  rescue
    "Password can't be empty"
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_digest = @password
  end

  def token
    payload = { creation_date: created_at, id: id }

    JsonWebToken.encode(payload)
  end

  def valid_token? token
    decoded_token = JsonWebToken.decode(token)

    return false unless decoded_token
    return false unless token_expired?(decoded_token['exp'])

    true
  end

  private

  def token_expired? datestamp
    Time.at(datestamp) > Time.now
  end
end
