class Team < ActiveRecord::Base
  belongs_to :captain, class_name: "User"
  has_many   :games
  has_many   :memberships
  has_many   :players, through: :memberships
  belongs_to :home_location, class_name: "Location"
  has_attached_file :team_logo,
                    styles: { thumb: '100x100#', medium: '300x300>', team_summary: '150x150' }

  validates   :captain, presence: true
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

  def amount_owed
    self.dues - self.paid_dues_mem
  end

  def outstanding_memberships
    self.memberships.where('paid = false')
  end

  def outstanding_memberships_count
    self.outstanding_memberships.count
  end

  def paid_dues_mem
    self.memberships.pluck(:amount_paid).reduce(:+)
  end

end
