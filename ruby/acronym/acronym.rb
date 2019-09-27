class Acronym
  def self.abbreviate(str)
    # split by whitespace or punctuation
    words = str.split(/[ ,\-,\,]/)
    
    # filter out non-alphabetic words (for subsequent delimiters)
    words = words.reject{|w| w.match(/^[A-Za-z]+$/).nil?}

    # reduce to the first char of each word, uppercase it
    words.reduce("") { |memo, word| 
      memo << word[0] }.upcase
  end
end
