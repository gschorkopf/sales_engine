require 'csv'
require 'date'
require 'bigdecimal'

require 'sales_engine/merchant'
require 'sales_engine/invoice'
require 'sales_engine/item'
require 'sales_engine/customer'
require 'sales_engine/invoice_item'
require 'sales_engine/transaction'
require 'sales_engine/clean'
require 'sales_engine/customer_builder'
require 'sales_engine/invoice_builder'
require 'sales_engine/invoice_item_builder'
require 'sales_engine/item_builder'
require 'sales_engine/merchant_builder'
require 'sales_engine/transaction_builder'

module SalesEngine
  def self.startup
    CustomerBuilder.from_csv
    InvoiceBuilder.from_csv
    InvoiceItemBuilder.from_csv
    ItemBuilder.from_csv
    MerchantBuilder.from_csv
    TransactionBuilder.from_csv
  end

end