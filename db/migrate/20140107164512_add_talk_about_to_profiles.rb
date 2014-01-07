class AddTalkAboutToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :talk_about_string_1, :string
    add_column :profiles, :talk_about_string_2, :string
    add_column :profiles, :talk_about_string_3, :string
    add_column :profiles, :talk_about_string_4, :string
    add_column :profiles, :talk_about_string_5, :string
    add_column :profiles, :talk_about_boolean_1, :boolean
    add_column :profiles, :talk_about_boolean_2, :boolean
    add_column :profiles, :talk_about_boolean_3, :boolean
    add_column :profiles, :talk_about_boolean_4, :boolean
    add_column :profiles, :talk_about_boolean_5, :boolean
  end
end
