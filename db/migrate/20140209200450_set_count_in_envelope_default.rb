class SetCountInEnvelopeDefault < ActiveRecord::Migration
  def change
    change_column :denominations, :count_in_envelope, :integer, :default => 0
  end
end
