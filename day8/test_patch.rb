require_relative "patch"
require "test/unit"
 
class TestPatch < Test::Unit::TestCase

  def test_patch
    sample_patch = "30373\n25512\n65332\n33549\n35390"
    patch = Patch.new(5, 5)
    patch.parse(sample_patch.split("\n"))
    #patch.draw(0, 0, 5)
    assert_equal("7", patch.get(0, 3).to_s)
    assert_equal(0, patch.get(0, 3).row)
    assert_equal(3, patch.get(0, 3).col)
    assert_equal(true, patch.get(0, 3).is_edge)
    assert_equal(false, patch.get(1, 1).is_edge)
    assert_equal("1", patch.get(1, 3).to_s)
    assert_equal(false, patch.get(1, 3).is_edge)
    assert_equal(true, patch.get(1, 4).is_edge)
    assert_equal("6", patch.get(2, 0).to_s)
    assert_equal(true, patch.get(2, 0).is_edge)
    assert_equal(false, patch.get(2, 2).is_edge)
    assert_equal("4", patch.get(3, 3).to_s)
    assert_equal("9", patch.get(4, 3).to_s)
  end

  def test_surroundings
    sample_patch = "30373\n25512\n65332\n33549\n35390"
    patch = Patch.new(5, 5)
    patch.parse(sample_patch.split("\n"))
    patch.walk
    patch.determine_visible
    assert_equal(true, patch.determine_is_visible(patch.get(1, 1)))
    assert_equal(true, patch.get(1, 2).is_visible)
    assert_equal(false, patch.get(3, 3).is_visible)
  end

  def test_total 
    sample_patch = "30373\n25512\n65332\n33549\n35390"
    patch = Patch.new(5, 5)
    patch.parse(sample_patch.split("\n"))
    patch.walk
    assert_equal(16, patch.get_total_edge)
    assert_equal(5, patch.get_total_visible)
    # Test total visible
    assert_equal(21, patch.get_total_edge + patch.get_total_visible)
    puts "\n"
    patch.draw_visible
  end

  def test_viewing
    sample_patch = "30373\n25512\n65332\n33549\n35390"
    patch = Patch.new(5, 5)
    patch.parse(sample_patch.split("\n"))
    patch.walk
    patch.determine_visible
    assert_equal(8, patch.get(3, 2).viewing)
    assert_equal(4, patch.get(1, 2).viewing)
  end 
 
end