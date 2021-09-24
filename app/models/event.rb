class Event < ApplicationRecord
  belongs_to :organizer, class_name: "User", foreign_key: "user_id"
  belongs_to :sport, optional: true
  belongs_to :club, optional: true
  has_one_attached :banner
  has_one_attached :photo
  has_many :event_sponsors
  has_many :sponsors, through: :event_sponsors

  
  validates :name, presence: true
  validates :address, presence: true
  #validates :city, presence: true
  #validates :postal_code, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  
  validate :end_date_after_start_date
  #validate :start_date_after_now

  include PgSearch::Model
  pg_search_scope :search, 
    against: [:description, :name, :postal_code, :city], 
    associated_against: {
      sport: [:name]
    },
    using: {
      tsearch: { prefix: true }
    }
  
 
  def set_club_admin_as_organizer
    if club.present?
      self.organizer = club.admin
    end
  end

  def copy_club_address
    if club.present?
      self.address = club.address
      self.postal_code = club.postal_code
      self.city = club.city
    end
  end

  def copy_club_infos
    if club.present?
      set_club_admin_as_organizer
      copy_club_address
    end
  end

  private

  def end_date_after_start_date
    return if end_date.blank? || start_date.blank?

    if end_date < start_date
      errors.add(:end_date, "must be after the start date")
    end
  end

  def start_date_after_now
    return if start_date.blank?

    if start_date < Time.zone.now
      errors.add(:start_date, "must be in the future")   
    end
  end
end
