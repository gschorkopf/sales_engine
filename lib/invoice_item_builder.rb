class InvoiceItemBuilder
  def self.load_invoice_items
    invoice_item_file = CSV.open('./data/invoice_items.csv', headers: true, header_converters: :symbol)
    parse_invoice_item_items(invoice_item_file)
  end

  def self.parse_invoice_item_items(invoice_item_file)
    invoice_item_totals = []
    invoice_item_file.each do |invoice_item|
      invoice_item  = {
                id: invoice_item[:id],
                item_id: invoice_item[:item_id],
                invoice_id: invoice_item[:invoice_id],
                quantity: invoice_item[:quantity],
                unit_price: invoice_item[:unit_price],
                created_at: invoice_item[:created_at],
                updated_at: invoice_item[:updated_at],
                   }
      invoice_item_totals << invoice_item
    end
    # InvoiceItem.new(@invoice_item_totals)
    return invoice_item_totals
  end

end