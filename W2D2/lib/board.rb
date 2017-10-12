class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @name1 = name1
    @name2 = name2
    @cups = Array.new(14) { Array.new(0, 0) }
    @cups.each_with_index do |cup, idx|
      next if idx == 6 || idx == 13
      until cup.length == 4
        cup << :stone
      end
    end
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
  end

  def valid_move?(start_pos)
    raise "Invalid starting cup" if !@cups.include?(start_pos)
  end

  def make_move(start_pos, current_player_name)
    handful = []
    until @cups[start_pos].empty?
      handful << @cups[start_pos].pop
    end

    i = start_pos
    until handful.empty?
      i += 1
      i = 0 if i > 13
      i = 0 if i == 13 && @name1 == current_player_name
      i += 1 if i == 6 && @name2 == current_player_name
      @cups[i] << handful.pop unless handful.nil?
      break if handful.nil?
    end
    render
    next_turn(i)
  end

  def next_turn(ending_cup_idx)
    # helper method to determine what #make_move returns
    if ending_cup_idx == 6 || ending_cup_idx == 13
      :prompt
    elsif @cups[ending_cup_idx].length == 1
      :switch
    else
      ending_cup_idx
    end
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    return true if @cups[0..5].all? { |cup| cup.empty? }
    return true if @cups[7..12].all? { |cup| cup.empty? }
    false
  end

  def winner
    case @cups[13].count <=> @cups[6].count
    when 1
      return @name2
    when 0
      return :draw
    when -1
      return @name1
    end
  end
end
