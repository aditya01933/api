class CreateMeasurements < ActiveRecord::Migration
  def change
    create_table :measurements do |t|
      t.string  :name
      t.float   :correction
      t.string  :description
      t.timestamps null: false
    end
  end
end
