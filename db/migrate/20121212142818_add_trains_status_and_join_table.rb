class AddTrainsStatusAndJoinTable < ActiveRecord::Migration
  def change
    create_table :lines do |t|
      t.string      :line
      t.timestamps
    end

    create_table :trains_users do |t|
      t.integer   :user_id
      t.integer   :line_id
    end

    create_table :statuses do |t|
      t.integer     :line_id
      t.string      :status
      t.text        :info
      t.timestamps
    end
  end
end