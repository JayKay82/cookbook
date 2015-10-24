class User < ActiveRecord::Base
  has_many :instructions

  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable
end
