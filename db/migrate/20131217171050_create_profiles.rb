class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :name
      t.string :job
      t.string :city
      t.string :aboutme
      t.string :email

      t.timestamps
    end
  end
end