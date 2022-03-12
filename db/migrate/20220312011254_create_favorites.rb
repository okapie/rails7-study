class CreateFavorites < ActiveRecord::Migration[7.0]
  def change
    create_table :favorites do |t|
      t.references :member, null: false, foreign_key: true
      t.string :toy_maker_name
      t.string :toy_name
      t.string :store_maker_name
      t.string :store_name

      t.timestamps
    end
  end
end
