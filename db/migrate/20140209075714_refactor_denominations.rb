# We're going to use value for inheritance, so there
# is no longer a need to store singular_name here.
# We'll add a count in envelope. This will allow one db command per
# change of count. 
class RefactorDenominations < ActiveRecord::Migration
  def change
    remove_column :denominations, :singular_name
    add_column :denominations, :count_in_envelope, :integer
  end
end
