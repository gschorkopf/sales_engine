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
    @invoice_totals = []
    @item_totals = []
    @customer_totals = []
    @invoice_item_totals = []
    @transaction_totals = []
  end

  def startup
    load_merchants
    load_invoices
    load_items
    load_customers
    load_invoice_items
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

  def load_invoices
    invoice_file = CSV.open('./data/invoices.csv', headers: true, header_converters: :symbol)
    parse_invoices(invoice_file)
  end

  def parse_invoices(invoice_file)
    invoice_file.each do |invoice|
      invoice  = {
                id: invoice[:id],
                customer_id: invoice[:customer_id],
                merchant_id: invoice[:merchant_id],
                status: invoice[:status],
                created_at: invoice[:created_at],
                updated_at: invoice[:updated_at],
                   }
      @invoice_totals << invoice
    end
    # Invoice.new(@invoice_totals)
    puts "#{@invoice_totals.size} total Invoices."
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

  def load_customers
    customer_file = CSV.open('./data/customers.csv', headers: true, header_converters: :symbol)
    parse_customers(customer_file)
  end

  def parse_customers(customer_file)
    customer_file.each do |customer|
      customer  = {
                id: customer[:id],
                first_name: customer[:first_name],
                last_name: customer[:last_name],
                created_at: customer[:created_at],
                updated_at: customer[:updated_at],
                   }
      @customer_totals << customer
    end
    # Customer.new(@customer_totals)
    puts "#{@customer_totals.size} total Customers."
  end

  def load_invoice_items
    invoice_item_file = CSV.open('./data/invoice_items.csv', headers: true, header_converters: :symbol)
    parse_invoice_item_items(invoice_item_file)
  end

  def parse_invoice_item_items(invoice_item_file)
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
      @invoice_item_totals << invoice_item
    end
    # InvoiceItem.new(@invoice_item_totals)
    puts "#{@invoice_item_totals.size} total Invoice Items."
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

