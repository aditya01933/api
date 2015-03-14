class Device < ActiveRecord::Base
  has_many :scales
  belongs_to :user
end
