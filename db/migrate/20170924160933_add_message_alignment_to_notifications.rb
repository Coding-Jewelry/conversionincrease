class AddMessageAlignmentToNotifications < ActiveRecord::Migration[5.1]
  def change
    add_column :notifications, :messageAlignment, :string
  end
end
