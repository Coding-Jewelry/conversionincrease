class AddFontSizeToNotifications < ActiveRecord::Migration[5.1]
  def change
    add_column :notifications, :fontSize, :integer
  end
end
