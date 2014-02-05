class AddBudgetIdToEnvelopes < ActiveRecord::Migration
  def change
    add_column :envelopes, :budget_id, :integer
    add_index :envelopes, :budget_id
  end
end
