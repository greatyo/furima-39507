class CreateShippingAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :shipping_addresses do |t|
      t.string :post_code, null: false
      t.string :region_id, null: false
      t.string :city, null: false
      t.string :street_address, null: false
      t.string :building_name
      t.string :telephone, null: false
      t.references :sold_item, foreign_key: true, null: false
      t.timestamps
    end
  end
end
