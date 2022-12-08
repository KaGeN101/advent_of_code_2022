require_relative "patch"
require "test/unit"
 
class TestPatch < Test::Unit::TestCase

    
 
  def test_patch
    sample_patch = "30373\n25512\n65332\n33549\n35390"
    patch = Patch.new(5, 5)
    patch.parse(sample_patch.split("\n"))
    #patch.draw(0, 0, 5)
    assert_equal("7", patch.get(0, 3))
    assert_equal("1", patch.get(1, 3))
    assert_equal("6", patch.get(2, 0))
    assert_equal("4", patch.get(3, 3))
    assert_equal("9", patch.get(4, 3))
  end
 
end