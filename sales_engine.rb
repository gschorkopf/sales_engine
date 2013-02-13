require 'csv'
require './lib/merchant'
require './lib/invoice'
require './lib/item'
require './lib/customer'
require './lib/invoice_item'
require './lib/transaction'

class SalesEngine
  def initialize
    @merchant_totals = []
    @item_totals = []
    @invoice_item_totals = []
    @transaction_totals = []
  end

  def startup
    load_merchants
    # InvoiceBuilder.load_invoices
    load_items
    # CustomerBuilder.load_customers
    # InvoiceItemBuilder.load_invoice_items
    load_transactions
  end

  def load_merchants
    merchant_file = CSV.open('./data/merchants.csv', headers: true, header_converters: :symbol)
    parse_merchants(merchant_file)
  end

  def parse_merchants(merchant_file)
    merchant_file.each do |merchant|
      merchant  = {
                id: merchant[:id],
                name: merchant[:name],
                created_at: merchant[:created_at],
                updated_at: merchant[:updated_at],
                   }
      @merchant_totals << merchant
    end
    # Merchant.new(@merchant_totals)
    puts "#{@merchant_totals.size} total Merchants."
  end

  def load_items
    item_file = CSV.open('./data/items.csv', headers: true, header_converters: :symbol)
    parse_items(item_file)
  end

  def parse_items(item_file)
    item_file.each do |item|
      item  = {
                id: item[:id],
                name: item[:name],
                description: item[:description],
                unit_price: item[:unit_price],
                merchant_id: item[:merchant_id],
                created_at: item[:created_at],
                updated_at: item[:updated_at],
                   }
      @item_totals << item
    end
    # Item.new(@item_totals)
    puts "#{@item_totals.size} total Items."
  end

  def load_transactions
    transaction_file = CSV.open('./data/transactions.csv', headers: true, header_converters: :symbol)
    parse_transactions(transaction_file)
  end

  def parse_transactions(transaction_file)
    transaction_file.each do |transaction|
      transaction  = {
                id: transaction[:id],
                invoice_id: transaction[:invoice_id],
                credit_card_number: transaction[:credit_card_number],
                credit_card_expiration_date: transaction[:credit_card_expiration_date],
                result: transaction[:result],
                created_at: transaction[:created_at],
                updated_at: transaction[:updated_at],
                   }
      @transaction_totals << transaction
    end
    # Transaction.new(@transaction_totals)
    puts "#{@transaction_totals.size} total Transactions."
  end

end

SalesEngine.new.startup
puts "Phew!"

