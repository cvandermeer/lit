class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable :recoverable, :trackable
  devise :database_authenticatable, :registerable, 
          :rememberable, :validatable

  ### RELATIONS ###
  has_many :questions
  has_many :user_results
  
  has_many :memberships
  has_many :teams, through: :memberships

  ### VALIDATIONS ###
  validates :name, presence: true

  after_create :user_defaults

  def user_defaults	
  	if self.admin == nil
  		self.admin = false
      self.points = 0
  		self.save
  	end
  end

  ## UPLOADER ##
  mount_uploader :avatar, ImageUploader
end
