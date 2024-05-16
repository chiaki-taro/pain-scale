class User < ApplicationRecord
  has_many :pains
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :user_name,           presence: true
  validates :password,            format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i }
end
