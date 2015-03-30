class User < ActiveRecord::Base
  has_secure_password

  has_many  :teams, foreign_key: :captain_id
  has_many  :memberships, foreign_key: :player_id
  has_many  :rsvps, through: :memberships
  has_many  :games, through: :rsvps

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :password, presence: true, :length => { :minimum => 8 }, on: :create
  validates :email, {
    presence: true,
    uniqueness: true,
    format: { with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/ }
  }
  validates :username, {
    presence: true,
    uniqueness: true
  }

  serialize :stripe_account_status, JSON


  def my_teams
    self.memberships.map do |membership|
      membership.team
    end
  end

  # General 'has a Stripe account' check
  def connected?; !stripe_user_id.nil?; end

  # Stripe account type checks
  def managed?; stripe_account_type == 'managed'; end
  def standalone?; stripe_account_type == 'standalone'; end
  def oauth?; stripe_account_type == 'oauth'; end

  def manager
    case stripe_account_type
    when 'managed' then StripeManaged.new(self)
    when 'standalone' then StripeStandalone.new(self)
    when 'oauth' then StripeOauth.new(self)
    end
  end

  def can_accept_charges?
    return true if oauth?
    return true if managed? && stripe_account_status['charges_enabled']
    return true if standalone? && stripe_account_status['charges_enabled']
    return false
  end

end
