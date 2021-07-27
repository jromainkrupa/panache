class Club < ApplicationRecord
  belongs_to :admin, class_name: "User", foreign_key: "user_id"
  has_many :events, dependent: :destroy
  has_many :club_sports
  has_many :sports, through: :club_sports

  include PgSearch::Model
  pg_search_scope :search_by_city_and_name, against: [:city, :name], using: {tsearch: {prefix: true}}

  validates :name, presence: true
  validates :address, presence: true
  validates :city, presence: true
  validates :postal_code, presence: true

  after_create :set_user_as_club_admin

  private

  def set_user_as_club_admin
    self.admin.update(is_club_admin: true)
  end

end
