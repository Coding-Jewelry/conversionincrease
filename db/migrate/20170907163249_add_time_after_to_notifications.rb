class AddTimeAfterToNotifications < ActiveRecord::Migration[5.1]
  def change
    add_column :notifications, :time_after, :integer
  end
end
