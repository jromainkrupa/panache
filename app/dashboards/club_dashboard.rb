require "administrate/base_dashboard"

class ClubDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    admin: Field::BelongsTo,
    events: Field::HasMany,
    club_sports: Field::HasMany,
    sports: Field::HasMany,
    id: Field::Number,
    name: Field::String,
    address: Field::String,
    image_url: Field::String,
    website: Field::String,
    city: Field::String,
    postal_code: Field::String,
    user_id: Field::Number,
    mail: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    facebook_url: Field::String,
    twitter_url: Field::String,
    instagram_url: Field::String,
    number_key: TrixField,
    description: Field::Text,
    information: Field::Text,
    phone_number: Field::String,
    siret: Field::String,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = %i[
    name
    address
    city
    admin
    sports
    events
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = %i[
    id
    name
    address
    city
    postal_code
    mail
    website
    updated_at
    facebook_url
    twitter_url
    instagram_url
    number_key
    description
    information
    phone_number
    siret
    admin
    events
    sports
    created_at
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = %i[
    name
    address
    city
    postal_code
    website
    mail
    facebook_url
    twitter_url
    instagram_url
    number_key
    description
    information
    phone_number
    siret
    admin
    sports
  ].freeze

  # COLLECTION_FILTERS
  # a hash that defines filters that can be used while searching via the search
  # field of the dashboard.
  #
  # For example to add an option to search for open resources by typing "open:"
  # in the search field:
  #
  #   COLLECTION_FILTERS = {
  #     open: ->(resources) { resources.where(open: true) }
  #   }.freeze
  COLLECTION_FILTERS = {}.freeze

  # Overwrite this method to customize how clubs are displayed
  # across all pages of the admin dashboard.
  #
  def display_resource(club)
    "#{club.name}"
  end
end
