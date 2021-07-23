class CreateClubs < ActiveRecord::Migration[6.1]
  def change
    create_table :clubs do |t|
      t.string :name
      t.string :address
      t.string :image_url
      t.string :website
      t.string :city
      t.string :postal_code
      t.references :user, null: false, foreign_key: true
      t.string :mail

      t.timestamps
    end
  end
end
