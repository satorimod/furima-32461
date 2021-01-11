class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :address_items
  with_options presence: true do
    validates :nickname
    validates :dob format : { message: "Date of Birth can't be blank"}
    with_options format: { with: /\A[ぁ-んァ-ン一-龥]/ } do
      validates :last_name
      validates :first_name
    end

    with_options format: { with: /\A[ァ-ヶー－]+\z/ } do
      validates :furigana_last_name
      validates :furigana_first_name
    end
  end

  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates :password, length: { minimum: 6 }, format: { with: VALID_PASSWORD_REGEX }
  validates :password_confirmation, length: { minimum: 6 }, format: { with: VALID_PASSWORD_REGEX }
end
