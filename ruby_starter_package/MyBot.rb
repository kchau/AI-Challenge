$:.unshift File.dirname($0)
require 'ants.rb'

ai=AI.new

ai.setup do |ai|
	# your setup code here, if any
end

ai.run do |ai|
	# your turn code here
	
  @orders = {}
  @f_targets = {}

  def do_move_direction(ant, dir)
    new_loc = ant.destination(dir)
    if new_loc.unoccupied? and !@orders[new_loc]
      ant.order dir
      @orders[new_loc] = ant.square
      return true
    else
      return false
    end
  end

  def do_move_location(ant, dest)
    directions = ant.square.directions(dest)
    directions.each do |dir|
      if do_move_direction(ant, dir)
        @targets[dest] = ant.square
        return true
      end
    end
    return false
  end

	ai.my_ants.each do |ant|
    
		# try to go north, if possible; otherwise try east, south, west.
		[:N, :E, :S, :W].each do |dir|
      break if do_move_direction(ant, dir)
			#if ant.square.neighbor(dir).land?
			#	ant.order dir
			#	break
			#end
		end
	end
end
