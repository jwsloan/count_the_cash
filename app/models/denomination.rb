# @author John Sloan
# Individual monitary denomination classes extend this class.
# Each denomination only needs to keep track of the envelope it
# is in, the count of itself in that envelope, and its singular name.
# The value can just be part of the class.
class Denomination < ActiveRecord::Base
  belongs_to :envelope
  self.inheritance_column = :singular_name

  scope :ones, -> { find_by(:singular_name => "One") }
  scope :fives, -> { find_by(:singular_name => "Five") }
  scope :tens, -> { find_by(:singular_name => "Ten") }
  scope :twenties, -> { find_by(:singular_name => "Twenty") }

  def plural_name
    if singular_name.last == "y"
      "#{singular_name[0...-1]}ies"
    else
      "#{singular_name}s"
    end
  end

  before_save :default

  def default;  end
end
