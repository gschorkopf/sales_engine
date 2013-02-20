require './test/support'

module SalesEngine
  class InvoiceTest < MiniTest::Unit::TestCase
    
    def setup
      @output = InvoiceBuilder.from_csv("./sample/samp_invoices.csv")
      CustomerBuilder.from_csv("./sample/samp_customers.csv")
      TransactionBuilder.from_csv("./sample/samp_transactions.csv")
      InvoiceItemBuilder.from_csv("./sample/samp_invoice_items.csv")
      ItemBuilder.from_csv("./sample/samp_items.csv")
    end

    def test_it_exists
      invoice = Invoice.random
      assert_kind_of Invoice, invoice
    end

    def test_random_returns_random_instance
      invoice1 = Invoice.random
      @output.delete(invoice1)
      invoice2 = Invoice.random
      refute_equal invoice1, invoice2
    end

    def test_find_by_id_finds_single_instance_of_match
      invoice = Invoice.find_by_id(2)
      assert_equal 2, invoice.id
    end

    def test_find_by_customer_id_finds_single_instance_of_match
      invoice = Invoice.find_by_customer_id(1)
      assert_equal 1, invoice.customer_id
    end

    def test_find_by_merchant_id_finds_single_instance_of_match
      invoice = Invoice.find_by_merchant_id(75)
      assert_equal 75, invoice.merchant_id
    end

    def test_find_by_status_finds_single_instance_of_match
      invoice = Invoice.find_by_status('shipped')
      assert_equal 'shipped', invoice.status
    end

    def test_find_by_status_with_caps_parameter_still_finds_single_instance_of_match
      invoice = Invoice.find_by_status('sHiPpEd')
      assert_equal 'shipped', invoice.status
    end

    def test_find_all_id_finds_all_invoices_by_id
      invoice = Invoice.find_all_by_id(2)
      assert_equal 1, invoice.length
    end

    def test_find_all_by_customer_id_finds_all_invoices_by_customer_id
      invoice = Invoice.find_all_by_customer_id(1)
      assert_equal 6, invoice.length
    end

    def test_find_all_by_customer_id_finds_all_invoices_by_customer_id_string
      invoice = Invoice.find_all_by_customer_id('1')
      assert_equal 6, invoice.length
    end

    def test_find_all_by_merchant_id_finds_all_invoices_by_merchant_id
      invoice = Invoice.find_all_by_merchant_id(26)
      assert_equal 1, invoice.length
    end

    def test_find_all_by_status_finds_all_invoices_by_status
      invoice = Invoice.find_all_by_status('shipped')
      assert_equal 8, invoice.length
    end

    def test_transaction_method_on_invoice_returns_collection
      first_invoice = @output.first
      assert_equal 1, first_invoice.transactions.length
    end

    def test_iis_method_on_invoice_returns_collection
      first_invoice = @output.first
      assert_equal 5, first_invoice.invoice_items.length
    end

    def test_items_method_on_invoice_returns_collection
      first_invoice = @output.first
      assert_equal 5, first_invoice.items.length
    end

    def test_customer_method_on_invoice_returns_instance
      first_invoice = @output.first
      assert_equal "Joey", first_invoice.customer.first_name 
    end

    def test_an_invoice_is_paid_when_it_has_a_successful_transaction
      invoice = Invoice.new('id' => 1234)
      transaction = Transaction.new('invoice_id' => 1234, 'result' => 'success')
      invoice.transactions << transaction
      assert invoice.paid?, 'invoice should be paid!'
    end

    def test_an_invoice_is_not_paid_when_it_has_no_transactions
      invoice = Invoice.new('id' => 1234567890)
      refute invoice.paid?, 'invoice should not be paid!'
    end

    def test_an_invoice_is_not_paid_when_it_has_only_a_failed_transaction
      invoice = Invoice.new('id' => 1234)
      transaction = Transaction.new('invoice_id' => 1234, 'result' => 'failed')
      invoice.transactions << transaction
      refute invoice.paid?, 'invoice should fail!'
    end

    def test_an_invoice_is_pending_when_it_is_not_paid
      invoice = Invoice.new('id' => 12321381203)
      assert invoice.pending?
    end

    def test_an_invoice_is_not_pending_when_it_is_paid
      invoice = Invoice.new('id' => 12321381203)
      transaction = Transaction.new('id' => 12321381203, 'result' => 'success')
      invoice.transactions << transaction
      refute invoice.pending?
    end

    class MockCustomer
      def id
        1234
      end
    end

    class MockMerchant
      def id
        5678
      end
    end

    def invoice_creation_data
      customer = MockCustomer.new
      merchant = MockMerchant.new
      {merchant: merchant, customer: customer}
    end

    def test_a_created_invoice_has_a_customer
      invoice = Invoice.create(invoice_creation_data)
      assert_equal invoice_creation_data[:customer].id, invoice.customer_id
    end

    def test_a_created_invoice_has_a_merchant
      invoice = Invoice.create(invoice_creation_data)
      assert_equal invoice_creation_data[:merchant].id, invoice.merchant_id
    end

  end
end