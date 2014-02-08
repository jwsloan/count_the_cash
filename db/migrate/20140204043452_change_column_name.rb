# rename amount to value
class ChangeColumnName < ActiveRecord::Migration
  def change
    rename_column :denominations, :amount, :value
  end
end
