class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable :recoverable, :trackable
  devise :database_authenticatable, :registerable, 
          :rememberable, :validatable

  after_create :user_defaults

  def user_defaults	
  	if self.admin == nil
  		self.admin = false
  		self.save
  	end
  end
end
