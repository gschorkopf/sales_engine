require './test/support'

class InvoiceItemTest < MiniTest::Unit::TestCase

  def setup
    InvoiceItemBuilder.from_csv("./sample/samp_invoice_items.csv")
  end
  
  def test_it_exists
    invoice_item = InvoiceItem.new('sample_hash')
    assert_kind_of InvoiceItem, invoice_item
  end

end