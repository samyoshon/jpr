class RemoveConfirmationAtFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :confirmation_at, :date
  end
end
