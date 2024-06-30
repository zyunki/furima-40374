class CreateShippingOrigins < ActiveRecord::Migration[7.0]
  def change
    create_table :shipping_origins do |t|
      t.integer :user_id, null: false
      t.integer :item_id, null: false
      t.string :postal_code, null: false
      t.integer :prefecture_id, null: false
      t.string :city, null: false
      t.string :addresses, null: false
      t.string :building
      t.string :phone_number, null: false
      t.integer :order_id, null: false
      t.timestamps
    end

    # パフォーマンスの向上と参照整合性の確保のためインデックスを追加します
    add_index :shipping_origins, :user_id
    add_index :shipping_origins, :item_id
    add_index :shipping_origins, :order_id
  end
end
