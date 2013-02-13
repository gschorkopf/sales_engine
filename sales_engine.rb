require 'csv'
require './lib/merchant'
require './lib/invoice'
require './lib/item'
require './lib/customer'
require './lib/invoice_item'
require './lib/transaction'

class SalesEngine

  def initialize

  end

  def startup
    CustomerBuilder.load_customers
    InvoiceBuilder.load_invoices
    InvoiceItemBuilder.load_invoice_items
    ItemBuilder.load_items
    MerchantBuilder.load_merchants
    TransactionBuilder.load_transactions
  end

end