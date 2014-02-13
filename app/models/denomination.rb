# @author John Sloan
# Individual monitary denomination classes extend this class.
# Each denomination only needs to keep track of the envelope it
# is in, the count of itself in that envelope, and its singular name.
# The value can just be part of the class.
class Denomination < ActiveRecord::Base
  belongs_to :envelope
  self.inheritance_column = :singular_name

  # These scpopes are plurally named, but grab one object on purpose.
  # This allows user such as envelope.ones.count_in_envelope. That reads
  # better than envelope.one.count_in_envelope.
  scope :ones, -> { find_by(:singular_name => "One") }
  scope :fives, -> { find_by(:singular_name => "Five") }
  scope :tens, -> { find_by(:singular_name => "Ten") }
  scope :twenties, -> { find_by(:singular_name => "Twenty") }

  before_save :default

  def default;  end

  def self.available_values
    [20, 10, 5, 1]
  end
end
