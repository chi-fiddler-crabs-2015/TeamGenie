class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string      :name
      t.string      :activity
      t.belongs_to  :captain

      t.timestamps null: false
    end
  end
end
