require './test/support'

class InvoiceItemTest < MiniTest::Unit::TestCase

  def setup
    InvoiceItemBuilder.load_invoice_items("./sample/samp_invoice_items.csv")
  end
  
  def test_it_exists
    invoice_item = InvoiceItem.new('sample_hash')
    assert_kind_of InvoiceItem, invoice_item
  end

  def test_find_by_all_quantity_finds_matching
    quantity_invitem = InvoiceItem.find_all_by_quantity('8')
    assert_equal 1, quantity_invitem.length
  end

end