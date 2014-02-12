class AddUserIdToEnvelopes < ActiveRecord::Migration
  def change
    add_column :envelopes, :user_id, :integer
    add_index :envelopes, :user_id
    remove_column :envelopes, :budget_id
  end
end
