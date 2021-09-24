class AddColumnToSports < ActiveRecord::Migration[6.1]
  def change
    add_column :sports, :is_highlight, :boolean
  end
end
