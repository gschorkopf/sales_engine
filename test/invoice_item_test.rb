require './test/support'

class InvoiceItemTest < MiniTest::Unit::TestCase

  def setup
    @output = InvoiceItemBuilder.from_csv("./sample/samp_invoice_items.csv")
  end
  
  def test_it_exists
    ii = InvoiceItem.new('sample_hash')
    assert_kind_of InvoiceItem, ii
  end

  def test_invoice_method_on_ii_returns_instance_of_invoice
    first_ii = @output.first
    assert_equal 26, first_ii.invoice.merchant_id
  end

  def test_item_method_on_ii_returns_instance_of_item
    # first_ii = @output.first
    # assert_equal (the name of item 539 does not exist), first_ii.item.name
    # # Test will not work without Item Class
  end
end