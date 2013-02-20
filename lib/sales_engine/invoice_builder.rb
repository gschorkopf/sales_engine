module SalesEngine
  class InvoiceBuilder

    def self.from_csv(filename='./data/invoices.csv')
      parse CSV.open(filename, headers: true)
    end

    def self.parse(invoice_file)
      invoices = invoice_file.collect do |invoice|
        Invoice.new(invoice)
      end
      Invoice.store(invoices)
    end

  end
end