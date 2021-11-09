class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # attr_accessible :email,  :admin
   
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         has_many :imaginnovates
end
