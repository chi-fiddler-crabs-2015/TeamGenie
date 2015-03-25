class CreateRsvps < ActiveRecord::Migration
  def change
    create_table :rsvps do |t|
      t.belongs_to  :game
      t.belongs_to  :membership
      t.string      :attending

      t.timestamps null: false
    end
  end
end
