class CreateClubs < ActiveRecord::Migration
  def change
    create_table :clubs do |t|
      t.string :name, null: false
      t.integer :league_id, null: false
      t.string :location

      t.timestamps
    end
  end
end
