require './test/support'

module SalesEngine
  class InvoiceItemBuilderTest < MiniTest::Unit::TestCase
    
    def setup
      @output = InvoiceItemBuilder.from_csv("./sample/samp_invoice_items.csv")
    end

    def test_it_exists
      inv_item_builder = InvoiceItemBuilder.new
      assert_kind_of InvoiceItemBuilder, inv_item_builder
    end

    def test_it_builds_invoice_items_from_a_csv
      assert_operator 5, :<=, @output.size
    end

  end
end