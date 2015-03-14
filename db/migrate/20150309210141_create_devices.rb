class CreateDevices < ActiveRecord::Migration
  def change
    create_table :devices do |t|
      t.integer :user_id
      t.integer :device_type
      t.string  :name
      t.string  :device_string
      t.string  :device_params
      t.timestamps null: false
    end
  end
end
