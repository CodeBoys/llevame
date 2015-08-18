class AddUserIdToDogs < ActiveRecord::Migration
  def change
    remove_column :dogs, :owner_name
    remove_column :dogs, :owner_email
    remove_column :dogs, :owner_phone
    remove_column :dogs, :password
    remove_column :dogs, :anonymous
    add_column :dogs, :user_id, :integer

  end
end
