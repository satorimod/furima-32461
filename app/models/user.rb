class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :address_items
  with_options presence: true do
    validates :nickname,length: { maximum: 10 }
    validates :dob
    with_options  format: { with: /\A[ぁ-んァ-ン一-龥]/} do
      validates :last_name
      validates :first_name
    end

    with_options format: { with: /\A[ァ-ヶー－]+\z/ } do
      validates :furigana_last_name 
      validates :furigana_first_name
    end  
  end
  
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i
  validates :password, length: { minimum: 6 }, format: { with: VALID_PASSWORD_REGEX, }
  validates :password_confirmation,  length: { minimum: 6 }, format: { with: VALID_PASSWORD_REGEX, }
  
end
