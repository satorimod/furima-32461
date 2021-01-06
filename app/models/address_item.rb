class AddressItem
  include ActiveModel::Model
  include ActiveModel::Associations
  attr_accessr :user, :item, :postal, :prefecrure_id, :municipality, :address, :building, :phone, :address_item

  belongs_to :user
  belongs_to :item
  has_one    :address

  with_options presence: true do
    validates :postal, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecrure_id, numericality: { other_than: 0, message: "can't be blank" }
    validates :municipality
    validates :address
    validates :phone, format: { with: /\A\d{11}\z/}
    validates :address_item
  end

    with_options foreign_key: true do
      validates :user
      validates :item
    end

    def save
      Address.create(postal: postal, prefecrure_id: prefecrure_id, municipality: municipality, address: address, phone: phone, address_item: address_item, user_id: user_id)
      AdressItem.create(user: user, item: item)
    end  
end
