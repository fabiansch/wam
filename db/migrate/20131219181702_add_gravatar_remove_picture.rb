class AddGravatarRemovePicture < ActiveRecord::Migration
  def change
    add_column :profiles, :gravatar_email, :string
    revert AddAttachmentImageToProfiles
  end
end
