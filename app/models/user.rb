class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable :recoverable, :trackable
  devise :database_authenticatable, :registerable,
          :rememberable, :validatable, :omniauthable, :omniauth_providers => [:facebook]

  ### RELATIONS ###
  has_many :questions
  has_many :user_results, dependent: :destroy
  has_many :word_of_the_week_reactions, dependent: :destroy
  has_many :memberships, dependent: :destroy
  has_many :teams, through: :memberships

  ### VALIDATIONS ###
  validates :name, presence: true

  ### CALLBACKS ###
  after_create :user_defaults
  before_destroy :remove_teams

  ### METHODS ###
  def remove_teams
    Team.where(user_id: self.id).each do |t|
      t.destroy
    end
  end

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
      user.name = auth.info.name
      user.facebook_image_url = auth.info.image + '?type=large'
    end
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] unless user.email?
      end
    end
  end

  def get_back_all(val)
    if self.user_results.where(language_id: val).any?
      ((self.user_results.where(language_id: val, correctly_answered: true).count.to_f / self.user_results.where(language_id: val).count.to_f) * 100).round
    else
      0
    end
  end

  def self.search(search)
    where("name LIKE ?", "%#{search}%")
  end

  ## UPLOADER ##
  mount_uploader :avatar, ImageUploader
end
