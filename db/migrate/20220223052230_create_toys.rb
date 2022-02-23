class CreateToys < ActiveRecord::Migration[7.0]
  def change
    create_table :toys do |t|
      t.references :buyable, polymorphic: true, null: false

      t.timestamps
    end
  end
end
