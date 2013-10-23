def play_towers(num_discs, towers)
  towers[0] = (1..num_discs).to_a
  towers[1] =  []
  towers[2] =  []

  while !check_victory?(towers)
    valid_move = false


    while !valid_move do
      print_towers(towers)
      puts "Which tower do you want to remove a disc from?"
      from = gets.chomp.to_i - 1
      puts "Which tower will you place a disc on?"
      to = gets.chomp.to_i - 1
      valid_move = check_move?(from, to, towers)
      puts "Your move is not valid" unless valid_move
    end

    move_disc(from, to, towers)
  end

  puts "You win!"
end

def print_towers(towers)
  p towers[0]
  p towers[1]
  p towers[2]
end

def check_move?(from, to, towers)
  !towers[from].empty? && (towers[to].empty? || towers[to][-1] > towers[from][-1])
end

def move_disc(from, to, towers)
  towers[to] << towers[from].pop
end

def check_victory?(towers)
  towers[0].empty? && towers[1].empty?
end

hanoi_towers = []
puts "How many discs do you want to use?"
disc_num = gets.chomp.to_i
play_towers(disc_num, hanoi_towers)