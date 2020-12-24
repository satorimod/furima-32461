class Item < ApplicationRecord
  belongs_to :user
  has_one    :address_item
end
