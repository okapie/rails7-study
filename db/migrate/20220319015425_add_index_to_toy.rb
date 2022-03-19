class AddIndexToToy < ActiveRecord::Migration[7.0]
  def change
    add_index :toys, :name, unique: true
  end
end
