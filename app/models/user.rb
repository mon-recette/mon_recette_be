class User < ApplicationRecord
  validates :email, uniqueness: true, presence: true
  validates_presence_of :password
  has_secure_password

  def generate_auth_token
    self.auth_token = SecureRandom.hex
  end
end