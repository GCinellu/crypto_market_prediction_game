class User < ApplicationRecord
  include BCrypt

  has_secure_password
  validates :username, :email, :password, presence: true
  validates :username, length: { in: 4..20 }

  validates_email_format_of :email, :message => 'not a valid email'

  def password
    @password ||= Password.new(password_digest)
  rescue
    "Password can't be empty"
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_digest = @password
  end
end
