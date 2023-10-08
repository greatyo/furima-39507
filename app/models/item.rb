class Item < ApplicationRecord
  belongs_to :user
  # has_one :sold_item
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :situation
  belongs_to :delivery_charge
  belongs_to :region
  belongs_to :shipping_day

  validates :name, presence: true, length: { maximum: 40 } # 商品名40字まで
  validates :explanation, presence: true, length: { maximum: 1000 } # 商品の説明1000字まで
  validates :category_id, numericality: { other_than: 0, message: "can't be blank" }, presence: true # カテゴリ ActiveHash
  validates :situation_id, numericality: { other_than: 0, message: "can't be blank" }, presence: true # 状態 ActiveHash
  validates :delivery_charge_id, numericality: { other_than: 0, message: "can't be blank" }, presence: true # 配送料負担 ActiveHash
  validates :region_id, numericality: { other_than: 0, message: "can't be blank" }, presence: true # 発送元地域 ActiveHash
  validates :shipping_day_id, numericality: { other_than: 0, message: "can't be blank" }, presence: true # 発送までの日数 ActiveHash
  validates :price, numericality: { only_integer: true, in: 300..9_999_999 }, presence: true
  validates :image, presence: true
end
