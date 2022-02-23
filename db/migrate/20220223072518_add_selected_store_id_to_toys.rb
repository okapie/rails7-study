class AddSelectedStoreIdToToys < ActiveRecord::Migration[7.0]
  def change
    add_column :toys, :selected_store_id, :integer
  end
end
