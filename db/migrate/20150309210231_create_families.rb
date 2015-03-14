class CreateFamilies < ActiveRecord::Migration
  def change
    create_table :families do |t|
      t.integer :user_id
      t.string  :name
      t.boolean :show_all_data
      t.boolean :allow_comments
      t.timestamps null: false
    end
  end
end
