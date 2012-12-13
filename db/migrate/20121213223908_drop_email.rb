class DropEmail < ActiveRecord::Migration
  def change
    remove_column :users, :email
    remove_column :users, :text
  end
end
