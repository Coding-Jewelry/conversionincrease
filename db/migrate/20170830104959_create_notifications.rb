class CreateNotifications < ActiveRecord::Migration[5.1]
  def change
    create_table :notifications do |t|
      t.string :name
      t.integer :captureSource
      t.string :displayUrls
      t.integer :optimizeMode
      t.string :message

      t.timestamps
    end
  end
end
