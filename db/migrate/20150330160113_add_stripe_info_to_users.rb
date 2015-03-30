class AddStripeInfoToUsers < ActiveRecord::Migration
  def change
    add_column :users, :publishable_key, :string
    add_column :users, :secret_key, :string
    add_column :users, :stripe_user_id, :string
    add_column :users, :currency, :string
    add_column :users, :stripe_account_type, :string
    add_column :users, :stripe_account_status, :text, default: '{}'
  end
end
