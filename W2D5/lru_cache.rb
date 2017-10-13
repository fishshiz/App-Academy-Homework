class LRUCache
    def initialize(size)
      @size = size
      @hash = []
    end

    def count
      # returns number of elements currently in cache
      @hash.count
    end

    def add(el)
      # adds element to cache according to LRU principle
      @hash.delete(el) if @hash.include?(el)
      if @hash.count < @size
        @hash << el
      else
        @hash.shift
        @hash << el
      end
    end

    def show
      # shows the items in the cache, with the LRU item first
      return @hash.reverse
    end

    private
    # helper methods go here!
  end
