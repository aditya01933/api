class Group < ActiveRecord::Base
  belongs_to :user
  has_many   :coaches
  has_many   :users
end
