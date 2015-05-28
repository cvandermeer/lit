class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable :recoverable, :trackable
  devise :database_authenticatable, :registerable, 
          :rememberable, :validatable, :omniauthable, :omniauth_providers => [:facebook]

  ### RELATIONS ###
  has_many :questions
  has_many :user_results

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

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.name = auth.info.name   # assuming the user model has a name
      user.avatar = auth.info.image # assuming the user model has an image
    end
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end

  ## UPLOADER ##
  mount_uploader :avatar, ImageUploader
end
