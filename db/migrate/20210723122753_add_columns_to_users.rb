class AddColumnsToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :phone_number, :string
    add_column :users, :is_admin, :boolean
    add_column :users, :is_club_owner, :boolean
    add_column :users, :is_event_admin, :boolean
  end
end
