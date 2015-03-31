class AddFieldsToTeams < ActiveRecord::Migration
  def change
    add_column  :teams, :dues, :float, default: 0
  end
end
