class CreateActivityLevels < ActiveRecord::Migration
  def change
    create_table :activity_levels do |t|
      t.string :name
      t.float  :correction
      t.timestamps null: false
    end
  end
end
