class RemovePluralNameFromDenomination < ActiveRecord::Migration
  def change
    remove_column :denominations, :plural_name
  end
end
