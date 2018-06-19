class CreateBoats < ActiveRecord::Migration[5.2]
  def change
    create_table :boats do |t|
      t.integer :guests
      t.string :boat_type
      t.string :address
      t.integer :price_day
      t.text :description
      t.string :name
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
