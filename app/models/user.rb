class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :address_items
  
  validates :nickname, presence: true, length: { maximum: 10 }
  VALID_PASSWORD_REGEX = /\A[a-z0-9]+\z/i
  validates :password, length: { minimum: 6 }, format: { with: VALID_PASSWORD_REGEX }
  VALID_PASSWORD_REGEX = /\A[a-z0-9]+\z/i
  validates :password_confirmation,  length: { minimum: 5 }, format: { with: VALID_PASSWORD_REGEX }
  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :furigana_last_name, presence: true
  validates :furigana_first_name, presence: true
  validates :dob, presence: true
  
end
