class User < ApplicationRecord
  include BCrypt

  has_secure_password
  validates :username, :email, :password, presence: true
  validates :username, :email, uniqueness: true

  validates :username, length: { in: 4..20 }

  validates_email_format_of :email, :message => 'Not a valid email'

  has_many :predictions
  has_many :predicteds

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
    return false unless expired?(decoded_token['exp'])
    return false unless valid_id?(decoded_token['id'])
    return false unless valid_created_at?(DateTime.parse(decoded_token['creation_date']))

    true
  end

  private

  def expired? datestamp
    Time.at(datestamp) > Time.now
  end

  def valid_created_at? supposed_created_at
    created_at.to_i == supposed_created_at.to_i
  end

  def valid_id? supposed_id
    id == supposed_id
  end
end
