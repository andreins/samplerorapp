class User < ActiveRecord::Base
  VALID_USERNAME = /\A[A-Za-z]{1}[A-Za-z0-9]+\z/i
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  before_save {  self.email = email.downcase  }
  validates :username, presence: true, length: {  maximum: 55  },
                       format: { with: VALID_USERNAME }, uniqueness: { case_sensititve: false }

  validates :email, presence: true, length: { maximum: 255}, uniqueness: { case_sensitive: true },
                    format: { with: VALID_EMAIL_REGEX }



  devise :database_authenticatable, :registerable, :rememberable, :authentication_keys => [:username]
end
