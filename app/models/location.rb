class Location < ActiveRecord::Base
  has_many  :games
  has_many  :teams, foreign_key: :home_location_id

  validates :name, presence: true
  validates :address, presence: true
  validates :city, presence: true
  validates :state, presence: true
end
