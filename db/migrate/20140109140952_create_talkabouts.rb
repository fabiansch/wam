class CreateTalkabouts < ActiveRecord::Migration
  def change
    create_table :talkabouts do |t|
      t.string :content
      t.boolean :check
      t.integer :profile_id

      t.timestamps
    end
  end
end
