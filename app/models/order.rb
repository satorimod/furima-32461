class Order 
  include ActiveModel::Model
  attr_accessor :postal, :prefecture_id, :municipality, :address, :building, :phone, :address_item, :token, :user_id, :item_id

  with_options presence: true do
    validates :postal, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture_id, numericality: { other_than: 0,}
    validates :municipality
    validates :address
    validates :phone, format: { with: /\A\d{11}\z/}
    validates :token
  end

    def save
      order = AddressItem.create(user_id: user_id, item_id: item_id)
      Address.create(postal: postal, prefecture_id: prefecture_id, municipality: municipality, address: address, phone: phone, address_item_id: order.id)
    end  
end
