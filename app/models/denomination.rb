class Denomination < ActiveRecord::Base
  belongs_to :envelope
  self.inheritance_column = :singular_name

  scope :ones, -> { where(singular_name: 'One') }
  scope :fives, -> { where(singular_name: 'Five') } 
  scope :tens, -> { where(singular_name: 'Ten') }
  scope :twenties, -> { where(singular_name: 'Twenty') }
end
