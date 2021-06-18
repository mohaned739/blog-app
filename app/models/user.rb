class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         validates :name, :email, :password, presence: true
         validates :email, confirmation: { case_sensitive: false }, uniqueness: true   
         validates :password ,length: {minimum: 8}
         has_many :posts
         has_many :comments 
end
