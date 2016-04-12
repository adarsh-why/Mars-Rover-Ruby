puts "Co-ordinates of Plateau end"
max_x, max_y = gets.split.map!{|num| num.to_i}

puts "Enter starting position of Rover"
start_pos = gets.split
curr_dir = start_pos[-1].upcase

x,y = start_pos[0..1].map!{|num| num.to_i}

puts "Enter the moves for Rover"
moves = gets.chomp.split('')

def dir_update move, curr_dir
    if curr_dir == 'N'
        return curr_dir = 'W' if move == 'L'
        return curr_dir = 'E' if move == 'R'
    elsif curr_dir == 'E'
        return curr_dir = 'N' if move == 'L'
        return curr_dir = 'S' if move == 'R'
    elsif curr_dir == 'S'
        return curr_dir = 'E' if move == 'L'
        return curr_dir = 'W' if move == 'R'
    elsif curr_dir == 'W'
        return curr_dir = 'S' if move == 'L'
        return curr_dir = 'N' if move == 'R'                
    end
end

def move_update move, x, y, curr_dir
    case curr_dir
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

moves.each do |move|
    if move == 'M'
        x,y = move_update move, x, y, curr_dir
        raise ArgumentError, "Rover is out of the Plateau" if x > max_x or y > max_y
    elsif move == 'L' or move == 'R' 
        curr_dir = dir_update move, curr_dir
    else
        raise ArgumentError, "Wrong input for Rover movement"
    end
end
puts "\n\n#{x}  #{y}  #{curr_dir}"