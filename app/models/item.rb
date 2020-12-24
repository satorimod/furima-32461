class Item < ApplicationRecord
  belongs_to :user
  has_one    :address_item
  has_one_attached :image
end
