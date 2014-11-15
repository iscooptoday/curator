class User < ActiveRecord::Base
	
  has_many:topics
  acts_as_follower
  acts_as_liker
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


end
