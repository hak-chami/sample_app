class AddAgeToContact < ActiveRecord::Migration[5.1]
  def change
    add_column :contacts, :age, :integer
  end
end
