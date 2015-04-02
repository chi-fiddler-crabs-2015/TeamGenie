class AddFieldsToMemberships < ActiveRecord::Migration
  def change
    add_column :memberships, :paid, :boolean, :default => false
    add_column :memberships, :amount_owed, :float, default: 0, scale: 2
    add_column :memberships, :amount_paid, :float, default: 0, scale: 2
  end
end
