require './test/support'

class InvoiceTest < MiniTest::Unit::TestCase
  
  def setup
    @output = InvoiceBuilder.from_csv("./sample/samp_invoices.csv")
    CustomerBuilder.from_csv("./sample/samp_customers.csv")
    TransactionBuilder.from_csv("./sample/samp_transactions.csv")
    InvoiceItemBuilder.from_csv("./sample/samp_invoice_items.csv")
  end

  def test_it_exists
    invoice = Invoice.new('sample_hash')
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
    assert_equal 5, invoice.length
  end

  def test_find_all_by_customer_id_finds_all_invoices_by_customer_id_string
    invoice = Invoice.find_all_by_customer_id('1')
    assert_equal 5, invoice.length
  end

  def test_find_all_by_merchant_id_finds_all_invoices_by_merchant_id
    invoice = Invoice.find_all_by_merchant_id(26)
    assert_equal 1, invoice.length
  end

  def test_find_all_by_status_finds_all_invoices_by_status
    invoice = Invoice.find_all_by_status('shipped')
    assert_equal 5, invoice.length
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
    # assert_equal XXX, first_invoice.items.length
  end

  def test_customer_method_on_invoice_returns_instance
    first_invoice = @output.first
    assert_equal "Joey", first_invoice.customer.first_name 
  end

end