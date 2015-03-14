class ActivityLevel < ActiveRecord::Base
  has_many :user_datum
end
