class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :name
      t.attachment :photo
      t.integer :dog_id
      t.timestamp
    end
  end
end
