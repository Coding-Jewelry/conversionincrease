class AddParam2ToMessages < ActiveRecord::Migration[5.1]
  def change
    add_column :messages, :param_2, :string
  end
end
