class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.belongs_to  :team
      t.date        :game_time
      t.belongs_to  :location

      t.timestamps null: false
    end
  end
end
