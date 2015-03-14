class UserDatum < ActiveRecord::Base
  belongs_to :user
  has_one    :measurement
  has_one    :activity_level
end
