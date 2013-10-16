class AddImageToCLub < ActiveRecord::Migration
  def change
    add_column :clubs, :image_url, :string
  end
end
