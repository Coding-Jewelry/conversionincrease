class AddOpacityToNotifications < ActiveRecord::Migration[5.1]
  def change
    add_column :notifications, :opacity, :float
  end
end
