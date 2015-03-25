class Game < ActiveRecord::Base
  belongs_to  :location
  belongs_to  :team
  has_many    :rsvps
end
