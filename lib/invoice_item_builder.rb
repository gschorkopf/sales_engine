class InvoiceItemBuilder

  def self.load_invoice_items(filename="./data/invoice_items.csv")
    invoice_item_file = CSV.open(filename, headers: true)
    parse_invoice_item_items(invoice_item_file)
  end

  def self.parse_invoice_item_items(invoice_item_file)
    invoice_item_totals = []
    invoice_item_file.collect do |invoice_item|
      invoice_item_totals << InvoiceItem.new(invoice_item)
    end
    InvoiceItem.store_array(invoice_item_totals)
    return invoice_item_totals
  end
end