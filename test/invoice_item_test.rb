require './test/support'

class InvoiceItemTest < MiniTest::Unit::TestCase
  
  def test_it_exists
    invoice_item = InvoiceItem.new
    assert_kind_of InvoiceItem, invoice_item
  end

end