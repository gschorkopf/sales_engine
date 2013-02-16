require 'csv'
require './lib/merchant'
require './lib/invoice'
require './lib/item'
require './lib/customer'
require './lib/invoice_item'
require './lib/transaction'

class SalesEngine

  def startup
    CustomerBuilder.from_csv
    InvoiceBuilder.from_csv
    InvoiceItemBuilder.from_csv
    ItemBuilder.from_csv
    MerchantBuilder.from_csv
    TransactionBuilder.from_csv
  end

end