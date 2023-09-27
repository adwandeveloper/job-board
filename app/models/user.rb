class User < ApplicationRecord

  require_relative '../../lib/user_constants'

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :user_type, presence: true
  validates :password, presence: true
  validates :user_type, inclusion: { in: [UserConstants::SEEKER_TYPE, UserConstants::ADMIN_TYPE] }

  before_create :generate_authentication_token
  has_secure_password

  private

  def generate_authentication_token
    self.authentication_token = SecureRandom.hex(16)
  end
end
