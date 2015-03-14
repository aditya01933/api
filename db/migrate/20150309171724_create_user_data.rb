class CreateUserData < ActiveRecord::Migration
  def change
    create_table :user_data do |t|
      t.integer  :user_id
      t.datetime :birthday
      t.integer  :heigh
      t.integer  :country
      t.string   :sex
      t.string   :body_frame
      t.string   :weigh_unit
      t.string   :heigh_unit
      t.string   :energy_unit
      t.string   :lifestyle

      t.timestamps null: false
    end
  end
end
