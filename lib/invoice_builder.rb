class InvoiceBuilder

  def self.load_invoices(filename='./data/invoices.csv')
    invoice_file = CSV.open(filename, headers: true)
    parse_invoices(invoice_file)
  end

  def self.parse_invoices(invoice_file)
    invoice_totals = []
    invoice_file.collect do |invoice|
      invoice_totals << Invoice.new(invoice)
    end
    Invoice.store_array(invoice_totals)
    return invoice_totals
  end

end