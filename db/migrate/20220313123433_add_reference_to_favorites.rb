class AddReferenceToFavorites < ActiveRecord::Migration[7.0]
  def change
    add_reference :favorites, :toy, foreign_key: true
  end
end
