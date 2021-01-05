class Order
  include ActiveModel::Model
  attr_accessor :user, :item, :postal, :prefecrure_id, :municipality, :address, :building, :phone, :address_item

  with_options presence: true do
    validates :postal, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecrure_id, numericality: { other_than: 0, message: "can't be blank" }
    validates :municipality
    validates :address
    validates :phone, format: { with: /\A\d{11}\z/}
    validates :address_item
    
    with_options foreign_key: true do
      validates :user
      validates :item
    end
  end
end
