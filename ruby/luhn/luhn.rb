module Luhn

  def self.valid?(str)
    # non-numbers are invalid
    return false if str.match?(/[^\s\d]/)

    # clean up, convert to array, and reverse for parsing
    ints = str.delete(" \t\r\n").split(//).map(&:to_i).reverse

    # single-digit numbers are invalid
    return false if ints.length < 2

    # calculate
    luhn_sum = ints.each_with_index.reduce(0) { |sum, pair| 
      int, i = pair
      double = ->(x) { x = x * 2; x > 9 ? x - 9 : x }
      sum + (!i.even? ? double.call(int) : int)
    }
    luhn_sum % 10 == 0
  end

end
