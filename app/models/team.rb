class Team < ActiveRecord::Base
  belongs_to :captain, class_name: "User"
  has_many   :games
  has_many   :memberships
  has_many   :players, through: :memberships
  belongs_to :home_location, class_name: "Location"

  validates   :captain, presence: true
  validates   :home_location, presence: true
  validates   :activity, presence: true
  validates   :name, presence: true
end
