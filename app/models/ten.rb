# @author John Sloan
# $10 bill
class Ten < Denomination
  def default
    self.value = 10
    super
  end
end

