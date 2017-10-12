class Stack

  def initialize
    @stack = []
  end

  def add(el)
    @stack << el
  end

  def remove
    @stack.pop
  end

  def show
    @stack.dup
  end

end

class Queue

  def initialize
    @queue = []
  end

  def enqueue(el)
    @queue.unshift(el)
  end

  def dequeue
    @queue.pop
  end

  def show
    @queue.dup
  end

end

class Map

def initialize
  @map = []
end

  def assign(k, v)
    key_location = @map.index { |pair| pair[0] == k }
    key_location ? @map[key_location][1] == v : @map << [k, v]
  end

  def lookup(k)
    @map.each { |pair| return pair if pair[0] == k}
  end

  def remove(k)
    @map.reject! { |pair| pair[0] == k }
  end

  def show
    deep_dups(@map)
  end

  private

  def deep_dups(arr)
    arr.map { |pair| pair.is_a?(Array) ? deep_dups(pair) : pair }
  end

end
