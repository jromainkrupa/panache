class Sport < ApplicationRecord
  has_many :club_sports
  has_many :clubs, through: :club_sports
  has_many :events, dependent: :destroy
  validates :name, presence: true
end
