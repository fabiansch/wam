class AddCheckboxToProfile < ActiveRecord::Migration
  def change
    add_column :profiles, :own_like_boolean, :boolean
  end
end
