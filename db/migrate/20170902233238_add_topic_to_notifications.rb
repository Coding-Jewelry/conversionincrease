class AddTopicToNotifications < ActiveRecord::Migration[5.1]
  def change
    add_column :notifications, :topic, :string
  end
end
