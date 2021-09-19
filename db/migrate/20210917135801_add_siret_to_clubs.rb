class AddSiretToClubs < ActiveRecord::Migration[6.1]
  def change
    add_column :clubs, :siret, :string
  end
end
