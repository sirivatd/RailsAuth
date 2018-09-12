class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true
  validates :password_digest, presence: { message: 'Password can\'t be blank'}
  validates :session_token, presence: true, uniqueness: true
  validates :password, length: {minumum: 6, allow_nil: true }
  before_validation: :ensure_session_token

  def ensure_session_token
    self.session_token ||= User.generate_session_token
  end
end
