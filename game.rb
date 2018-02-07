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
    return "already guessed" if @guessed_letters.include?(letter)
    add_letter(letter)
    if @hidden_word.is_match?(letter)
      return "correct"
    else
      player.lose_life()
      return "incorrect"
    end
  end

  def is_lost?(player)
    return player.lives == 0
  end

  def is_won?()
    return @hidden_word.reveal(@guessed_letters) == @hidden_word.word
  end
end
