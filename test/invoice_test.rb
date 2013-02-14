require './test/support'

class InvoiceTest < MiniTest::Unit::TestCase
  
  def setup
    InvoiceBuilder.load_invoices("./sample/samp_invoices.csv")
  end

  def test_it_exists
    invoice = Invoice.new('sample_hash')
    assert_kind_of Invoice, invoice
  end

  def test_find_by_customer_id_finds_all_invoices_by_customer_id
    invoice = Invoice.find_all_by_customer_id("1")
    assert_operator 5, :==, invoice.length
  end

end