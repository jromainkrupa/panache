class Event < ApplicationRecord
  belongs_to :sport
  belongs_to :club
  belongs_to :user
end
