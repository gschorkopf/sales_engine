require './test/support'

class InvoiceItemTest < MiniTest::Unit::TestCase

  def setup
    ItemBuilder.from_csv("./sample/samp_items.csv")
    InvoiceBuilder.from_csv("./sample/samp_invoices.csv")
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
    first_ii = @output.first
    assert_equal "Item Sunt Saepe", first_ii.item.name
  end
end