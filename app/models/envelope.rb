# @author John sloan
# Represents a physical envelope for cash budgeting.
class Envelope < ActiveRecord::Base
  validates_presence_of :category, :name, :current_amount, :additional_amount
  validates_length_of :category, :name, :maximum => 25
  validates :current_amount, :additional_amount,
            :numericality => { :only_integer => true,
                               :greater_than_or_equal_to => 0,
                               :less_than_or_equal_to => 1000,
                               :message => "Whole dollar amounts <= 1000 only."
                             }

  before_save :defaults
  has_many :denominations, :dependent => :destroy
  belongs_to :user

  delegate :ones, :fives, :tens, :twenties, :to => :denominations

  def defaults
    self.current_amount ||= 0
    self.additional_amount ||= 0
  end
end
