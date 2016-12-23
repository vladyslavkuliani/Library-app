class User < ApplicationRecord
  has_many :library_users, dependent: :destroy
  has_many :libraries, through: :library_users

  has_secure_password
  validates :first_name, :last_name, presence: true, length: {minimum: 2}
  validates :email, format: {with: /.@./}, presence: true, uniqueness: true
  validates :password, presence: true, length: {minimum: 8, maximum: 20}, on: :create

  def self.confirm(params)
    user = User.find_by_email(params[:email])
    user ? user.authenticate(params[:password]) : false
  end
end
