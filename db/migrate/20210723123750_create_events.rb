class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.string :address
      t.string :city
      t.string :postal_code
      t.datetime :start_date
      t.datetime :end_date
      t.string :name
      t.string :image_url
      t.text :description
      t.integer :price
      t.boolean :is_free
      t.references :sport, null: false, foreign_key: true
      t.references :club, null: true, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.string :website

      t.timestamps
    end
  end
end
