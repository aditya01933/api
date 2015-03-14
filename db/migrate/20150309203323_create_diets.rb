class CreateDiets < ActiveRecord::Migration
  def change
    create_table :diets do |t|
      t.string  :name
      t.text    :description
      t.string  :copyright
      t.string  :image
      t.integer :rate
      t.timestamps null: false
    end
  end
end
