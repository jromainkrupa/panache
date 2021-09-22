class CreateSponsors < ActiveRecord::Migration[6.1]
  def change
    create_table :sponsors do |t|
      t.string :name
      t.string :image_url
      t.string :sponsor_url

      t.timestamps
    end
  end
end
