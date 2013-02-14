require './test/support'

class InvoiceBuilderTest < MiniTest::Unit::TestCase
  
  def setup
    @output = InvoiceBuilder.from_csv("./sample/samp_invoices.csv")
  end

  def test_it_exists
    inv_builder = InvoiceBuilder.new
    assert_kind_of InvoiceBuilder, inv_builder
  end

  def test_it_builds_invoices_from_a_csv
    assert_operator 5, :<=, @output.size
  end

end