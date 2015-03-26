class User < ActiveRecord::Base
  has_many  :teams, foreign_key: :captain_id
  has_many  :memberships, foreign_key: :player_id
<<<<<<< HEAD
  has_many  :rsvps, through: :memberships #please revisit tmrw
  has_many  :games, through: :rsvps  #please revisit tmrw
=======
  has_many  :rsvps, through: :memberships
  has_many  :games, through: :rsvps

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, {
    presence: true,
    uniqueness: true,
    format: { with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/ }
  }
  validates :username, {
    presence: true,
    uniqueness: true
  }

>>>>>>> 5cfee525a9bf8ea938d3f20d325f4f2ce365d044
end
