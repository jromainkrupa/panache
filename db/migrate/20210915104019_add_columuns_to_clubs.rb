class AddColumunsToClubs < ActiveRecord::Migration[6.1]
  def change
    add_column :clubs, :facebook_url, :string
    add_column :clubs, :twitter_url, :string
    add_column :clubs, :instagram_url, :string
    add_column :clubs, :extra_detail, :text
    add_column :clubs, :key_number, :text
  end
end
