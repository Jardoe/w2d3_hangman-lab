class HiddenWord
  attr_reader (:word)

  def initialize(word)
    @word = word
  end

  def is_match?(letter)
    @word.each_char do |c|
      return true if c.downcase() == letter
    end
    return false
  end

  def reveal(guessed_letters)
    str = ""
    @word.each_char do |c|
      match = false
      for letter in guessed_letters
        match = true if c.downcase() == letter
      end

      if match || c == " "
        str += c
      else
        str += "*"
      end
    end
    return str
  end
end
