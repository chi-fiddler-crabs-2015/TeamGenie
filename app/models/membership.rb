class Membership < ActiveRecord::Base
  belongs_to  :player, class_name: "User"
  belongs_to  :team
  has_many    :rsvps
  has_many    :games, through: :rsvps
end
