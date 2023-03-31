class AddHotelForeignKeyConstraint < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :rooms, :hotels, on_delete: :cascade
  end
end
