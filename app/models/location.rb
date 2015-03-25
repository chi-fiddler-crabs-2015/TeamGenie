class Location < ActiveRecord::Base
  has_many  :games
  has_many  :teams, foreign_key: :home_location_id
end
