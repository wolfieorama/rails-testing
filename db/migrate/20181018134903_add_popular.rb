class AddPopular < ActiveRecord::Migration[5.2]
  def change
    add_column :albums, :popular, :boolean
  end
end
