class CreateActivityTypes < ActiveRecord::Migration
  def change
    create_table :activity_types do |t|
      t.string :name
      t.float  :correction
      t.timestamps null: false
    end
  end
end
