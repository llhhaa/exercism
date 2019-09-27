module Isogram
  def Isogram.isogram?(s)
    s.downcase.match(/(\w).*\1/).nil?
  end
end
