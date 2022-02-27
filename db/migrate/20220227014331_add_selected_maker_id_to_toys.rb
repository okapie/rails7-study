class AddSelectedMakerIdToToys < ActiveRecord::Migration[7.0]
  def change
    add_column :toys, :selected_maker_id, :integer
  end
end
