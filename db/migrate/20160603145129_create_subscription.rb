class CreateSubscription < ActiveRecord::Migration
  def change
    create_table :subscriptions do |t|
      t.integer :user_id, null: false
      t.integer :event_id, null: false
      t.timestamps null: false
    end
  end
end
