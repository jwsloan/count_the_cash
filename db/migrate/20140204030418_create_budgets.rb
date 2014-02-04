class CreateBudgets < ActiveRecord::Migration
  def change
    create_table :budgets do |t|
      t.date :date
      t.integer :starting_amount

      t.timestamps
    end
  end
end
