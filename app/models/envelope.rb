class Envelope < ActiveRecord::Base
  has_many :denominations
  belongs_to :budget
  
  delegate :ones, :fives, :tens, :twenties, to: :denominations
end
