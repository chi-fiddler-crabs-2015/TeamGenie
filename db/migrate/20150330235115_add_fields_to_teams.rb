class AddFieldsToTeams < ActiveRecord::Migration
  def change
    add_column  :teams, :dues, :float, default: 0
    add_column  :teams, :paid_dues, :float, default: 0
  end
end
