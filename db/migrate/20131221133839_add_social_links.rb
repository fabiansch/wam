class AddSocialLinks < ActiveRecord::Migration
  def change
    change_table(:profiles) do |t|
      t.string :company
      t.string :twitter_handle
      t.string :xing_handle
      t.string :linkedin_handle
    end
  end
end
