class AddColumnToClubs < ActiveRecord::Migration[6.1]
  def change
    add_column :clubs, :phone_number, :string
  end
end
