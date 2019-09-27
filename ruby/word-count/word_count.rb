class Phrase
  attr_accessor :phrase

  def initialize(phrase)
    @phrase = phrase
  end

  def word_count
    words = @phrase.scan(/\b[\w']+\b/)
    words.each_with_object(Hash.new(0)) { |word, hash|
      hash[word.downcase] += 1
    }
  end

end
