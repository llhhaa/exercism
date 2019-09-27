class Scrabble

  TILES = {
    1 => [ 'a', 'e', 'i', 'o', 'u', 'l', 'n', 'r', 's', 't' ],
    2 => [ 'd', 'g' ],
    3 => [ 'b', 'c', 'm', 'p' ],
    4 => [ 'f', 'h', 'v', 'w', 'y' ],
    5 => [ 'k' ],
    8 => [ 'j', 'x' ],
    10 => [ 'q', 'z' ]
  }

  def initialize(word)
    @word = word
  end

  def score
    @word ||= ''
    @word.downcase.each_char.map{|c| score_char(c)}.sum
  end

  def self.score(word)
    new(word).score
  end

  private

  def score_char(c)
    TILES.keys.each {|k|
      return k if TILES[k].include?(c)
    }
    0
  end
end

