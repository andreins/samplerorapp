class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  before_save { self.email = email.downcase }
  


  devise :database_authenticatable, :registerable, :rememberable, :authentication_keys => [:username]
end
