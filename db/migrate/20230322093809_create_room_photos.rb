class CreateRoomPhotos < ActiveRecord::Migration[7.0]
  def change
    create_table :room_photos do |t|
      t.text :photo_path

      t.timestamps
    end
  end
end
