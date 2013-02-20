module SalesEngine
  class InvoiceItemBuilder

    def self.from_csv(filename="./data/invoice_items.csv")
      parse CSV.open(filename, headers: true)
    end

    def self.parse(invoice_item_file)
      invoice_items = invoice_item_file.collect do |invoice_item|
        InvoiceItem.new(invoice_item)
      end
      InvoiceItem.store(invoice_items)
    end
  end
end