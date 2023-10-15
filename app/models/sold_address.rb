class SoldAddress
  include ActiveModel::Model
  attr_accessor :post_code,:region_id, :city, :street_address, :building_name, :telephone, :user_id, :item_id

  with_options presence: true do
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :region_id, numericality: { other_than: 0, message: "can't be blank" }
    validates :city
    validates :street_address
    validates :telephone, numericality: {only_integer: true}, length: { in: 10..11 }
    validates :user_id
    validates :item_id
  end

  def save
    sold_item = SoldItem.create(item_id: item_id, user_id: user_id)
    ShippingAddress.create(post_code: post_code, region_id: region_id, city: city, street_address: street_address, building_name: building_name, telephone: telephone, sold_item_id: sold_item.id)
  end
end