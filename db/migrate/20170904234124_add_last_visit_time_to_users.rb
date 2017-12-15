class AddLastVisitTimeToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :last_visit_time, :datetime
  end
end
