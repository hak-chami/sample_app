class RenameImageToMictoposts < ActiveRecord::Migration[5.1]
  def change
    rename_column :microposts, :image, :picture
  end
end
