class AddGravatar < ActiveRecord::Migration
  def change
    add_column :profiles, :gravatar_email, :string
  end
end
