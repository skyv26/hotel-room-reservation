class AddRoomForeignKeyConstraintToRoomTypes < ActiveRecord::Migration[7.0]
  def change
    add_reference :room_types, :room, on_delete: :cascade
  end
end
