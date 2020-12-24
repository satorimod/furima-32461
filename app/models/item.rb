class Item < ApplicationRecord
  belongs_to :user
  has_one    :address_item
  has_one_attached :image
  belongs_to :category

  with_options presence: true do
    validates :name
    validates :explanation

    with_options numericality: do
      validates :price, { greater_than:  300, less_than: 9999999 }
      
      with_options { other_than: 1 } do
        validates :category_id
        validates :item_state_id
        validates :shipping_charges_id
        validates :shipping_area_id
        validates :shipping_date_id
        validates :user
        validates :image
  end  
end
