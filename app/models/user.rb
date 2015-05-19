class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable :recoverable, :trackable
  devise :database_authenticatable, :registerable, 
          :rememberable, :validatable
end
