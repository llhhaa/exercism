class HighScores
  attr_accessor :scores

  def initialize(scores)
    @scores = scores
  end

  def latest
    @scores.last
  end

  def personal_best
    @scores.reduce { |memo, i|
      memo > i ? memo : i
    }
  end

  def personal_top_three
    @scores.sort{|x,y| y <=> x}[0..2]
  end
end
