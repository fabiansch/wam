class AddIWouldLikeToLabels < ActiveRecord::Migration
  def change
    change_table :profiles do |t|
      t.boolean :meet_for_coffee
      t.boolean :attend_meetings
      t.boolean :be_mentor
      t.string :own_like_string
    end
  end
end
