class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one    :address_item
  has_one_attached :image
  belongs_to :category
  belongs_to :item_state
  belongs_to :shipping_area
  belongs_to :shipping_charge
  belongs_to :shipping_date

  with_options presence: true do
    validates :name
    validates :explanation
    # validates :user
    validates :image
    validates :price, numericality:{ greater_than:  300, less_than: 9999999 }, format: { with:/\A[0-9]+\z/ }
      
      with_options numericality: { other_than: 1 } do
        validates :category_id
        validates :item_state_id
        validates :shipping_charge_id
        validates :shipping_area_id
        validates :shipping_date_id
      end  
  end
end