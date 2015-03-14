class CreatePrograms < ActiveRecord::Migration
  def change
    create_table :programs do |t|
      t.integer  :user_id
      t.string   :name
      t.text     :comment
      t.decimal  :init
      t.decimal  :goal
      t.datetime :init_date
      t.datetime :goal_date

      t.timestamps null: false
    end
  end
end
