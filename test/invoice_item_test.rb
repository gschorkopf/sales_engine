require './test/support'

class InvoiceItemTest < MiniTest::Unit::TestCase

  def setup
    InvoiceItemBuilder.from_csv("./sample/samp_invoice_items.csv")
  end
  
  def test_it_exists
    invoice_item = InvoiceItem.new('sample_hash')
    assert_kind_of InvoiceItem, invoice_item
  end

  def test_random_returns_random_instance
    ### placeholder
  end

  def test_find_by_id_finds_single_instance_of_match
    ii = InvoiceItem.find_by_id(2)
    assert_equal 2, ii.id
  end

  def test_find_by_item_id_finds_single_instance_of_match
    ii = InvoiceItem.find_by_item_id(523)
    assert_equal 523, ii.item_id
  end

  def test_find_by_invoice_id_finds_single_instance_of_match
    ii = InvoiceItem.find_by_invoice_id(1)
    assert_equal 1, ii.invoice_id
  end

  def test_find_by_quantity_finds_single_instance_of_match
    ii = InvoiceItem.find_by_quantity(5)
    assert_equal 5, ii.quantity
  end

  def test_find_by_unit_price_finds_single_instance_of_match
    ii = InvoiceItem.find_by_unit_price(13635)
    assert_equal 13635, ii.unit_price
  end

  def test_find_all_by_id_finds_all_matching_results
    ii = InvoiceItem.find_all_by_id(1)
    assert_equal 1, ii.length
  end

  def test_find_all_by_item_id_finds_all_matching_results
    ii = InvoiceItem.find_all_by_item_id(529)
    assert_equal 1, ii.length
  end

  def test_find_all_by_invoice_id_finds_all_matching_results
    ii = InvoiceItem.find_all_by_invoice_id(1)
    assert_equal 5, ii.length
  end

  def test_find_all_by_quantity_finds_all_matching_results
    ii = InvoiceItem.find_all_by_quantity(8)
    assert_equal 1, ii.length
  end

  def test_find_all_by_unit_price_finds_all_matching_results
    ii = InvoiceItem.find_all_by_unit_price(79140)
    assert_equal 1, ii.length
  end

end