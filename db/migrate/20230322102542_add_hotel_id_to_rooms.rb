class AddHotelIdToRooms < ActiveRecord::Migration[7.0]
  def change
    add_reference :rooms, :hotel, null: false, foreign_key: true, on_delete: :cascade
  end
end
