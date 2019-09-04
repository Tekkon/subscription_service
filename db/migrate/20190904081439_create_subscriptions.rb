class CreateSubscriptions < ActiveRecord::Migration
  def change
    create_table :subscriptions do |t|
      t.integer :user_id
      t.boolean :active
      t.boolean :paused
    end
  end
end
