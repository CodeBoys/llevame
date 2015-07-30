class CreateDogs < ActiveRecord::Migration
  def change
    create_table :dogs do |t|
      t.string :name
      t.integer :age
      t.text :description
      t.string :particular_signals
      t.string :owner_name
      t.string :owner_email
      t.string :owner_phone
      t.float :lat
      t.float :lng
      t.belongs_to :breed, index: true

      t.timestamps
    end
  end
end
