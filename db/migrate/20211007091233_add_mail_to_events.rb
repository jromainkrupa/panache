class AddMailToEvents < ActiveRecord::Migration[6.1]
  def change
    add_column :events, :mail, :string
  end
end
