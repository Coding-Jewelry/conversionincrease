class AddIsSetIconToNotifications < ActiveRecord::Migration[5.1]
  def change
    add_column :notifications, :isSetIcon, :integer
  end
end
