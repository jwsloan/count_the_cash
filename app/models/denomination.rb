# @author John Sloan
# Individual monitary denomination classes extend this class.
# Each denomination onl needs to keep track of the envelope it
 # is in, the count of itself in that envelope, and its singular name
#. The value can just be part of the class. 
class Denomination < ActiveRecord::Base
  belongs_to :envelope
  self.inheritance_column = :singular_name

  scope :ones, -> { where :singular_name => "One" }
  scope :fives, -> { where :singular_name => "Five" }
  scope :tens, -> { where :singular_name => "Ten" }
  scope :twenties, -> { where :singular_name => "Twenty" }
  scope :fifties, -> { where :singular_name => "Fifty" }

  def plural_name
    if singular_name.last == "y"
      "#{singular_name[0...-1]}ies"
    else
      "#{singular_name}s"
    end
  end

  after_initialize :default

  def default; 
    self.singular_name = self.class.to_s.capitalize
  end
end

