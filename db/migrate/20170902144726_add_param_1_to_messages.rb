class AddParam1ToMessages < ActiveRecord::Migration[5.1]
  def change
    add_column :messages, :param_1, :string
  end
end
