class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.string :home_team, null: false
      t.string :away_team, null: false
      t.date :schedule_date, null: false
      t.integer :home_score, default: 0
      t.integer :away_score, default: 0

      t.timestamps
    end
  end
end
