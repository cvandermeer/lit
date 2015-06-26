class Team < ActiveRecord::Base

	### CALLBACKS ###
	after_create :subscribe_leader

	### RELATIONS ###
	has_many :memberships, dependent: :destroy
	has_many :users, through: :memberships
	belongs_to :user

	### DELEGATE ###
	delegate :name, to: :user, prefix: true

	### VALIDATIONS ###
	validates :name, presence: true
	validates :user_id, presence: true
	
	## UPLOADER ##
  mount_uploader :picture, ImageUploader

  def subscribe_leader
  	Membership.create(user_id: self.user.id, team_id: self.id, accepted: true)
  end

  def total_points
  	self.memberships.sum(:points)
  end
end
