class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.string :address
      t.string :city
      t.string :postal_code
      t.datetime :start_date
      t.datetime :end_date
      t.string :name
      t.references :sport, null: false, foreign_key: true
      t.references :club, null: true, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.string :event_website

      t.timestamps
    end
  end
end
