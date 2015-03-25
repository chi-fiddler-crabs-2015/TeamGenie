class Team < ActiveRecord::Base
  belongs_to :captain, class_name: "User"
  has_many   :games
  has_many   :memberships
  has_many   :players, through: :memberships
  belongs_to :home_location, class_name: "Location"
end
