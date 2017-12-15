class AddSlugToNotifications < ActiveRecord::Migration[5.1]
  def change
    add_column :notifications, :slug, :string
  end
end
