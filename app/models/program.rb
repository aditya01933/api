class Program < ActiveRecord::Base
  belongs_to :user
  has_one    :diet
  has_many   :weighings
end
