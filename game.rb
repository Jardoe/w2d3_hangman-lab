class Game
  attr_reader(:guessed_letters)
  def initialize(hidden_word)
    @guessed_letters = []
    @hidden_word = hidden_word
  end

  def add_letter(letter)
    @guessed_letters << letter.downcase() if !@guessed_letters.include?(letter.downcase)
  end

  def guess_letter(letter, player)
    if @hidden_word.is_match?(letter) || @guessed_letters.include?(letter)

    else
      player.lose_life()
    end
    add_letter(letter)
  end

  def is_lost?(player)
    return player.lives == 0
  end

  def is_won?()
    return @hidden_word.reveal(@guessed_letters) == @hidden_word.word
  end
end
