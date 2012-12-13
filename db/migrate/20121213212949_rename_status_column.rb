class RenameStatusColumn < ActiveRecord::Migration
  def change
    rename_column :statuses, :status, :condition
  end
end
