class AddWebhookUrlToNotifications < ActiveRecord::Migration[5.1]
  def change
    add_column :notifications, :webhookUrl, :string
  end
end
