class AddBorderRadiusToNotifications < ActiveRecord::Migration[5.1]
  def change
    add_column :notifications, :borderRadius, :integer
  end
end
