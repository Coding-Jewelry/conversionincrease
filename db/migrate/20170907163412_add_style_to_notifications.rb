class AddStyleToNotifications < ActiveRecord::Migration[5.1]
  def change
    add_column :notifications, :style, :string
  end
end
