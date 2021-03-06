require "administrate/base_dashboard"

class EventDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    organizer: Field::BelongsTo,
    sport: Field::BelongsTo,
    club: Field::BelongsTo,
    banner_attachment: Field::HasOne,
    event_sponsors: Field::HasMany,
    sponsors: Field::HasMany,
    banner_blob: Field::HasOne,
    photo_attachment: Field::HasOne,
    photo_blob: Field::HasOne,
    id: Field::Number,
    address: Field::String,
    city: Field::String,
    postal_code: Field::String,
    start_date: Field::DateTime,
    end_date: Field::DateTime,
    name: Field::String,
    image_url: Field::String,
    description: Field::Text,
    price: Field::Number,
    is_free: Field::Boolean,
    user_id: Field::Number,
    website: Field::String,
    event_type: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = %i[
    id
    name
    start_date
    end_date
    city
    event_type
    
    sponsors
    sport
    club
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = %i[
    organizer
    sport
    club
    banner_attachment
    banner_blob
    photo_attachment
    photo_blob
    id
    address
    city
    postal_code
    start_date
    end_date
    name
    image_url
    description
    price
    is_free
    event_type
    user_id
    website
    created_at
    updated_at
    sponsors
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = %i[
    organizer
    sport
    club
    address
    city
    postal_code
    start_date
    end_date
    name
    description
    price
    is_free
    website
    sponsors
    event_type
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

  # Overwrite this method to customize how events are displayed
  # across all pages of the admin dashboard.
  #
  def display_resource(event)
    "#{event.name}"
  end
end
