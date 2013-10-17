class AddRankingMatches < ActiveRecord::Migration
  def change
    add_column :matches, :ranking, :integer
  end
end
