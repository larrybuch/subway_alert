class RemoveEmailAndTextColumns < ActiveRecord::Migration
  def change
    remove_column :users, :email
  end

  def change
    remove_column :users, :text
  end

  def change
    add_column :users, :phone, :string
  end
end
