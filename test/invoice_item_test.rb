require './test/support'

module SalesEngine
  class InvoiceItemTest < MiniTest::Unit::TestCase

    def setup
      ItemBuilder.from_csv("./sample/samp_items.csv")
      InvoiceBuilder.from_csv("./sample/samp_invoices.csv")
      @output = InvoiceItemBuilder.from_csv("./sample/samp_invoice_items.csv")
    end
    
    def test_it_exists
      ii = InvoiceItem.random
      assert_kind_of InvoiceItem, ii
    end

    # new test
    def test_find_by_id_finds_single_instance_of_matching_id
      ii = InvoiceItem.find_by_id(5)
      assert_equal 5, ii.id
    end

    def test_ii_paid_returns_collection_of_paid_for_iis
      paid_ii = InvoiceItem.paid_ii
      assert_equal 6, paid_ii.length
    end

    def test_find_all_by_invoice_id_returns_collect_of_invoice_items
      ii = InvoiceItem.find_all_by_invoice_id(1)
      assert_equal 5, ii.length
    end

    # new test
    def test_find_by_item_id_finds_invoice_item_by_item_id
      ii = InvoiceItem.find_by_item_id(539)
      assert_equal 539, ii.item_id
    end

    # new test
    def test_find_all_by_item_id_returns_all_invoice_items_matching_item_id
      ii = InvoiceItem.find_all_by_item_id(539)
      assert_equal 2, ii.length
    end

    # new test
    def find_all_by_quantity_returns_all_invoice_items_matching_quantity
      ii_quantity = InvoiceItem.find_all_by_quantity(1)
      assert_equal 33, ii_quantity.length
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
end