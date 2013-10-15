class AddVoteCountMatches < ActiveRecord::Migration
  def change
    add_column :matches, :vote_count, :integer, default: 0, null: false
  end
end
