module Hamming
  def self.compute(s1, s2)
    raise ArgumentError if s1.size != s2.size
    ham = 0
    s1.split("").each_with_index {| c, i |
      ham += 1 if c != s2[i]
    }
    return ham
  end
end
