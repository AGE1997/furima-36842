class CreateShippings < ActiveRecord::Migration[6.0]
  def change
    create_table :shippings do |t|
      t.string     :zip_code,           null: false
      t.integer    :prefecture,         null: false
      t.string     :municipal_district, null: false
      t.string     :address,            null: false
      t.string     :building_name
      t.string     :telephone_number,   null: false
      t.references :purchase,           null: false, foreign_key: :true
      t.timestamps
    end
  end
end
