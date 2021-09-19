class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :first_name, presence: true
  validates :last_name, presence: true, uniqueness: { scope: :first_name}
  validates :email, presence: true, uniqueness: true

  has_one :club, dependent: :destroy
  has_many :events, through: :club
  has_one_attached :avatar

  def full_name
    "#{first_name.capitalize} #{last_name.upcase}"
  end
end
