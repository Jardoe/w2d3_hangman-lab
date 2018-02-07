require("minitest/autorun")
require_relative("../game")
require_relative("../hidden_word")
require_relative("../player")

class TestGame < MiniTest::Test
  def setup()
    @hidden_word = HiddenWord.new("CodeClan Edinburgh")
    @game = Game.new(@hidden_word)
    @player = Player.new("Steve")
  end

  def test_game_has_guessed_letters__none
    assert_equal([], @game.guessed_letters())
  end

  def test_game_add_letter__lowercase
    @game.add_letter("c")
    assert_equal(["c"], @game.guessed_letters())
  end

  def test_game_add_letter__uppercase
    @game.add_letter("C")
    assert_equal(["c"], @game.guessed_letters())
  end

  def test_game_add_letter__dont_add_duplicate
    @game.add_letter("C")
    @game.add_letter("C")
    assert_equal(["c"], @game.guessed_letters())
  end

  def test_game_guess_letter__duplicate_lose_1_life
    @game.guess_letter("z", @player)
    @game.guess_letter("z", @player)
    assert_equal(["z"], @game.guessed_letters())
    assert_equal(5, @player.lives())
  end

  def test_game_lose_life_for_wrong_guess
    @game.guess_letter("z", @player)
    assert_equal(5, @player.lives())
  end


  def test_is_lost__false
    assert_equal(false, @game.is_lost?(@player))
  end

  def test_is_lost__true
    6.times{@player.lose_life}
    assert_equal(true, @game.is_lost?(@player))
  end

  def test_is_won__true
    @game.add_letter("C")
    @game.add_letter("o")
    @game.add_letter("d")
    @game.add_letter("e")
    @game.add_letter("l")
    @game.add_letter("a")
    @game.add_letter("n")
    @game.add_letter("i")
    @game.add_letter("b")
    @game.add_letter("u")
    @game.add_letter("r")
    @game.add_letter("g")
    @game.add_letter("h")
    assert_equal(true, @game.is_won?())
  end

  def test_is_won__false
    assert_equal(false, @game.is_won?)
  end


end
