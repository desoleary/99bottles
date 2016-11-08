require 'byebug'
require 'active_support'
require 'active_support/core_ext'

class Bottles
  def song
    verses(99, 0)
  end

  def verses(starting, ending)
    starting.downto(ending).map {|i| verse(i)}.join("\n")
  end

  def verse(number)
    if number > 1
      <<-VERSE
#{number} #{pluralize_bottle(number)} of beer on the wall, #{number} #{pluralize_bottle(number)} of beer.
Take one down and pass it around, #{number-1} #{pluralize_bottle(number-1)} of beer on the wall.
      VERSE
    elsif number == 1
      <<-VERSE
1 bottle of beer on the wall, 1 bottle of beer.
Take it down and pass it around, no more bottles of beer on the wall.
      VERSE
    elsif number == 0
      <<-VERSE
No more bottles of beer on the wall, no more bottles of beer.
Go to the store and buy some more, 99 bottles of beer on the wall.
      VERSE
    end
  end

  def pluralize_bottle(count)
    'bottle'.pluralize(count)
  end
end