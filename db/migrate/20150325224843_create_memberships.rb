class CreateMemberships < ActiveRecord::Migration
  def change
    create_table :memberships do |t|
      t.belongs_to  :player
      t.belongs_to  :team

      t.timestamps null: false
    end
  end
end
