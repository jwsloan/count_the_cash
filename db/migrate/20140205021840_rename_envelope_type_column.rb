class RenameEnvelopeTypeColumn < ActiveRecord::Migration
  def change
    rename_column :envelopes, :type, :category
  end
end
