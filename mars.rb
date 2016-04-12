puts "Co-ordinates of Plateau end"
max_x, max_y = gets.split.map!{|num| num.to_i}

puts "Enter starting position of Rover"
start_position = gets.split
rover_angle = start_position[-1].upcase

x,y = start_position[0..1].map!{|num| num.to_i}

puts "Enter the moves for Rover"
rover_moves = gets.chomp.split('')

def update_rover_angle move, rover_angle
    if rover_angle == 'N'
        return rover_angle = 'W' if move == 'L'
        return rover_angle = 'E' if move == 'R'
    elsif rover_angle == 'E'
        return rover_angle = 'N' if move == 'L'
        return rover_angle = 'S' if move == 'R'
    elsif rover_angle == 'S'
        return rover_angle = 'E' if move == 'L'
        return rover_angle = 'W' if move == 'R'
    elsif rover_angle == 'W'
        return rover_angle = 'S' if move == 'L'
        return rover_angle = 'N' if move == 'R'                
    end
end

def move_update move, x, y, rover_angle
    case rover_angle
        when 'N'
        return x, y+1
        when 'E'
        return x+1, y
        when 'W'
        return x-1, y
        when 'S'
        return x, y-1
    end
end

rover_moves.each do |move|
    if move == 'M'
        x,y = move_update move, x, y, rover_angle
        raise ArgumentError, "Rover is out of the Plateau" if x > max_x or y > max_y
    elsif move == 'L' or move == 'R' 
        rover_angle = update_rover_angle move, rover_angle
    else
        raise ArgumentError, "Wrong input for Rover movement"
    end
end
puts "\n#{x}  #{y}  #{rover_angle}\n"