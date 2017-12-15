class AddNotificationIdToMessages < ActiveRecord::Migration[5.1]
  def change
    add_column :messages, :notification_id, :integer
  end
end
