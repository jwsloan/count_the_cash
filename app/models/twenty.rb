# @author John Sloan
# $20 bill
class Twenty < Denomination
  def plural_name
    'Twenties'
  end

  def default
    self.value = 20
  end
end
