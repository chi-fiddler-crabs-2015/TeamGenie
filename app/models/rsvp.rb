class Rsvp < ActiveRecord::Base
  belongs_to  :membership
  belongs_to  :player, through: :membership, source: :user
  belongs_to  :game
end
