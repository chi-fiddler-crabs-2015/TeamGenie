class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string   :name
      t.string   :address
      t.string   :city
      t.string   :state
      t.integer  :zip_code
      t.text     :directions

      t.timestamps null: false
    end
  end
end
