class RenameTrainsTable < ActiveRecord::Migration
  def change
    rename_table :trains_users, :lines_users
  end
end
