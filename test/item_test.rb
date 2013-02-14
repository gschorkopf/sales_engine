require './test/support'

class ItemTest < MiniTest::Unit::TestCase
  
  def setup
    ItemBuilder.load_items("./sample/samp_items.csv")
  end

  def test_it_exists
    item = Item.new('sample_hash')
    assert_kind_of Item, item
  end

  # def test_find_invoice_finds_associated_invoice
  #   Item = Item.find_associated_invoice("987")
  #   assert_equal 987, :==, item_invoice_id
  # end

end