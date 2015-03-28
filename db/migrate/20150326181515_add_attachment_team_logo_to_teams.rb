class AddAttachmentTeamLogoToTeams < ActiveRecord::Migration
  def self.up
    change_table :teams do |t|
      t.attachment :team_logo
    end
  end

  def self.down
    remove_attachment :teams, :team_logo
  end
end
