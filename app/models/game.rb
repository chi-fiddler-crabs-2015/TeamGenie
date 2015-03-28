class Game < ActiveRecord::Base
  belongs_to  :location
  belongs_to  :team
  has_many    :rsvps

  validates :game_time, presence: true
  validates :location, presence: true


  def future_game?
    if self.game_time > Time.now()
      return true
    end
    false
  end

  def find_rsvp_status(rsvp_status)
    self.rsvps.where(attending: rsvp_status).count
  end

end
