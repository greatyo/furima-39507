class ShippingAddress < ApplicationRecord
  belongs_to :sold_item

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :region
end
