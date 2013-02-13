require './test/support'

class InvoiceTest < MiniTest::Unit::TestCase
  
  def test_it_exists
    invoice = Invoice.new
    assert_kind_of Invoice, invoice
  end

end