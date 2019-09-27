class Tournament

  WIN_POINTS = 3
  DRAW_POINTS = 1
  LOSS_POINTS = 0
  INFO_FORMAT = "%-31s| %2s | %2s | %2s | %2s | %2s\n"

  # team subclass
  Team = Struct.new(:name, :won, :tied, :lost) do
    def points
      (won * WIN_POINTS) + (tied * DRAW_POINTS)
    end
    def report
      [
        name,
        won + tied + lost, # matches played
        won,
        tied,
        lost,
        points
      ]
    end
  end

  def initialize(input)
    @input = input
    @teams = {}
  end

  def self.tally(input)
    new(input).tally
  end

  def tally
    # split input into matches and tally into @teams
    @input.split("\n").each do |line|
      items = line.strip.split(';')
      tally_match(items) if items.size == 3
    end

    # init table and add header
    table = ""
    table << INFO_FORMAT % ["Team", "MP", "W", "D", "L", "P"]

    # add team info to table
    # sort descending by points, then a-z by name
    @teams.sort_by { |n, t| [-t.points, n] }.each do |_, team|
      table << INFO_FORMAT % team.report
    end

    table
  end

  # parses match result and add win/draw/loss to teams accordingly
  # creates teams in hash if either doesn't yet exist
  def tally_match(line)
    first, second, result = line
    @teams[first] ||= Team.new(first, 0, 0, 0)
    @teams[second] ||= Team.new(second, 0, 0, 0)

    case result
    when 'win'
      @teams[first][:won] += 1
      @teams[second][:lost] += 1
    when 'loss'
      @teams[first][:lost] += 1
      @teams[second][:won] += 1
    when 'draw'
      @teams[first][:tied] += 1
      @teams[second][:tied] += 1
    end
  end

end
