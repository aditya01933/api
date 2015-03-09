class CreateWeighings < ActiveRecord::Migration
  def change
    create_table :weighings do |t|
      t.integer  :user_id
      t.float    :weigh
      t.decimal  :body_fat
      t.decimal  :body_water
      t.decimal  :muscle_mass
      t.decimal  :physique_rating
      t.decimal  :basal_metabolic_rate
      t.integer  :metabolic_age
      t.float    :bone_mass
      t.float    :viscerial_fat
      t.text     :comment
      t.string   :image

      t.timestamps null: false
    end
  end
end
