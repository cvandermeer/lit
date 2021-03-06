class Membership < ActiveRecord::Base
  ### CALLBACKS ###
  before_create :set_default

  ### RELATIONS ###
  belongs_to :team
  belongs_to :user

  ### DELEGATE ###
  delegate :user_id, to: :team, prefix: true

  ### VALIDATIONS ###
  validates :user_id, presence: true
  validates :team_id, presence: true

  ### METHODS ###
  def set_default
    self.points = 0
  end
end
