class AddGravatarRemovePicture < ActiveRecord::Migration
  def change
    add_column :profiles, :gravatar_email, :string
    drop_attached_file :profiles, :image    
  end
end
