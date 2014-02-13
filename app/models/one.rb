# @author John Sloan
# $1 bill
class One < Denomination
  def default
    self.value = 1
  end
end
