class MakeAboutmeText < ActiveRecord::Migration
  def change
    change_column :profiles, :aboutme, :text
  end
end
