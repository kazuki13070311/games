class CreateNotifications < ActiveRecord::Migration[6.0]
  def change
    create_table :notifications do |t|
      t.integer :post_id
      t.integer :comment_id
      t.integer :visiter_id, null: false
      t.integer :visited_id, null: false
      t.string :action, default: '', null: false
      t.boolean :checked, default: false, null: false
      t.timestamps
    end

    add_index :notifications, :post_id
    add_index :notifications, :comment_id
    add_index :notifications, :visiter_id
    add_index :notifications, :visited_id
  end
end
