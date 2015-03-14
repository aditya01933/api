class CreateWeighings < ActiveRecord::Migration
  def change
    create_table :weighings do |t|
      t.integer  :user_id
      t.integer  :program_id
      t.integer  :activity_id

      t.float  :weigh
      t.float  :body_fat
      t.float  :body_water
      t.float  :muscle_mass
      t.float  :physique_rating
      t.float  :basal_metabolic_rate
      t.integer  :metabolic_age
      t.float    :bone_mass
      t.float    :viscerial_fat
      t.text     :comment
      t.string   :image

      t.timestamps null: false
    end
  end
end
