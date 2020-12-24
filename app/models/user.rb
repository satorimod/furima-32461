class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :address_items
  with_options presence: true do
    validates :nickname,length: { maximum: 10 }
    validates :last_name, format: { with: /\A[ぁ-んァ-ン一-龥]/}
    validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]/}
    validates :furigana_last_name, format: { with: /\A[ァ-ヶー－]+\z/ }
    validates :furigana_first_name, format: { with: /\A[ァ-ヶー－]+\z/}
    validates :dob
  end
  
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i
  validates :password, length: { minimum: 6 }, format: { with: VALID_PASSWORD_REGEX, }
  validates :password_confirmation,  length: { minimum: 6 }, format: { with: VALID_PASSWORD_REGEX, }
  
end
