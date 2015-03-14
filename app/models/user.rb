class User < ActiveRecord::Base
  # Include default devise modules.
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable,
          :omniauthable
  include DeviseTokenAuth::Concerns::User
  has_many :weighings
  has_many :programs
  has_one  :user_datum
  has_many :groups
  has_one  :family
  has_many :devices

  belongs_to :coach
end
