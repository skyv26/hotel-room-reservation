class CreateRooms < ActiveRecord::Migration[7.0]
  def change
    create_table :rooms do |t|
      t.text :description
      t.decimal :price_per_night

      t.timestamps
    end
  end
end
