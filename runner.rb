require_relative("game")
require_relative("player")
require_relative("hidden_word")

puts "Welcome to Snowman!!"
puts "- hangman knockoff -"
puts "Please enter the \"secret word(s)\", player 1:"

input = gets.chomp()
system "clear"

puts "Please hand over to player 2..."
puts "Please enter your name, player 2:"

name = gets.chomp()
system "clear"

hidden_word = HiddenWord.new(input)
game = Game.new(hidden_word)
player = Player.new(name)

while true
  puts
  puts player.make_snowman()
  puts "You've so far guessed #{game.guessed_letters()}"
  puts "Guess the remaining letters:"
  puts hidden_word.reveal(game.guessed_letters())
  letter = gets.chomp()
  state = game.guess_letter(letter, player)
  case state
  when "already guessed"
    puts "You already guessed that letter, #{player.name()}! Try again!"
  when "correct"
    if game.is_won?
      puts "Congratulations #{player.name()}!!! You won at Snowman!!"
      break
    else
      puts "That letter was correct! Keep going!"
    end
  when "incorrect"
    if game.is_lost?(player)
      puts "You lose, sucker!! Your poor snowman melted:"
      puts player.make_snowman()
      break
    else
      puts "Wrong! Your snowman lost something, #{player.name()}. Be more careful! You have #{player.lives()} chance(s) remaining."
    end
  end
end
