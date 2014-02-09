# @author John Sloan
# Individual monitary denomination classes extend this class.
# Each denomination onl needs to keep track of the envelope it
 # is in, the count of itself in that envelope, and its singular name
#. The value can just be part of the class. 
class Denomination < ActiveRecord::Base
  belongs_to :envelope
  self.inheritance_column = :value

  scope :ones, -> { where :value => 1 }
  scope :fives, -> { where :value => 5 }
  scope :tens, -> { where :value => 10 }
  scope :twenties, -> { where :value => 20 }
  scope :fifties, -> { where :value => 50 }

  def plural_name
    "#{singular_name}s"
  end

  before_save :default

  def default;  end

  def singular_name; 
    self.class.to_s.capitalize
  end
end
