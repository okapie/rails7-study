class AddSelectedGroupIdToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :selected_group_id, :integer
  end
end
