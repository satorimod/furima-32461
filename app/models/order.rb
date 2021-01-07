class Order 
  include ActiveModel::Model
  attr_accessor :user, :item, :postal, :prefecrure_id, :municipality, :address, :building, :phone, :address_item

  with_options presence: true do
    validates :postal, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecrure_id, numericality: { other_than: 0,}
    validates :municipality
    validates :address
    validates :phone, format: { with: /\A\d{11}\z/}
  end

    def save
      AdressItem.create(user_id: user_id, item_id: item_id)
      Address.create(postal: postal, prefecrure_id: prefecrure_id, municipality: municipality, address: address, phone: phone, address_item: address_item)
    end  
end
