class AddRankingMatches < ActiveRecord::Migration
  def change
    remove_column :matches, :user_id, :integer
    remove_column :matches, :rating, :integer
    add_column :matches, :ranking, :integer
  end
end
