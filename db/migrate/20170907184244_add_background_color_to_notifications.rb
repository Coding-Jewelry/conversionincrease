class AddBackgroundColorToNotifications < ActiveRecord::Migration[5.1]
  def change
    add_column :notifications, :backgroundColor, :string
  end
end
