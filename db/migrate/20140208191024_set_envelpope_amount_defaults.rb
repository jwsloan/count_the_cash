class SetEnvelpopeAmountDefaults < ActiveRecord::Migration
  def change
    change_column :envelopes, :current_amount, :integer, default: 0
    change_column :envelopes, :additional_amount, :integer, default: 0
  end
end
