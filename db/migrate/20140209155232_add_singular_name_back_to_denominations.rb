class AddSingularNameBackToDenominations < ActiveRecord::Migration
  def change
    add_column :denominations, :singular_name, :string
  end
end
