class AddColumunsToClubs < ActiveRecord::Migration[6.1]
  def change
    add_column :clubs, :facebook_url, :string
    add_column :clubs, :twitter_url, :string
    add_column :clubs, :instagram_url, :string
    add_column :clubs, :key_number, :text
    add_column :clubs, :description, :text
    add_column :clubs, :information, :text
  end
end
