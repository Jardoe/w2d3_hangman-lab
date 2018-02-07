require("minitest/autorun")
require_relative("../player")

class TestPlayer < MiniTest::Test
  def setup()
    @player = Player.new("Bob")
  end

  def test_player_has_name()
    assert_equal("Bob", @player.name())
  end

  def test_player_has_6_starting_lives()
    assert_equal(6, @player.lives())
  end

  def test_player_lose_life
    @player.lose_life()
    assert_equal(5, @player.lives())
  end
end
