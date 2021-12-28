class User < ApplicationRecord
  has_many :bugs, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  
         validates :name, presence: true, length: {maximum: 50}
         VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
         validates :email, presence: true, length: {maximum: 244}, format: {with: VALID_EMAIL_REGEX}, uniqueness: true
         validates :password, presence: true, length: {minimum: 6}, allow_nil: true
         validates :role, presence: true
        
end
