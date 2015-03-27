class Team < ActiveRecord::Base
  belongs_to :captain, class_name: "User"
  has_many   :games
  has_many   :memberships
  has_many   :players, through: :memberships
  belongs_to :home_location, class_name: "Location"
  has_attached_file :team_logo,
                    styles: { thumb: '100x100#', medium: '300x300>', team_summary: '150x150' },
                    :default_url => "system/teams/team_logos/:style/default_team_logo.png"

  validates   :captain, presence: true
  # validates   :home_location, presence: true
  validates   :activity, presence: true
  validates   :name, presence: true

  validates_attachment_content_type :team_logo, :content_type => /\Aimage\/.*\Z/
  validates_attachment_size :team_logo, less_than: 1.megabyte

  def future_games
    self.games.select do |game|
      game.future_game?
    end
  end

  def recent_games
    self.games.select do |game|
      !game.future_game?
    end
  end
end
