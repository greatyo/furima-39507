class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string :name, null: false                  #商品名40字まで
      t.text :explanation, null: false                   #商品の説明1000字まで
      t.integer :category_id, null: false                   #カテゴリ ActiveHash
      t.integer :situation_id, null: false                   #状態 ActiveHash
      t.integer :delivery_charge_id, null: false                   #配送料負担 ActiveHash
      t.integer :region_id, null: false                   #発送元地域 ActiveHash
      t.integer :shipping_day_id, null: false                   #発送までの日数 ActiveHash
      t.integer :price, null: false
      t.references :user, foreign_key: true,null: false
      t.timestamps
    end
  end
end
