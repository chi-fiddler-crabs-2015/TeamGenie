class User < ActiveRecord::Base
  has_secure_password

  has_many  :teams, foreign_key: :captain_id
  has_many  :memberships, foreign_key: :player_id
  has_many  :rsvps, through: :memberships
  has_many  :games, through: :rsvps

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :password, presence: true, :length => { :minimum => 8 }
  validates :email, {
    presence: true,
    uniqueness: true,
    format: { with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/ }
  }
  validates :username, {
    presence: true,
    uniqueness: true
  }

  def my_teams
    self.memberships.map do |membership|
      membership.team
    end
  end

end
