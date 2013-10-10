class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.integer :home_team_id, null: false
      t.integer :away_team_id, null: false
      t.date :schedule_date, null: false
      t.string :half_time, default: '0-0'
      t.string :full_time, default: '0-0'

      t.timestamps
    end
  end
end
