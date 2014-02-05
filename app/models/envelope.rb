class Envelope < ActiveRecord::Base
  before_save :defaults
  has_many :denominations, dependent: :destroy
  belongs_to :budget
  
  delegate :ones, :fives, :tens, :twenties, to: :denominations

  def defaults
    self.current_amount = 0
    self.additional_amount = 0
  end
end
