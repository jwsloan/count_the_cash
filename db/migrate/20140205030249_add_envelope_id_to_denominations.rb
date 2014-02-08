# Fix envelope/denomination association
class AddEnvelopeIdToDenominations < ActiveRecord::Migration
  def change
    add_column :denominations, :envelope_id, :integer
    add_index :denominations, :envelope_id
  end
end
