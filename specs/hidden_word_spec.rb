require("minitest/autorun")
require_relative("../hidden_word")
require_relative("../game")

class HiddenWordTest < MiniTest::Test
  def setup
    @hidden_word = HiddenWord.new("CodeClan Edinburgh")
    @game = Game.new()
  end

  def test_hidden_word_has_word
    assert_equal("CodeClan Edinburgh", @hidden_word.word)
  end

  def test_is_match__true
    assert_equal(true, @hidden_word.is_match?("c"))
  end

  def test_is_match__false
    assert_equal(false, @hidden_word.is_match?("x"))
  end

  # def test_is_match_letter_already_guessed__false
  #   assert_equal(false, @hidden_word.is_match?("C",["c"]))
  # end

  def test_display_no_guessed_letters
    assert_equal("******** *********", @hidden_word.reveal(@game.guessed_letters))
  end

end
