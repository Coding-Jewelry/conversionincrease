class AddFontFamilyToNotifications < ActiveRecord::Migration[5.1]
  def change
    add_column :notifications, :fontFamily, :string
  end
end
