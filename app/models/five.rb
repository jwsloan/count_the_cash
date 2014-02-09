# @author John sloan
# $5 bill
class Five < Denomination
  def default
    self.value = 5
    super
  end
end

