class AddUsersTable < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string        :name
      t.string        :password_digest
      t.boolean       :email
      t.boolean       :text
      t.timestamps
    end
  end
end