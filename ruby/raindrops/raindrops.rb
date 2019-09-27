module Raindrops
  def self.convert(num)
    ppp = String.new
    ppp << "Pling" if num % 3 == 0
    ppp << "Plang" if num % 5 == 0
    ppp << "Plong" if num % 7 == 0
    return num.to_s if ppp.empty?
    return ppp
  end
end
