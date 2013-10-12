class RemoveUsername < ActiveRecord::Migration
  def change
    remove_column :users, :username, :string, null: false, default: ""
    add_column :users, :username, :string, default: ""

  end
end
