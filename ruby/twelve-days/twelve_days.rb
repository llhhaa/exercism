class TwelveDays
  GIFTS = {
    first: 'a Partridge in a Pear Tree',
    second: 'two Turtle Doves',
    third: 'three French Hens',
    fourth: 'four Calling Birds',
    fifth: 'five Gold Rings',
    sixth: 'six Geese-a-Laying',
    seventh: 'seven Swans-a-Swimming',
    eighth: 'eight Maids-a-Milking',
    ninth: 'nine Ladies Dancing',
    tenth: 'ten Lords-a-Leaping',
    eleventh: 'eleven Pipers Piping',
    twelfth: 'twelve Drummers Drumming'
  }

  def self.song
    song = ""

    GIFTS.each_key.reduce(".") { |m, k|

      # add 'and' on second verse
      m = "and " << m if k == :second

      # join by comma unless first verse
      joiner = (k == :first) ? "" : ", "

      # join new gift to list
      gifts = [GIFTS[k], m].join(joiner)
      
      # add verse to song
      song += "On the #{k.to_s} day of Christmas my true love gave to me: #{gifts}\n"
      song << "\n" if not k == :twelfth

      # send gift list to next verse
      gifts
    }

    return song
  end
end
