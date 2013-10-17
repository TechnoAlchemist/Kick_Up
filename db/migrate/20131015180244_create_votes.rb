class CreateVotes < ActiveRecord::Migration
  def up
    
    create_table :votes do |t|
      t.integer :value, null: false
      t.integer :user_id, null: false
      t.integer :match_id, null: false

      t.timestamps
    end
  end

  def down
    drop_table :votes
  
  end
end
