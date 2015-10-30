class User < ActiveRecord::Base
  has_many :recipes, dependent: :destroy

  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :name, presence: true, length: { maximum: 15 }

  def admin?
    role == 'admin'
  end
end
