class User < ActiveRecord::Base
  has_many  :teams, foreign_key: :captain_id
  has_many  :memberships, foreign_key: :player_id
end
