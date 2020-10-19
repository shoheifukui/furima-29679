class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.timestamps
      t.string     :purchase,       null: false, foreign_key: true
      t.integer    :postal_code,    null: false
      t.string     :prefecture,     null: false
      t.string     :address,        null: false
      t.string     :building_name
      t.string     :phone_number,   null: false
    end
  end
end