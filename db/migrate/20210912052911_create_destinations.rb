class CreateDestinations < ActiveRecord::Migration[6.0]
  def change
    create_table :destinations do |t|

      t.string      :postal_code,   null: false
      t.string      :city,          null: false
      t.string      :address,       null: false
      t.string      :building_name
      t.string      :phone_number,  null: false
      t.integer     :prefecture_id, null: false
      t.references  :order,         foreign_key: true, null: false
      t.timestamps
    end
  end
end
