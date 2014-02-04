class CreateDenominations < ActiveRecord::Migration
  def change
    create_table :denominations do |t|
      t.string :singular_name
      t.string :plural_name
      t.integer :amount

      t.timestamps
    end
  end
end
