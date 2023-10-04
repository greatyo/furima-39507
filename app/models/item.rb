class Item < ApplicationRecord
  belongs_to :user
  has_one :sold_item
  has_one_attached :image

  validates :name, presence: true, length:{maximum:40} #商品名40字まで
  validates :explanation, presence: true, length:{maximum:1000} #商品の説明1000字まで
  validates :category_id, presence: true                   #カテゴリ ActiveHash
  validates :situation_id, presence: true                   #状態 ActiveHash
  validates :delivery_charge_id, presence: true                   #配送料負担 ActiveHash
  validates :region_id, presence: true                   #発送元地域 ActiveHash
  validates :shipping_day_id, presence: true                   #発送までの日数 ActiveHash
  validates :price, presence: true
  validates :image, presence: true

end
