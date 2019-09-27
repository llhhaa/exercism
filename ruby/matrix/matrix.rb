class Matrix

  attr_accessor :rows, :columns

  def initialize(string)
    @rows = parse_rows(string)
    @columns = parse_cols(string)
  end

  private

    def parse_rows(string)
      string.each_line.map { |row_str| row_str.split.map(&:to_i) }
    end

    def parse_cols(string)
      parse_rows(string).transpose
    end
end
