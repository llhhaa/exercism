class Clock
  attr_accessor :hour, :minute

  def initialize(hour: 0, minute: 0)
    @hour = calcH(hour, minute)
    @minute = calcM(minute)
  end

  def +(clock)
    clockPartial('+', clock.hour, clock.minute)
  end

  def -(clock)
    clockPartial('-', clock.hour, clock.minute)
  end

  def ==(clock)
    return true if @hour == clock.hour && @minute == clock.minute
  end

  def to_s
    "%02d:%02d" % [@hour, @minute]
  end

  private

    def clockPartial(f, h, m)
      Clock.new(
        hour: @hour.send(f, calcH(h, m)),
        minute: @minute.send(f, calcM(m))
      )
    end

    def calcH(h, m)
      (h + (m / 60)) % 24
    end

    def calcM(m)
      m % 60
    end
end
