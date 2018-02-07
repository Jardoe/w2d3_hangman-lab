class Player
  attr_reader(:name, :lives)

  def initialize(name)
    @name = name
    @lives = 6
  end

  def lose_life()
    @lives -= 1
  end

  def make_snowman() # not tested!!
    case @lives
    when 6
      return "  _[]_\nW (\")\n|-(:')-<\n|('  )"
    when 5
      return "W (\")\n|-(:')-<\n|('  )"
    when 4
      return "  (\")\n  (:')-<\n ('  )"
    when 3
      return "  (\")\n  (:')  \n ('  )"
    when 2
      return "  (\")\n  (:')  "
    when 1
      return "  (\")"
    when 0
      return "   .. "
    end
  end
end
