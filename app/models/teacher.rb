class Teacher < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # has_secure_password
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :courses

  # def self.authenticate( password)
  #   #user = User.find_by_name(name)
  
  #   if user.find_by_password(password)#match_password(password)
  #     return true
  #   else
  #     return false
  #   end
  # end
end
