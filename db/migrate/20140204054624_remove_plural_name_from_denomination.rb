# remove plural_name. No reason to store this in the database.
class RemovePluralNameFromDenomination < ActiveRecord::Migration
  def change
    remove_column :denominations, :plural_name
  end
end
