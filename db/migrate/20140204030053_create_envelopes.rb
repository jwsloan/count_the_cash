class CreateEnvelopes < ActiveRecord::Migration
  def change
    create_table :envelopes do |t|
      t.string :name
      t.string :type
      t.integer :current_amount
      t.integer :additional_amount
      t.integer :new_amount

      t.timestamps
    end
  end
end
