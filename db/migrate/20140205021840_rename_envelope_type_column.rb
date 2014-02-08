# Not using STI for Envelope, so couldn't use :type column
class RenameEnvelopeTypeColumn < ActiveRecord::Migration
  def change
    rename_column :envelopes, :type, :category
  end
end
