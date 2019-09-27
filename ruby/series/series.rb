class Series
  attr_accessor :series_str

  def initialize(series_str)
    @series_str = series_str
  end

  def slices(n)
    raise ArgumentError if (n > series_str.size)
    i = 0
    b = []
    b << series_str[(i+=1) - 1, n] while i <= (series_str.size - n)
    return b
  end
end
