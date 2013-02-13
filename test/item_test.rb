require './test/support'

class ItemTest < MiniTest::Unit::TestCase
  
  def test_it_exists
    item = Item.new
    assert_kind_of Item, item
  end
end