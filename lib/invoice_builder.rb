class InvoiceBuilder

  def self.load_invoices
    invoice_file = CSV.open('./data/invoices.csv', headers: true, header_converters: :symbol)
    parse_invoices(invoice_file)
  end

  def self.parse_invoices(invoice_file)
    invoice_totals = []
    invoice_file.each do |invoice|
      invoice  = {
                id: invoice[:id],
                customer_id: invoice[:customer_id],
                merchant_id: invoice[:merchant_id],
                status: invoice[:status],
                created_at: invoice[:created_at],
                updated_at: invoice[:updated_at],
                   }
      invoice_totals << invoice
    end
    # Invoice.new(@invoice_totals)
    return invoice_totals
  end

end