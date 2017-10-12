def sluggish_octopus(arr)
  biggest_fish = ''
  arr.each do |fish1|
    arr.each do |fish2|
      biggest_fish = fish1 if fish1.length > fish2.length
      biggest_fish = fish2 if fish1.length < fish2.length
    end
  end
  biggest_fish
end


class Array
def dominant_octopus(&prc)
  prc ||= Proc.new { |x, y| x <=> y }

  return self if self.length <= 1

  mid = self.length

  left = self.take(mid).dominant_octopus(&prc)
  right = self.drop(mid).dominant_octopus(&prc)

  Array.merge(left, right, &prc)

end

private
def merge(left, right, &prc)
  output = []
  until left.empy? || right.empty?
    case prc.call(left, right)
    when -1
      output << left.shift
    when 0
      output << left.shift
    when 1
      output << right.shift
    end
  end
  output += left
  output += right
  output
end
end

def clever_octopus(arr)
  biggest_fish = ''
  arr.each do |fish|
    biggest_fish = fish if fish.length > biggest_fish.length
  end
    biggest_fish
end



def slow_dance(target, arr)
  output = 0
  arr.each_with_index do |tile, tentacle|
    output = tentacle if target == tile
  end
  output
end

MOVES = {
  "up" => 0,
  "right-up" => 1,
  "right" => 2,
  "right-down" => 3,
  "down" => 4,
  "left-down" => 5,
  "left" => 6,
  "left-up" => 7,
}
def fast_dance(target, arr)
  MOVES[target]
end
