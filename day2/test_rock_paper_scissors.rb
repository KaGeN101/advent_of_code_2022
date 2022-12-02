

require_relative "rock_paper_scissors"
require "test/unit"
 
class TestRockPaperScissors < Test::Unit::TestCase
 
  def test_outcome
    rps = RockPaperScissors.new()
    # Loss with Rock
    assert_equal(1, rps.outcome("B", "X"))
    # Loss with Paper
    assert_equal(2, rps.outcome("C", "Y"))
    # Loss With Scissor
    assert_equal(3, rps.outcome("A", "Z"))
    # Draw with Rock
    assert_equal(4, rps.outcome("A", "X"))  
    # Draw with Paper
    assert_equal(5, rps.outcome("B", "Y"))
    # Draw with Scissor
    assert_equal(6, rps.outcome("C", "Z"))
    # Win with Rock
    assert_equal(7, rps.outcome("C", "X"))
    # Win with Paper
    assert_equal(8, rps.outcome("A", "Y"))
    # Win with Scissor
    assert_equal(9, rps.outcome("B", "Z"))
  end
 
end