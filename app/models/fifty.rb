# @author John Sloan
# $50 bill
class Fifty < Denomination
  def default
    self.value = 50
    super
  end
end
